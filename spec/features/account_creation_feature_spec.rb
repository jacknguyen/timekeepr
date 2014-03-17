require 'spec_helper'

describe 'account creation' do
  it 'allows user to create account' do
    visit root_path
    click_link 'Sign up'

    fill_in 'Name', with: 'Jack'
    fill_in 'Email', with: 'Jack@example.com'
    fill_in 'Password', with: 'pw'
    fill_in 'Password confirmation', with: 'pw'
    fill_in 'Subdomain', with: 'test_domain' #allowing people to name their own subdomain so that we they enter it they can go to their own personally sign in page.
    click_button 'Create Account'

    expect(page).to have_content('Signed up successfully')
  end
end
