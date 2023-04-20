class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])

        @order_items = @current_cart.order_items.find_by(product: @product)

        # if nothing in the cart create one order item with the order
        # trying to find
        if @order_items.nil?
            @order_items = @current_cart.order_items.new(product: @product, quantity: 1)
        end
    end
end
