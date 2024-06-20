Rails.application.routes.draw do
  root 'dog_breeds#index'
  post 'dog_breeds/fetch_image', to: 'dog_breeds#fetch_image'
end
