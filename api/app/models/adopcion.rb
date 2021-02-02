class Adopcion < ApplicationRecord
    scope :by_pet, -> (pet_id) { where pets_id: pet_id}
    scope :by_adopter, -> (adopter) { where adopter_id: adopter}
    scope :by_donante, -> (donante) { where donante_id: donante}
end
