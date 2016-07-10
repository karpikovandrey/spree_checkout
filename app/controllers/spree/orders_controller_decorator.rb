Spree::OrdersController.class_eval do
  def show
    @order = Spree::Order.includes(line_items: [variant: [:option_values, :images, :product]], bill_address: :state, ship_address: :state).find_by_number!(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end


  def update
    if @order.contents.update_cart(order_params)
      respond_with(@order) do |format|
        format.html do
          if params.has_key?(:checkout)
            @order.next if @order.cart?
            redirect_to checkout_path
          else
            redirect_to cart_path
          end
        end
      end
    else
      respond_with(@order)
    end
  end

end