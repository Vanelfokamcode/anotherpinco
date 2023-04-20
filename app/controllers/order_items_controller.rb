class OrderItemsController < ApplicationController

    def create 
        # find the product
        @product = Product.find(params[:product_id])

        # quantity comes from the form data
        @quantity = form_params[:quantity]

        flash[:success] = "Add to cart"

        # # create the cart with product and quantity in there
        @current_cart .order_items.create(product: @product, quantity: @quantity)

        redirect_to product_path(@product)
    end

    def update
        # @product = Product.find(params[:product_id])

        # @product = @order_item.product

        # @order_item = OrderItem.find(params[:id])

        # @order_item.update(form_params)

        # flash[:success] = "Thanks for updating your cart"

        # redirect_to product_path(@product)
        @order_item = OrderItem.find(params[:id])

        @product = @order_item.product

        if @order_item.update(form_params)
            flash[:success] = "Thanks for updating your cart"
        else
            flash[:error] = "Failed to update your cart"
        end

        # redirect_to product_path(@product)
        redirect_to cart_path

    end

    def form_params
        # params.require[:order_item].permit(:quantity)
        params.require(:order_item).permit(:quantity)
    end 
end
