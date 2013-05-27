class ApplicationController < ActionController::Base
  before_filter :set_i18n_locale_from_params
  before_filter :authorize
  protect_from_forgery

  protected
    def authorize
      logger.info "params"
      logger.info params
      logger.info params.inspect
      unless User.find_by_id(session[:user_id])
        logger.info("----------------------------------------------------------------------------------------------------")
        redirect_to login_url, notice: "Please log in"
      end
      logger.info("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
    end

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = 
            "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options
      { locale: I18n.locale }
    end

  private
    def current_cart
      begin
        Cart.find(session[:cart_id])
      rescue
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
      end
    end
end