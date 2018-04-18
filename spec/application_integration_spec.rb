require 'spec_helper'

describe "Get '/' - Home Page" do
  it 'welcomes the user' do
    get '/'
    expect(last_response.body).to include ("Welcome")
  end

  it 'welcomes the user' do
    visit '/'
    expect(page.body).to include ("Welcome")
  end

  it 'has links to sign up and sign in' do
    visit '/'

    expect(page).to have_link("Sign Up", :href=>"/signup")
    expect(page).to have_link("Log In", :href=>"/login")
  end
end

describe "Signup Page" do

  it 'allows a user to sign up' do
    visit '/signup'
    fill_in(:name, :with => "becky567")
    fill_in(:password, :with => "kittens")
    click_button 'Sign Up!'
    print page
    expect(page).to have_text("becky567")
  end
end
