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