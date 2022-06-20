require "rails_helper"

describe Player, type: :model do
  context "test associations" do
    subject {Player.create(player_name: "seven_of_nine", wins: 0)}
    it {should validate_presence_of :player_name}
  end
end
