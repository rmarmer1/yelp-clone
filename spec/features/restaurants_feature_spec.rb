require 'rails_helper'

feature 'Restaurant features' do

  let(:restaurant1) {{'Name'        => "Andrea's Bistro",
                      'Description' => "Fantastic"
                    }}

  let(:restaurant2) {{'Name'        => "Andrea's Cafe",
                      'Description' => "Fantastic1"
                    }}

  let(:restaurant3) {{'Name'        => "Edited restaurant",
                      'Description' => "Changed my mind"
                    }}

################################################################################

  context 'when no restaurants have been added' do

    scenario 'index page should invite first user to add a restaurant' do
      visit('/restaurants')
      expect(page).to have_content('No restaurants yet, please add one and get reviewing!')
    end

    scenario 'index page should contain a link to create a new restaurant' do
      visit('/restaurants')
      expect(page).to have_link('Add a new restaurant')
    end

    scenario 'user can add a restaurant, then see it displayed on the page' do
      create_new_restaurant('/restaurants/new', restaurant1)
      expect(page).to have_content("Andrea's Bistro")
    end
  end

################################################################################

  context 'when a few restaurants have been created' do

    before(:each) do
      create_new_restaurant('/restaurants/new', restaurant1)
      create_new_restaurant('/restaurants/new', restaurant2)
    end

    scenario 'index page shows the existing restaurants' do
      visit('/restaurants')
      expect(page).to have_content(restaurant1['Name'])
      expect(page).to have_content(restaurant2['Name'])
    end

    scenario 'user can delete a restaurant, this is removed from the index' do
      click_button('Delete')
      expect(page).to_not have_content(restaurant2['Name'])
    end

    scenario 'user can edit a restaurant, this is updated' do
      update_restaurant(restaurant3)
      expect(page).to have_content("Edited restaurant")
      expect(page).to_not have_content("Andrea's Cafe")
    end
  end
end
