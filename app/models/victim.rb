class Victim < ActiveRecord::Base
    belongs_to :killer
    validates :name, :time_of_death, :last_words, presence: true
end