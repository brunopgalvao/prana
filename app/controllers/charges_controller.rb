class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = params[:price][:value].to_i
    logger.debug "@amount is: #{@amount}"
    
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'One Class Pass',
      :currency    => 'usd'
    )
    
    user = current_user
    user.increment(:class_count, by = 1)
    user.save
    redirect_to current_user, notice: "Thanks, you paid #{ActionController::Base.helpers.number_to_currency(@amount/100)}!"
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
