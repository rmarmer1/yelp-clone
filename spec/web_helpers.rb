def create_new_restaurant (url, details)
  visit(url)

  details.each do |property|
    fill_in(property[0], with: property[1])
  end

  click_button('Create Restaurant')
end

def update_restaurant (details)
  click_button('Edit restaurant')

  details.each do |property|
    fill_in(property[0], with: property[1])
  end

  click_button('Update Restaurant')
end
