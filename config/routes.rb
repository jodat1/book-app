Rails.application.routes.draw do
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  # get 'books/new'

  resources :books
  resources :categories, except: [:destroy]
  get 'search', to: "books#search"

  get 'ascending', to: "books#sort_ascending" 
  get 'descending', to: "books#sort_descending" 

  get 'sports', to: "books#sports_filter"
  get 'travel', to: "books#travel_filter"
  get 'entertainment', to: "books#entertainment_filter"

  get 'sports_and_travel', to: "books#sports_travel"
  get 'sports_and_entertainment', to: "books#sports_entertainment"
  get 'entertainment_and_travel', to: "books#entertainment_travel"
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
