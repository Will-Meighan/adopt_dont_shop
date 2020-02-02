require 'rails_helper'

describe "As a visitor", type: :feature do
  describe "when I visit the shelters page" do
    it "can see the name of each shelter in the system" do
      shelter_1 = Shelter.create(name: "Dogs 'R' Us", address: "1905 NE Innsbruck Dr", city: "Ankeny", state: "IA", zip: "50021")
      shelter_2 = Shelter.create(name: "Save a Paw", address: "1350 Irving St", city: "Denver", state: "CO", zip: "80024")

      visit '/shelters'

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_2.name)
    end

  end
end
