class ProductsController < ApplicationController
  before_action :product, only: [:show]

  def index
    @products = Product.all.with_attached_image
  end

  def show
    @products = Product.limit(3).with_attached_image
  end

  def add_to_cart
    if cart_product = current_cart.cart_products.find_by(product_id: product.id)
      cart_product.update(count: cart_product.count.to_i + 1)
    else
      new_cart_product = current_cart.cart_products.build(product: product, count: 1)
      new_cart_product.save
    end
    respond_to do |format|
      format.json { render json: '' }
    end
  end

  def remove_from_cart
    if cart_product = current_cart.cart_products.find_by(product_id: product.id)
      cart_product.delete
    end
    respond_to do |format|
      format.json { render json: '' }
    end
  end

  def change_count_in_cart
    if cart_product = current_cart.cart_products.find_by(product_id: product.id)
      cart_product.update(count: params[:count])
    end
    respond_to do |format|
      format.json { render json: '' }
    end
  end

  def cart
    @products = current_cart.cart_products.includes(product: [image_attachment: [:blob]])
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def product
    @product ||= Product.find(params[:id])
  end
end
