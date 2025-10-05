namespace :api do
  namespace :v1 do
    resources :users,  defaults: { format: "json" }

    get "users/by_enc_str/:enc_str",
      to: "users#by_enc_str",
      as: :user_by_enc_str,
      format: "json"

    get "/:email/collections",
      to: "collections#index",
      as: :user_collections
    get "/:email/collections/:id",
      to: "collections#show",
      as: :user_collection
    post "/:email/collections",
      to: "collections#create",
      as: :create_user_collection
    put "/:email/collections/:id",
      to: "collections#update",
      as: :update_user_collection
    patch "/:email/collections/:id",
      to: "collections#update"
    delete "/:email/collections/:id",
      to: "collections#destroy",
      as: :delete_user_collection
    get "/:email/collections/:collection_id/items",
      to: "collection_items#index",
      as: :collection_items
    get "/:email/collections/:collection_id/items/:id",
      to: "collection_items#show",
      as: :collection_item
    post "/:email/collections/:collection_id/items",
      to: "collection_items#create",
      as: :create_collection_item
    put "/:email/collections/:collection_id/items/:id",
      to: "collection_items#update"
    patch "/:email/collections/:collection_id/items/:id",
      to: "collection_items#update",
      as: :update_collection_item
    delete "/:email/collections/:collection_id/items/:id",
      to: "collection_items#destroy",
      as: :delete_collection_item

    resources :publishers, defaults: { format: "json" }
    resources :publications, defaults: { format: "json" }
    resources :creators, defaults: { format: "json" }
    resources :publication_types, defaults: { format: "json" }
    resources :by_lines, defaults: { format: "json" }
    resources :conditions, defaults: { format: "json" }
    resources :issues, defaults: { format: "json" }
    resources :covers, defaults: { format: "json" }
    resources :credits, defaults: { format: "json" }
  end
end
