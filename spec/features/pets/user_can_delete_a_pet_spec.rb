require 'rails_helper'

describe 'As a visitor' do
  describe 'when I am visit the pet page' do
    it 'I can delete the pet' do
      shelter_1 = Shelter.create(name: "Dogs 'R' Us", address: "1905 NE Innsbruck Dr", city: "Ankeny", state: "IA", zip: "50021")
      shelter_2 = Shelter.create(name: "Save a Paw", address: "1350 Irving St", city: "Denver", state: "CO", zip: "80024")

      pet_1 = shelter_1.pets.create(image: "https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/chihuahua-card-small.jpg?bust=1535568982", name: 'Angel', approximate_age: 10, sex: 'Female', description: 'Loves Taco Bell', status: 'Needs a home')
      pet_2 = shelter_2.pets.create(image: "https://images-na.ssl-images-amazon.com/images/I/61nMea1G-xL._AC_SX425_.jpg", name: 'Tiny', approximate_age: 3, sex: 'Male', description: 'A big teddy bear', status: 'Adopted')

      visit "/pets/#{pet_1.id}"

      click_on 'Delete Pet'

      expect(current_path).to eq("/pets")
      expect(page).to have_content(pet_2.name)
      expect(page).to have_no_content(pet_1.name)
      expect(page).to have_no_content(pet_1.approximate_age)
      expect(page).to have_no_content(pet_1.sex)
      expect(page).to have_no_content(pet_1.shelter.name)
    end
  end
end
