# spec/lib/encryption_service_spec.rb
require 'rails_helper'
require 'rbnacl'
require 'base64'

RSpec.describe EncryptionService do
  let(:key) { RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes) }
  let(:app_secret) { key.unpack1('H*') } # Convert key to hex for APP_SECRET
  let(:nonce) { RbNaCl::Random.random_bytes(RbNaCl::SecretBox.nonce_bytes) }
  let(:message) { "Hello, World!" }
  let(:box) { RbNaCl::SecretBox.new(key) }
  let(:ciphertext) { box.encrypt(nonce, message) }
  let(:encrypted_text) { "#{Base64.encode64(nonce).strip}:#{Base64.encode64(ciphertext).strip}" }

  before do
    allow(ENV).to receive(:[]).with('APP_SECRET').and_return(app_secret) # Mock APP_SECRET
  end

  describe '.decrypt' do
    it 'decrypts the encrypted text correctly' do
      decrypted_text = EncryptionService.decrypt(encrypted_text)
      expect(decrypted_text).to eq(message) # Expect the decrypted text to match the original message
    end

    it 'returns nil for invalid encrypted text' do
      invalid_encrypted_text = "#{Base64.encode('invalid_nonce')}:#{Base64.encode('invalid_ciphertext')}"
      decrypted_text = EncryptionService.decrypt(invalid_encrypted_text)
      expect(decrypted_text).to be_nil # Expect nil for invalid input
    end
  end
end
