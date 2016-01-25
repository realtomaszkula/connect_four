class Game
attr_accessor :player1, :player2, :active_player, :winner, :board

  def initialize(plr1, plr2)
    @player1 = plr1
    @player2 = plr2
    @active_player = @player1
    @winner = false
    @board = []
  end

end