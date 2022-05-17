Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'tasks', to: 'tasks#index'

  # create in 2 steps
  get 'tasks/new', to: 'tasks#new', as: :new_task
  post 'tasks', to: 'tasks#create'

  # NB: The `show` route needs to be *after* `new` route.
  get 'tasks/:id', to: 'tasks#show', as: :task

  # get "restaurants/:id", to: "restaurants#show", as: :restaurant
  # as: :task

  # edit in 2 steps
  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  patch 'tasks/:id', to: 'tasks#update'

  # delete
  delete 'tasks/:id', to: 'tasks#destroy'
end
