class Team
  attr_reader :country,
              :eliminated,
              :players

  def initialize(country)
    @country = country
    @eliminated = false
    @players = []
  end

  def eliminated?
    @eliminated
  end

  def knocked_out
    @eliminated = true
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(position)
      players.find_all do |player|
        player.position == position
      end
  end

end