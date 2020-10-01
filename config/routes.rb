Rails.application.routes.draw do
  root :to => "articles#index"
  get 'login' => "host#login_form"
  post "login" => "host#login"
  post "logout" => "host#logout"
  get "articles/setting" => "articles#setting"
  get 'tags/:tag', to: 'articles#index', as: :tag #追加
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
