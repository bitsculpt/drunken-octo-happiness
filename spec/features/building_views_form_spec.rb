require 'spec_helper'

feature "User submits a new building" do
# As a real estate associate
# I want to record a building
# So that I can refer back to pertinent information
#I must specify a street address, city, state, and postal code
#Only US states can be specified
#I can optionally specify a description of the building
#If I enter all of the required information in the required format, the building is recorded.
#If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
#Upon successfully creating a building, I am redirected so that I can record another building.





  it "displays a building after it's created" do
    visit "/buildings"
    click_link "New Building"
    description = "This is a placeholder building description"
   
    fill_in "building[street_address]", :with => "33 Harrison Ave"
    fill_in "building[city]", :with => "Boston"
    fill_in "building[state]", :with => "Massachussets"
    fill_in "building[postal_code]", :with => "38555"
    fill_in "building[description]", :with => description
    select 'David', :from => "building[owner_id]"
    #find("option[value='David']").click
    #find_by_id('building_owner_id').find("option[value='David']").click
    click_button "Create Building"
    expect(page).to have_content(description)

    expect(Building.count).to eq(1)
  end
end
feature "requires a street address" do

  it 'returns an error if no street_address' do
    visit "/buildings/new"
    click_on "Create Building"
    expect(page).to have_content "can't be blank"
  end
end
feature "requires a city" do

  it 'returns an error if no city is specified' do
    visit "/buildings/new"
    click_on "Create Building"
    expect(page).to have_content "can't be blank"
  end
end

feature "requires a state" do

  it 'returns an error if no state is specified' do
    visit "/buildings/new"
    click_on "Create Building"
    expect(page).to have_content "can't be blank"
  end
end

 

feature "requires a postal code" do

  it 'returns an error if no postal code is specified' do
    visit "/buildings/new"
    click_on "Create Building"
    expect(page).to have_content "can't be blank"
  end
end
