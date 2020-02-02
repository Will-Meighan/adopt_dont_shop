require 'rails_helper'

describe 'As a visitor', type: :feature do
  describe 'when I am on a shelters page' do
    it 'can see all of the pets for that shelter' do
      shelter_1 = Shelter.create(name: "Dogs 'R' Us", address: "1905 NE Innsbruck Dr", city: "Ankeny", state: "IA", zip: "50021")
      shelter_2 = Shelter.create(name: "Save a Paw", address: "1350 Irving St", city: "Denver", state: "CO", zip: "80024")

      pet_1 = shelter_1.pets.create(image: "https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/chihuahua-card-small.jpg?bust=1535568982", name: 'Angel', approximate_age: 10, sex: 'Female', description: 'Loves Taco Bell', status: 'Needs a home')
      pet_2 = shelter_2.pets.create(image: "https://images-na.ssl-images-amazon.com/images/I/61nMea1G-xL._AC_SX425_.jpg", name: 'Tiny', approximate_age: 3, sex: 'Male', description: 'A big teddy bear', status: 'Adopted')

      visit "shelters/#{shelter_1.id}/pets"

      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.approximate_age)
      expect(page).to have_content(pet_1.sex)
      # expect(page).to have_css("https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/chihuahua-card-small.jpg?bust=1535568982")

      expect(page).to have_no_content(pet_2.name)
      expect(page).to have_no_content(pet_2.approximate_age)
      expect(page).to have_no_content(pet_2.sex)
      # expect(page).to have_no_css("https://images-na.ssl-i  mages-amazon.com/images/I/61nMea1G-xL._AC_SX425_.jpg")
    end

    it 'there is a link to add a new pet' do

      shelter_1 = Shelter.create(name: "Dogs 'R' Us", address: "1905 NE Innsbruck Dr", city: "Ankeny", state: "IA", zip: "50021")
      shelter_2 = Shelter.create(name: "Save a Paw", address: "1350 Irving St", city: "Denver", state: "CO", zip: "80024")

      pet_1 = shelter_1.pets.create(image: "https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/chihuahua-card-small.jpg?bust=1535568982", name: 'Angel', approximate_age: 10, sex: 'Female', description: 'Loves Taco Bell', status: 'Needs a home')
      pet_2 = shelter_2.pets.create(image: "https://images-na.ssl-images-amazon.com/images/I/61nMea1G-xL._AC_SX425_.jpg", name: 'Tiny', approximate_age: 3, sex: 'Male', description: 'A big teddy bear', status: 'Adopted')

      visit "/shelters/#{shelter_1.id}/pets"

      click_on('Create Pet')

      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")
      expect(page).to have_content('Image url')
      expect(page).to have_content('Name')
      expect(page).to have_content('Description')
      # expect(page).to have_content('Approximate age')
      expect(page).to have_content('Sex')
      # expect(page).to have_content('Status')

      fill_in 'image', with: 'https://cdn.orvis.com/images/DBS_Bichon_1280.jpg'
      fill_in 'name', with: 'Lizzie'
      fill_in 'description', with: 'Good with children'
      fill_in 'approximate_age', with: 0
      fill_in 'sex', with: 'Female'
      fill_in 'status', with: 'Needs a home'

      click_on ('Create Pet')

      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
      expect(page).to have_content('Lizzie')
      # expect(page).to have_content('Good with children')
      expect(page).to have_content(0)
      expect(page).to have_content('Female')
    end
  end
end
