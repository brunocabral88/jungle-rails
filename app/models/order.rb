class Order < ActiveRecord::Base
  after_create :reduce_products_qty_in_stock

  belongs_to :user
  has_many :line_items
  has_many :products, through: :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true
  validate :products_have_stock

  private

  def reduce_products_qty_in_stock
    line_items.each do |line_item|
      product = line_item.product
      product.quantity -= line_item.quantity
      product.save!
    end
  end

  def products_have_stock
    if self.line_items
      self.line_items.each do |line_item|
        errors.add(:quantity,"there is not enough quantity in stock") if line_item.quantity > line_item.product.quantity
      end
    else
      return false
    end
    true
  end
  
end
