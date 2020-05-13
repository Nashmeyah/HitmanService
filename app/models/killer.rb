class Killer < ActiveRecord::Base
    has_secure_password
    has_many :victims
end