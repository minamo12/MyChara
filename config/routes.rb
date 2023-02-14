Rails.application.routes.draw do

  namespace :admin do
    get 'inquiries/index'
    get 'inquiries/show'
  end
  namespace :admin do
    get 'customers/index'
  end
  namespace :public do
    get 'categories/index'
  end
  namespace :public do
    get 'my_characters/show'
    get 'my_characters/edit'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :public do
    get 'homes/top'
  end
  get 'customers/show'
  get 'customers/edit'
  get 'homes/top'
  scope module: 'public' do
  end

  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
