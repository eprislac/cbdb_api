namespace :api do
  namespace :v1 do
    resources :users
    get "users/by_enc_str/:enc_str",
      to: "users#by_enc_str",
      as: :user_by_enc_str
  end
end
