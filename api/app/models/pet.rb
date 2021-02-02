class Pet < ApplicationRecord
    scope :by_type, -> (type) { where type_of_pet: type}
    scope :by_age, -> (from, to) { where("age >= ? AND age <= ?",from,to)}
    scope :by_breed, -> (breed) { where breed: breed}
    scope :by_gender, -> (gender) { where gender: gender}
    scope :by_adopted, -> (adopted) { where adopted: adopted}
end
