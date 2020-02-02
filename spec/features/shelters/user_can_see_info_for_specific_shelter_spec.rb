require 'rails_helper'

describe "As a visitor", type: :feature do
  describe 'when I visit a specific shelter page' do
    it "can see the attributes of one shelter" do
      shelter_1 = Shelter.create(name: "Dogs 'R' Us", address: "1905 NE Innsbruck Dr", city: "Ankeny", state: "IA", zip: "50021")

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_1.address)
      expect(page).to have_content(shelter_1.city)
      expect(page).to have_content(shelter_1.state)
      expect(page).to have_content(shelter_1.zip)
      expect(page).to have_content('View Pets at this shelter')
      expect(page).to have_content('Update Shelter')
      expect(page).to have_button('Delete Shelter')
    end
  end

end
