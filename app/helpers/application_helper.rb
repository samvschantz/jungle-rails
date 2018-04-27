module ApplicationHelper

  def empty_cart(cart_total)
    if cart_total == 0
      @empty_cart = true
    else
      @empty_cart = false
    end
  end

end
