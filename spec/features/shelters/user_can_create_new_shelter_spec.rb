require 'rails_helper'

describe 'As a visitor', type: :feature do
  describe 'when I visit the new shelter form by clicking' do
    it 'can create a new shelter' do
      visit '/shelters'

      click_link 'New Shelter'

      expect(current_path).to eq('/shelters/new')

      fill_in 'Name', with: "Will's Shelter"
      fill_in 'Address', with: '123 Main St'
      fill_in 'City', with: 'Denver'
      fill_in 'State', with: 'CO'
      fill_in 'Zip', with: '80204'
      click_on 'Create Shelter'

      expect(current_path).to eq('/shelters')
      expect(page).to have_content("Will's Shelter")
    end
  end
end
