Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :accounts, controllers: { sessions: 'accounts/sessions' }
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  resources :blog_posts do
  end
end
