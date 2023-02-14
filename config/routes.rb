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
    resources :customers, only: [:show, :edit, :update]
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw'  => 'customers#withdraw'

    # my_characters
    resources :my_characters, only: [:show, :create, :edit, :update, :destroy]

    # categories
    resources :categories, only: [:index, :create, :update, :destroy]
    post 'tag' => 'categories#tag'
    patch 'tag_update/:id' => 'categories#tag_update', as: 'tag_update'
    delete 'tag_destroy/:id' => 'categories#tag_destroy', as: 'tag_destroy'

    # inquiries
    resources :inquiries, only: [:create, :update]
  end

  # ++++++++++++++++++++++++++++++++++++++++

  namespace :admin do
    # customers
    resources :customers, only: [:index, :edit, :update]

    # inquiries
    resources :inquiries, only: [:index, :show, :create]
  end

end
