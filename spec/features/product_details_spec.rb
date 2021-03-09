require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @product = Product.create!(
        name:  'Test Product',
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99,
        category: @category
      )
  end

  scenario "They see all products" do
    # ACT
    visit "/products/1"

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content @product.name
    expect(page).to have_content @product.description
    expect(page).to have_content @product.quantity
    expect(page).to have_content @product.price
    
  end
  
end
