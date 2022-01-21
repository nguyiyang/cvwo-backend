Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "/categories/:id/tasks/sort/:search", to: "tasks#sort"
  get "/categories/:id/tasks/search/:search", to: "tasks#search"
  resources :categories do
    resources :tasks
  end
end
