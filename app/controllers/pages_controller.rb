class PagesController < ApplicationController
  def index
    @products = Product.limit(6).with_attached_image
    pp request.env['HTTP_USER_AGENT']
  end
end
