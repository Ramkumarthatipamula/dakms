Rails.application.routes.draw do
  resources :upload_files
  root "home#index"
  devise_for :users
  resources :institutes
  resources :upload_files
  get "/admin" => "admin#index"
  get "/admin/manage" => "admin#manage"

  get "/electronic_wing" => "electronic_wing#dashboard"


  get "/upload_files/status" => "upload_files#status"
  get "/upload_files/download" => "upload_files#download"

  get "/institute" => "institute#index"
  get "/electronic_wing" => "electronic_wing#index"
  get "/super_admin" => "super_admin#index"
  get "/add_institute" => "admin#add_institute"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
