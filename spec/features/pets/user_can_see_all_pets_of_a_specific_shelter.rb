require 'rails_helper'

describe 'As a visitor', type: :feature do
  describe 'when I am on a shelters page' do
    it 'can see all of the pets for that shelter' do
      shelter_1 = Shelter.create(name: "Dogs 'R' Us", address: "1905 NE Innsbruck Dr", city: "Ankeny", state: "IA", zip: "50021")

      pet_1 = shelter_1.pets.create(image: "https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/chihuahua-card-small.jpg?bust=1535568982", name: 'Angel', approximate_age: 10, sex: 'Female')
      pet_2 = shelter_1.pets.create(image: "https://images-na.ssl-images-amazon.com/images/I/61nMea1G-xL._AC_SX425_.jpg", name: 'Tiny', approximate_age: 3, sex: 'Male')

      visit "shelters/#{shelter_1.id}/pets"

      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.approximate_age)
      expect(page).to have_content(pet_1.sex)
      expect(page).to have_css("https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/chihuahua-card-small.jpg?bust=1535568982")

      expect(page).to have_no_content(pet_2.name)
      expect(page).to have_no_content(pet_2.approximate_age)
      expect(page).to have_no_content(pet_2.sex)
      expect(page).to have_no_css("https://images-na.ssl-i  mages-amazon.com/images/I/61nMea1G-xL._AC_SX425_.jpg")
    end
  end
end
