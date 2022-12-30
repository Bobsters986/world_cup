class WorldCup
  attr_reader :year,
              :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    @teams.map do |team|
      team.players_by_position(position)
    end.flatten
  end

  def all_players_by_position
    forward_array = active_players_by_position("forward")
    midfielder_array = active_players_by_position("midfielder")
    defender_array = active_players_by_position("defender")

    {
      "forward" => forward_array,
      "midfielder" => midfielder_array,
      "defender" => defender_array
    }
  end
end