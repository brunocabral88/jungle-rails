require 'rails_helper'

RSpec.describe Order, type: :model do

  describe "After creation" do
    before do
      @order = Order.new
      @category = Category.create!({ name: "Category 1" })
      @product1 = Product.create!({
        name: "Product1",
        price: 15.90,
        quantity: 20,
        category: @category
      })
      @product2 = Product.create!({
        name: "Product2",
        price: 2.90,
        quantity: 10,
        category: @category
      })
      @product3 = Product.create!({
        name: "Product 3",
        price: 1.90,
        quantity: 2,
        category: @category
      })
    end

    it "should reduce the product quantity in stock after order is placed" do
      @line_item1 = LineItem.new({
        product: @product2,
        quantity: 3,
        item_price_cents: 1028,
        total_price_cents: 12313
      })

      @order.line_items << @line_item1
      @order.total_cents = 132131
      @order.stripe_charge_id = 1232131
      @order.save!
      @product2.reload
      expect(@product2.quantity).to eq(7)

    end

    it "should not allow purchase of sold-out products" do
      @line_item = LineItem.new({
        product: @product1,
        quantity: 30,
        item_price_cents: 1028,
        total_price_cents: 123131
      })
      @order.line_items << @line_item
      @order.total_cents = 132131
      @order.stripe_charge_id = 1232131
      expect(@order).not_to be_valid
    end
    
  end
end
