require 'rails_helper'

describe 'as a visitor', type: :feature do
  describe 'when I am on the pet page' do
    before(:each) do
      @shelter_1 = Shelter.create(name: "Dogs 'R' Us", address: "1905 NE Innsbruck Dr", city: "Ankeny", state: "IA", zip: "50021")
      @shelter_2 = Shelter.create(name: "Save a Paw", address: "1350 Irving St", city: "Denver", state: "CO", zip: "80024")

      @pet_1 = @shelter_1.pets.create(image: "https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/chihuahua-card-small.jpg?bust=1535568982", name: 'Angel', approximate_age: 10, sex: 'Female', description: 'Loves Taco Bell', status: 'Needs a home')
      @pet_2 = @shelter_2.pets.create(image: "https://images-na.ssl-images-amazon.com/images/I/61nMea1G-xL._AC_SX425_.jpg", name: 'Tiny', approximate_age: 3, sex: 'Male', description: 'A big teddy bear', status: 'Adopted')
    end

    it 'I can update the pet info' do

      visit "/pets/#{@pet_1.id}"

      click_on ('Update Pet')

      expect(current_path).to eq("/pets/#{@pet_1.id}/edit")

      fill_in 'name', with: 'Angel'
      fill_in 'image', with: 'https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/chihuahua-card-small.jpg?bust=1535568982'
      fill_in 'description', with: 'Loves Taco Bell'
      fill_in 'approximate_age', with: 10
      fill_in 'status', with: 'Adopted'
      fill_in 'sex', with: 'Female'

      click_on 'Update Pet'

      expect(current_path).to eq("/pets/#{@pet_1.id}")
      expect(page).to have_content('Adopted')
      expect(page).to have_no_content('Needs a home')
    end
  end
end
