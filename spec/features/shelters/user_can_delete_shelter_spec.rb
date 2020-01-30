require 'rails_helper'

describe 'As a visitor', type: :feature do
  describe 'I visit the shelter index page' do
    it 'can delete a shelter' do
      shelter_1 = Shelter.create(name: "Dogs 'R' Us", address: "1905 NE Innsbruck Dr", city: "Ankeny", state: "IA", zip: "50021")

      visit '/shelters'

      click_button 'Delete'

      expect(current_path).to eq('/shelters')
      expect(page).to_not have_content("Dogs 'R' Us")
    end
  end

end
