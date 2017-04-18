require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
    @category.products.create!(
      name: "Test Product",
      description: "This is the test product",
      quantity: 23,
      price: 45.22
    )
  end
  scenario "they see product details" do
    visit root_path
    page.find('article.product:first-child').click_link('Details')
    expect(page).to have_text("product review")
  end
  
end
