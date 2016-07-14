describe 'Review features' do

  let(:restaurant1) {{'Name'        => "Andrea's Bistro",
                      'Description' => "Fantastic"
                    }}

  let(:review1)     {{'Description' => "Loved it",
                      'Rating'  => 5
                    }}

  scenario 'user can add a restaurant review and see it displayed on the main page' do
    create_new_restaurant('/restaurants/new', restaurant1)
    visit('/restaurants')
    click_link('Add review')
    fill_in 'Description', with: 'Loved it'
    select '3', from: 'Rating'
    click_button('Create Review')
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'Loved it'
    
  end
end
