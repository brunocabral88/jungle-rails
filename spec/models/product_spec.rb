require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    it "should require the presence of a name" do
      @category = Category.create!({name: "Groceries"})
      @product = Product.new({
        name: nil,
        price: 5.90,
        quantity: 20,
        category: @category
      })
      @product.save
      expect(@product.errors.messages.has_key?(:name)).to be true 
    end
    it "should require the presence of a price" do
      @category = Category.create!({name: "Groceries"})
      @product = Product.new({
        name: "Apples",
        price: nil,
        quantity: 20,
        category: @category
      })
      @product.save
      expect(@product.errors.messages.has_key?(:price)).to be true 
    end
    it "should require the presence of quantity" do
      @category = Category.create!({name: "Groceries"})
      @product = Product.new({
        name: "Apples",
        price: 0.90,
        quantity: nil,
        category: @category
      })
      @product.save
      expect(@product.errors.messages.has_key?(:quantity)).to be true 
    end
    it "should require the presence of category" do
      @product = Product.new({
        name: "Apples",
        price: nil,
        quantity: 20,
        category: nil
      })
      @product.save
      expect(@product.errors.messages.has_key?(:category)).to be true 
    end    
  end
end
