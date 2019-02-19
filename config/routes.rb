Rails.application.routes.draw do
   root 'events#index'
     resources :events
     resources :charges 
    post 'events/:id/subscride', to: 'events#subscride', as: 'event_subsride'
   devise_for :users
   resources :users, only: [:show,:edit,:update]
  # get 'events/index'
 
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
