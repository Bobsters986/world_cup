class Team
  attr_reader :country,
              :players
  attr_accessor :eliminated,
                :players_by_position

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
        player.position == position if self.eliminated? == false
      end
  end

end