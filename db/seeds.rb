shelter_1 = Shelter.create(name: "Dogs 'R' Us", address: "1905 NE Innsbruck Dr", city: "Ankeny", state: "IA", zip: "50021")
shelter_2 = Shelter.create(name: "Save a Paw", address: "1350 Irving St", city: "Denver", state: "CO", zip: "80024")

pet_1 = shelter_1.pets.create(image: "https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/chihuahua-card-small.jpg?bust=1535568982", name: 'Angel', approximate_age: 10, sex: 'Female')
pet_2 = shelter_2.pets.create(image: "https://images-na.ssl-images-amazon.com/images/I/61nMea1G-xL._AC_SX425_.jpg", name: 'Tiny', approximate_age: 3, sex: 'Male')
