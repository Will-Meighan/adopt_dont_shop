require 'rails_helper'

describe 'As a visitor', type: :feature do
  describe 'when I visit the shelters index page' do
    it 'can edit a shelter' do
      shelter_1 = Shelter.create(name: "Dogs 'R' Us", address: "1905 NE Innsbruck Dr", city: "Ankeny", state: "IA", zip: "50021")

      visit '/shelters'

      click_link 'Edit'

      expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

      fill_in 'Name', with: 'Cats Only'
      fill_in 'Address', with: "1905 NE Innsbruck Dr"
      fill_in 'City', with: 'Ankeny'
      fill_in 'State', with: 'IA'
      fill_in 'Zip', with: '50021'
      click_on 'Update Shelter'

      expect(current_path).to eq('/shelters')
      expect(page).to have_content('Cats Only')
      expect(page).to_not have_content("Dogs 'R' Us")
    end
  end
end
