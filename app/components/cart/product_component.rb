# frozen_string_literal: true

class Cart::ProductComponent < ViewComponent::Base
  def initialize(product:)
    @cart_product = product
  end
end
