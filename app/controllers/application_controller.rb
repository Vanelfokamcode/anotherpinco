class ApplicationController < ActionController::Base
    # before_action :set_url_options

    before_action :current_cart
    # set up in the views
    helper_method :current_cart

    
    def current_cart
      # if customer just land on the site give them a new cart
      # if not they already have one just keep it 
      if session[:card_id].present?
        #they have a card
        @current_cart = Cart.find(session[:card_id])
      else
        #create a new one
        @current_cart = Cart.create
        # when going to another page with have the session[:card_id] for the current cart
        session[:card_id] = @current_cart.id
      end
    end
    
    before_action do
        ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
      end

    # private
  
    # def set_url_options
    #   ActiveStorage::Current.url_options = Rails.application.routes.default_url_options
    # end
  end