class Killer < ActiveRecord::Base
    has_secure_password
    has_many :victims
    validates :name, :email, uniqueness: true
    validates :name, :email, presence: true
end