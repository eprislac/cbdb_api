# lib/encryption_service.rb
require "rbnacl"
require "base64"

class EncryptionService
  def self.decrypt(encrypted_text)
    key = [ ENV["APP_SECRET"] ].pack("H*") # Convert hex secret to binary
    nonce_b64, ciphertext_b64 = encrypted_text.split(":") # Split nonce and ciphertext
    Rails.logger.debug("nonce_b64: #{nonce_b64}")
    nonce = Base64.urlsafe_decode64(nonce_b64) # Decode nonce from Base64
    Rails.logger.debug("nonce: #{nonce}")
    Rails.logger.debug("nonce-length: #{nonce.length}")
    cipherText = Base64.urlsafe_decode64(ciphertext_b64) # Decode ciphertext from Base64
    Rails.logger.debug("cipherText: #{cipherText}")
    box = RbNaCl::SecretBox.new(key) # Create a new SecretBox with the key
    Rails.logger.debug("box: #{box}")
    decrypted_message = box.decrypt(nonce, cipherText) # Decrypt the message

    decrypted_message ? decrypted_message : nil # Return decrypted message or nil if failed
  rescue RbNaCl::CryptoError, RbNaCl::LengthError
    nil # Return nil if decryption fails
  end
end
