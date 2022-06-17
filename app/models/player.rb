class Player < ApplicationRecord
    validates :player_name, presence: true, uniqueness: true, length: { minimum: 5 }
end
