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
    create_the_players
    create_the_board

    42.times do
      draw_the_board
      player_turn
      change_turn
      break if @winner
    end
    unless @winner
      puts "Draw!"
    end
    victory
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
    puts "\e[H\e[2J"
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
    x = find_x(y) - 1
    @board[x][y] = @active_player[:sign]
  end

  def find_x(y)
    x1 = (@board.transpose[y].index(@player1[:sign])).to_i
    x2 = (@board.transpose[y].index(@player2[:sign])).to_i

    if x1 == 0 && x2 == 0
      return x = 6
    elsif x1 == 0
      return x1 = x2
    elsif x2 == 0
      return x2 = x1
    else
      return x = [x1,x2].min
    end
  end

  def game_over?
    s =  @active_player[:sign]
    @board.each { |row| @winner = true if row.join.include?(s) }
    0..6.times { |i| @winner = true if @board.transpose[i].join.include?(s) }

    for i in 0..2
      for j in 0..3
        @winner = true if board[5-i][j] == s && board[4-i][j+1] == s && board[3-i][j+2] == s && board[2-i][j+3] == s
        break if @winner
      end
      break if @winner
    end
    @winner
  end

  def change_turn
    @active_player = @active_player == @player1 ? @player2 : @player1
  end

  def victory
    puts "And the winner is: #{@active_player[:name]}!"
  end

end

x = Game.new
x.play
