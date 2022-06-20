class Player < ApplicationRecord
    validates :player_name, presence: true
end
