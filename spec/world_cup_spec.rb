require './lib/player'
require './lib/team'
require './lib/world_cup'

RSpec.describe WorldCup do
  let(:world_cup) { WorldCup.new(2018, [france, croatia]) }
  let(:france) { Team.new("France") }
  let(:croatia) { Team.new("Croatia") }
  let(:mbappe) { Player.new({name: "Kylian Mbappe", position: "forward"}) }
  let(:pogba) { Player.new({name: "Paul Pogba", position: "midfielder"}) }
  let(:modric) { Player.new({name: "Luka Modric", position: "midfielder"}) }
  let(:vida) { Player.new({name: "Domagoj Vida", position: "defender"}) }

  describe "Iteration 3" do
    it "has attributes" do 
      expect(world_cup).to be_an_instance_of(WorldCup)
      expect(world_cup.year).to eq(2018)
      expect(world_cup.teams).to eq([france, croatia])
    end

    it "can list active payers that haven't been eliminated" do
      france.add_player(mbappe)
      france.add_player(pogba)
      croatia.add_player(modric)
      croatia.add_player(vida)

      expect(world_cup.active_players_by_position("midfielder")).to eq([pogba, modric])
      croatia.knocked_out
      expect(croatia.eliminated?).to be true
      expect(world_cup.active_players_by_position("midfielder")).to eq([pogba])
    end
  end

  describe "Iteration 4" do
    it "" do
      france.add_player(mbappe)
      france.add_player(pogba)
      croatia.add_player(modric)
      croatia.add_player(vida)

      expected_results = {
                          "forward" => [mbappe],
                          "midfielder" => [pogba, modric],
                          "defender" => [vida]
                         }
      expect(world_cup.all_players_by_position).to eq(expected_results)
    end
  end
end
