class User < ApplicationRecord
    has_secure_password
    has_secure_password :recovery_password, validations: false
    validates :password, presence: true
    validates :username, uniqueness: true
end
