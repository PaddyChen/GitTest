class StoreController < ApplicationController

  def add_to_cart
    @cart = find_cart
    product = Product.find(params[:id])
    @cart.add_product(product)
    # render('')
  rescue ActiveRecord::RecordNotFound
    logger.error("attempt to access invalid product #{params[:id]}")
    flash[:notice] = 'invalid id'
    redirect_to products_path
  end

  private
  def find_cart
    session[:cart] ||= Cart.new
  end
end
