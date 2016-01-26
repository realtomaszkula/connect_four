class Game
attr_accessor :player1, :player2, :active_player, :winner, :board

  def initialize
    @player1 = {}
    @player2 = {}
    @active_player = nil
    @winner = false
    @board = nil
  end

  def play
    create_the_board
    draw_the_board
    player_turn


  end

  def create_the_board
    @board = [
          [" "," "," "," "," "," "," "],
          [" "," "," "," "," "," "," "],
          [" "," "," "," "," "," "," "],
          [" "," "," "," "," "," "," "],
          [" "," "," "," "," "," "," "],
          [" "," "," "," "," "," "," "]
        ]
  end

  def draw_the_board
    print "  1  2  3  4  5  6  7\n"
    @board.each do |row|
      row.each { |x| print "|#{x}|" }
      print "\n"
    end
  end

  def create_the_players
    puts "Enter plr1"
    @player1[:name] = gets.chomp
    @player1[:sign] = "x"
    puts "Enter plr2"
    @player2[:name] = gets.chomp
    @player2[:sign] = "o"
    @active_player = @player1
  end

  def player_turn
    puts "Where do you want to move?"
    input = gets.chomp.upcase

    until correct_num?(input) && empty_space?(input)
      input = gets.chomp
    end

    update_the_board(input)
  end

  def correct_num?(input)
    input.length == 1 && input.to_i.between?(1,7)
  end

  def empty_space?(input)
    y = input.to_i - 1
    @board.transpose[y][0] == " "
  end

  def update_the_board(input)
    y = input.to_i - 1
    x = @board.transpose[y].index("x") - 1
    @board[x][y] = "x"
  end

end

