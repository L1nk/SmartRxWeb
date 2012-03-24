Drugs::Application.routes.draw do

  #get "manage_caregiver/index"
  resources :manage_caregiver do
    collection do
      get 'index'
      post 'index'
    end
  end

  match "caregiver_requests/:id/accept" => "caregiver_requests#accept"
  resources :caregiver_requests do
    collection do
      get 'manage'
      post 'manage'
    end
  end

  get "view_schedule/basic_view"
  
  resources :events_list do
    collection do
      get 'index'
      post 'index'
    end
  end
  
  resources :medications_list do
    collection do
      get 'index'
      post 'index'
    end
  end
  
  resources :event_conflicts

  resources :events
  post "events/new"
  post "events/create_event_entry"

  resources :checklist do
    collection do
      get 'index'
      post 'index'
    end
  end

  resources :manage_entries do
    collection do
      get 'index'
      post 'index'
    end
  end

  resources :view_schedule do
    collection do
      get 'index'
      post 'index'
    end
  end

  #get "view_schedule/index"

  match ":id/patient_schedule" => "home#patient_schedule"
  resources :home do
    collection do
      get 'index'
      post 'index'
    end
  end
  
  #get "home/index"

  resources :caregiver_to_schedules

  resources :caregiver_permission_levels

  devise_for :users, :controllers => { :registrations => 'registrations',
				       :sessions => 'sessions'}

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  resources :users, :controllers => "users"

  resources :medication_conflicts

  resources :medications
  post "medications/new"
  post "medications/create_medication_entry"

  resources :alerts

  #resources :schedule_to_entries

  resources :entries

  resources :schedules

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end
  #Cancel my account
  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index', :as => 'home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
