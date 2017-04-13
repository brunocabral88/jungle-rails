class OrderMailerPreview < ActionMailer::Preview

  def order_receipt_email
    OrderMailer.order_receipt_email(Order.find(2))
  end
end