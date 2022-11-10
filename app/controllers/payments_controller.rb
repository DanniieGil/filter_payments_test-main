class PaymentsController < ApplicationController
  def index
    @payments = Payment.order(received_on: :desc).preload(:campaign, :project)
  end
end
