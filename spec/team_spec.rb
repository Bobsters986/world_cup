require './lib/team'
require './lib/player'

RSpec.describe Team do
  
  describe "Iteration 2" do
    it "exists" do
      team = Team.new("France")

      expect(team).to be_an_instance_of(Team)
      expect(team.country).to eq("France")
    end

    it "can lose" do
      team = Team.new("France")

      expect(team.eliminated?).to be false
      team.knocked_out
      expect(team.eliminated?).to be true
    end

    it "starts with no players" do
      team = Team.new("France")

      expect(team.players).to eq([])
    end

    it "can add players" do
      team = Team.new("France")
      mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
      pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
      team.add_player(mbappe)
      team.add_player(pogba)

      expect(team.players).to eq([mbappe, pogba])
    end

    it "can find players by position" do
      team = Team.new("France")
      mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
      pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
      team.add_player(mbappe)
      team.add_player(pogba)

      expect(team.players_by_position("midfielder")).to eq([pogba])
      expect(team.players_by_position("forward")).to eq([mbappe])
      expect(team.players_by_position("defender")).to eq([])
    end
  end
end