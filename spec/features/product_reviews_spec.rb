require 'rails_helper'

RSpec.feature "ProductReviews", type: :feature, js: true do
  before :each do
    @user = User.create!(
      first_name: "John",
      last_name: "Doe",
      email: "test@test.org",
      password: "123123",
      password_confirmation: "123123"
    )
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
    # Login
    visit login_path
    fill_in :user_email, with: "test@test.org"
    fill_in :user_password, with: "123123"
    click_on 'Submit'
  end
  
  scenario "a logged in user can review a product" do
    page.find('article.product:first-child').click_on('Details')
    select '5'
    fill_in :rating_description, with: "This is a test review"
    click_on 'Send review'
    page.find('article.product:first-child').click_on('Details')
    expect(page).to have_text('This is a test review')
  end

  scenario "a logged in user can remove his own product review" do
    page.find('article.product:first-child').click_on('Details')
    select '5'
    fill_in :rating_description, with: "This is a test review"
    click_on 'Send review'
    page.find('article.product:first-child').click_on('Details')
    page.find('div.product-rating').click_on('Delete')
    expect(page).to have_text("Review deleted!")

  end
  
end
