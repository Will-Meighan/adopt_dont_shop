require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the pets index' do
    it 'I can see all pets' do

      shelter_1 = Shelter.create(name: "Dogs 'R' Us", address: "1905 NE Innsbruck Dr", city: "Ankeny", state: "IA", zip: "50021")

      pet_1 = shelter_1.pets.create(image: "https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/chihuahua-card-small.jpg?bust=1535568982", name: 'Angel', approximate_age: 10, sex: 'Female', description: 'Loves Taco Bell', status: 'Needs a home')

      visit '/pets'

      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.approximate_age)
      expect(page).to have_content(pet_1.sex)
      expect(page).to have_content(pet_1.description)
      expect(page).to have_content(pet_1.status)
      expect(page).to have_css("img[src*='https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/chihuahua-card-small.jpg?bust=1535568982']")
    end
  end
end
