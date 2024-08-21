class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show update ]

  def show
  end

  def update
    if @cart.update(cart_params)
      render status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  private
    def set_cart
      @cart = Cart.last
    end

    def cart_params
      params.require(:cart).permit(:discount)
    end
end
