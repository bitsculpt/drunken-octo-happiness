require 'spec_helper'

feature "User submits a new owner" do
#As a real estate associate
#I want to record a building owner
#So that I can keep track of our relationships with owners
#I must specify a first name, last name, and email address
#I can optionally specify a company name
#If I do not specify the required information, I am presented with errors
#If I specify the required information, the owner is recorded and I am redirected to enter another new owner




  it "displays an owner after the owner is created" do
    visit "/owners"
    click_link "New Owner"
    fill_in "owner[first_name]", :with => "Jon"
    fill_in "owner[last_name]", :with => "Doe"
    fill_in "owner[email]", :with => "jondoe@example.com"
    fill_in "owner[company]", :with => "Google"
    click_button "Create Owner"
    expect(page).to have_content("Jon")

    expect(Owner.count).to eq(1)
  end
end
feature "requires a first name" do

  it 'returns an error if no first name is specified' do
    visit "/owners/new"
    click_on "Create Owner"
    expect(page).to have_content "can't be blank"
  end
end
feature "requires a last name" do

  it 'returns an error if no last name is specified' do
    visit "/owners/new"
    click_on "Create Owner"
    expect(page).to have_content "can't be blank"
  end
end

feature "requires an email" do

  it 'returns an error if no email is specified' do
    visit "/owners/new"
    click_on "Create Owner"
    expect(page).to have_content "can't be blank"
  end
end

