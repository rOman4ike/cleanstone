Rails.application.routes.draw do
  root "carts#show"

  resources :carts, only: [:show, :update] do
    resources :cart_items, only: [:update, :destroy] do
      collection do
        delete :destroy_all
      end
    end
  end
end
