require 'rails_helper'

describe 'create new user' do
  it 'adds a new user account' do
    visit '/'
    click_on('Sign up')
    fill_in('user_email', :with => 'test@test.com')
    fill_in('user_password', :with => 'notadmin')
    fill_in('user_password_confirmation', :with => 'notadmin')
    click_button('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end

describe 'user review route' do
  before(:each) do
    product = Product.create!(name: "Food", coo: "aby", cost: 2)
  end

  it 'allows a user to leave a review' do 
    visit '/'
    click_on('Sign up')
    fill_in('user_email', :with => 'test@test.com')
    fill_in('user_password', :with => 'notadmin')
    fill_in('user_password_confirmation', :with => 'notadmin')
    click_button('Sign up')
    click_on('Food')
    click_on('Add a review')
    select(3, :from => 'Rating')
    fill_in('review_content_body', :with => 'blahblahblahblahblahblahblahblahblahblahblahblahblah')
    click_button('Create Review')
    expect(page).to have_content('Review uploaded!')
  end
end

describe 'admin routes' do
  before(:each) do
    visit '/'
    click_on('Sign up')
    fill_in('user_email', :with => 'admin@admin.com')
    fill_in('user_password', :with => 'adminpass')
    fill_in('user_password_confirmation', :with => 'adminpass')
    click_button('Sign up')
    User.where(email: 'admin@admin.com').update(admin: true)
    product = Product.create!(name: "Food", coo: "aby", cost: 2)
  end

  it 'allows the admin to add a product' do
    visit '/'
    click_on('View all products')
    click_on('Add a new product')
    fill_in('Name', :with => 'brocoli')
    fill_in('product_coo', :with => 'usa')
    fill_in('Cost', :with => 5)
    click_on('Create Product')
    expect(page).to have_content('Product added!')
    expect(page).to have_content('Brocoli')
  end

  it 'allows the admin to update a product' do
    visit '/products'
    click_on('Food')
    click_on('Edit product')
    fill_in('Name', :with => 'brocoli')
    fill_in('product_coo', :with => 'usa')
    fill_in('Cost', :with => 5)
    click_on('Update Product')
    expect(page).to have_content('Product Updated')
    expect(page).to have_content('Brocoli')
  end
end