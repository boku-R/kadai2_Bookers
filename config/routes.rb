Rails.application.routes.draw do
  # get 'books/index'
  # get 'books/edit'
  # get 'books/show'
  resources :books
  root to: 'homes#top'

  # ここを、ルートディレクトリに直す→直した
  # get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
