Rails.application.routes.draw do

  

  

  get 'warehouse/index'

  get 'contracts/index'

  get 'contracts/new'

  get 'contracts/edit'

  get 'account_activations/edit'

  get 'sessions/new'

  root 'static_pages#home'
  get 'help'      => 'static_pages#help'
  get 'about'     => 'static_pages#about'
  get 'contact'   => 'static_pages#contact'
  get 'signup'    => 'users#new'
  get 'login'     => 'sessions#new'
  post 'login'    => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  get 'leaves' => 'leaves#index'
  get 'leaves/new' => 'leaves#new'
  
  
  
  #get 'pranim_malli' => 'warehouse_documents#pranim_malli'
  get '/warehouse_documents/pranim_malli' => 'warehouse_documents#pranim_malli'
  post '/warehouse_documents/pranim_malli' => 'warehouse_documents#create'
  get '/warehouse_documents/dalje', to: 'warehouse_documents#dalje', as: 'depo_dalje'
  get 'newd' => 'warehouse_documents#newd'
  post '/warehouse_documents/dalje' => 'warehouse_documents#create_dalje'
  get '/warehouse_documents/:warehouse_document_id/warehouse_details/daljedet', to: 'warehouse_details#daljedet', as: 'details_dalje'
  get 'newdt' => 'warehouse_details#new_dalje'
  get 'warehouse_documents/:warehouse_document_id/warehouse_details/anulo_furnizimin', to: 'warehouse_details#anulo_furnizimin', as: 'anulo_furnizimin'
  
  get '/warehouse_documents/:warehouse_document_id/warehouse_details/newart_dalje', to: 'warehouse_details#newart_dalje', as: 'newart_dalje'
  
  post '/warehouse_documents/:warehouse_document_id/warehouse_details/create_art_dalje', to: 'warehouse_details#create_art_dalje', as: 'create_art_dalje'
  
  get '/warehouse-details/artikujt-per-kartele', to: 'warehouse_details#artikujt_per_kartele', as: 'artikujt_per_kartele'
  get '/warehouse-details/kartela-artikullit', to: 'warehouse_details#kartela_artikullit', as: 'kartela_artikullit'
 
  
  #get '/warehouse_documents/show' => 'warehouse_documents#show'
  
  resources :users, except: [:delete]
  resources :leaves, only: [:create, :destroy]
  
  resources :contract_comments
  
  resources :contracts, except: [:delete] do
    resources :contract_comments, :only => [:create, :index, :new]
  end
  
  
  
  resources :suppliers, except: [:delete]
  
  resources :items, except: [:delete]
  
  resources :warehouse_documents, except: [:delete] do 
    resources :warehouse_details, :only => [:create, :index, :new]
  end
   
  
  resources :account_activations, only: [:edit]
  
  # Komenti qe e kom shtu kur e kom fshi gabimisht routes.rb prej serverit
  # Komenti mbas komentit

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
