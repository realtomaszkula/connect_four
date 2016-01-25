class Game
attr_accessor :player1, :player2, :active_player, :winner, :board

  def initialize
    @player1 = nil
    @player2 = nil
    @active_player = @player1
    @winner = false
    @board = []
  end

  def play
  end

  def create_the_board
    @board = [[" "," "," "," "," "," "," "],[" "," "," "," "," "," "," "],[" "," "," "," "," "," "," "],[" "," "," "," "," "," "," "],[" "," "," "," "," "," "," "],[" "," "," "," "," "," "," "]]
  end

  def create_the_players
    puts "Enter plr1"
    @player1 = gets.chomp
    puts "Enter plr2"
    @player2 = gets.chomp
    @active_player = @player1
  end

end