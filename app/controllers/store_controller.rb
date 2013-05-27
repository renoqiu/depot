class StoreController < ApplicationController
  skip_before_filter :authorize
  def index
    increment_index_access_times
    @products = Product.order(:title)
    @cart = current_cart
  end

  private
  
  def increment_index_access_times
    if session[:counter].nil?
      session[:counter] = 0
    end
    session[:counter] += 1
    logger.info("----------------------------------------------------------------------------------------------------")
    logger.info(session[:counter])
  end
end
