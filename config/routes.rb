Rails.application.routes.draw do
	namespace :admin do
    root 'event_submissions#index'
    resources :users
    resources :event_submissions, only: [:show,:edit,:index,:destroy,:update]
		root 'event_submissions#index'
    get 'admin/event_submissions/all',to: 'event_submissions#all',as: 'event_submissions_all'
	  patch '/admin/event_submissions//valid/:id', to: 'event_submissions#valid', as: 'event_submissions_valid'
  end
   root 'events#index'
     resources :events
     resources :charges 
    post 'events/:id/subscride', to: 'events#subscride', as: 'event_subsride'
   devise_for :users
   resources :users, only: [:show,:edit,:update]
   get 'event_submissions/index'
 
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
