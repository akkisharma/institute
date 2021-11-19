Rails.application.routes.draw do

  root to: 'welcome#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/courses' => 'courses#index'
      post 'courses' => 'courses#create'
    end
  end

  resources :tutors
  resources :courses
end
