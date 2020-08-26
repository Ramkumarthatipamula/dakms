Rails.application.routes.draw do
  resources :upload_files
  root "home#index"
  devise_for :users
  resources :institutes
  resources :upload_files
  get "/admin" => "admin#index"
  get "/admin/manage" => "admin#manage"

  get "/electronic_wing/dashboard" => "electronic_wing#dashboard"
  get "/electronic_wing/download_data" => "electronic_wing#download_data"
  get "/electronic_wing/rejected_data" => "electronic_wing#rejected_data"

  get "/institute/dashboard" => "institutes#dashboard"
  get "/institute/download_data" => "institutes#download_data"
  get "/institute/activities/manage" => "institutes#manage"

  get "/super_admin/dashboard" => "institutes#dashboard"

  get "/upload_file_status/update" => "upload_files#status"
  get "/approved_files_download" => "upload_files#download"

  get "/institute" => "institute#index"
  get "/electronic_wing" => "electronic_wing#index"
  get "/super_admin" => "super_admin#index"
  get "/add_institute" => "admin#add_institute"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
