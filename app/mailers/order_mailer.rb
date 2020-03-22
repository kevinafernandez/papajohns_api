# frozen_string_literal: true

# == Mailer for Order
class OrderMailer < ApplicationMailer
  def order_confirmation(order)
    @order = order
    @store = @order&.store
    @products = @order&.products

    mail(to: @store&.email, subject: "Confirmación de orden: Nº #{@order.id}")
  end
end
