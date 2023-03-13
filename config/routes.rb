Rails.application.routes.draw do

  devise_for :customer, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  # ++++++++++++++++++++++++++++++++++++++++

  scope module: 'public' do
    # homes
    root to: 'homes#top'

    # customers
    resources :customers, only: [:edit, :destroy]
    get 'customers/my_chara' => 'customers#show'
    patch 'customers/infomation' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw'  => 'customers#withdraw'

    # characters
    resources :characters, only: [:new, :show, :create, :edit, :update, :destroy]
    get 'search' => 'characters#search'
    get 'tag_search' => 'characters#tag_search'
    get 'category_search' => 'characters#category_search'

    # categories
    resources :categories, only: [:index, :create, :update, :destroy]

    # tags
    resources :tags, only: [:index, :create, :update, :destroy]

    # inquiries
    resources :inquiries, only: [:new, :create, :update]
  end

  # ++++++++++++++++++++++++++++++++++++++++

  namespace :admin do
    # customers
    resources :customers, only: [:index, :update, :destroy]

    # inquiries
    resources :inquiries, only: [:index, :show, :create]

    resources :answers, only: [:create]
  end

end
