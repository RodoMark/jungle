require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  
  # SETUP
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

    @user = User.create!(
        first_name:  'Test',
        last_name: 'User',
        email: 'this.email@isunique.com',
        password: 'password'
      )
  end

  # ACT
  scenario "They fill out the user login form" do
    visit root_path
    find_link('Login').click

    expect(page).to have_content 'Login to your account'

    save_screenshot
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    save_screenshot

    find_button('Continue').click

   # DEBUG
   

   #VERIFY
   expect(page).to have_css 'article.product', count: 10
   expect(page).to have_css 'a#logout'

   save_screenshot
   
  end

  

end
