class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[ update destroy ]
  before_action :set_cart, only: %i[ update destroy ]

  def update
    @cart_item.increment(:quantity, params[:increment_value].to_i)
    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to cart_url(@cart_item), notice: "Cart item was successfully updated." }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_items_url, notice: "Cart item was successfully destroyed." }
      format.turbo_stream
    end
  end

  def destroy_all
    Cart.find(params[:cart_id]).cart_items.destroy_all
    respond_to do |format|
      format.html { redirect_to cart_items_url, notice: "Cart items was successfully destroyed." }
      format.turbo_stream
    end
  end

  private
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    def set_cart
      @cart = Cart.find(params[:cart_id])
    end

    def cart_item_params
      params.fetch(:cart_item, {})
    end
end
