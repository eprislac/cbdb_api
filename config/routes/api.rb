namespace :api do
  namespace :v1 do
    resources :users
    get "users/by_enc_str/:enc_str",
      to: "users#by_enc_str",
      as: :user_by_enc_str
    get "/:email/collections",
      to: "collections#index",
      as: :user_collections
    get ":email/collections/:id",
      to: "collections#show",
      as: :user_collection
    post "/:email/collections",
      to: "collections#create",
      as: :create_user_collection
    put "/:email/collections/:id",
      to: "collections#update",
      as: :update_user_collection
    delete "/:email/collections/:id",
      to: "collections#destroy",
      as: :delete_user_collection

    get "/:email/collection/:collection_id/items",
      to: "collection_items#index",
      as: :collection_items
    get "/:email/collection/:collection_id/items/:id",
      to: "collection_items#show",
      as: :collection_item
    post "/:email/collection/:collection_id/items",
      to: "collection_items#create",
      as: :create_collection_item
    put "/:email/collection/:collection_id/items/:id",
      to: "collection_items#update",    
    resources :publishers
    resources :publications
    resources :publication_types
    resources :creators
    resources :by_lines
    resources :conditions
    resources :issues

  end
end
