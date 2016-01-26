require_relative "../game"

describe Game do
  let(:game) { Game.new }
  let(:board) { game.board }

  describe '#create_the_board' do
    before {
              game.create_the_board
              @row = board.first
              @col = board.transpose.first
            }
      it { expect(@row.size).to eql 7 }
      it { expect(@col.size).to eql 6 }
  end

  describe '#create_the_players' do
    before do
      io_obj = double
      expect(subject)
        .to receive(:gets)
        .and_return(io_obj)
        .twice
      expect(io_obj)
        .to receive(:chomp)
        .and_return(:player1)
      expect(io_obj)
        .to receive(:chomp)
        .and_return(:player2)
    end

    it 'sets @player1 and @player2 according to user\'s input' do
      subject.create_the_players
      plr1 = subject.instance_variable_get(:@player1)
      plr2 = subject.instance_variable_get(:@player2)
      active = subject.instance_variable_get(:@active_player)

      expect(plr1[:name]).to eql :player1
      expect(plr1[:sign]).to eql "x"
      expect(plr2[:name]).to eql :player2
      expect(plr2[:sign]).to eql "o"
      expect(active).to eq plr1
    end
  end

  describe '#correct_num?' do
    context 'when given user input' do
      it { expect(game.correct_num?("9")).to eql false }
      it { expect(game.correct_num?("")).to eql false }
      it { expect(game.correct_num?("1")).to eql true }
    end
  end

  describe "board interaction" do

      context '#empty_space?' do
        before do
          game.create_the_board
          board[0][0] = "x"
        end
          it { expect(game.empty_space?("1")).to be false }
          it { expect(game.empty_space?("2")).to be true }
      end

      context '#update_the_board' do
        before do
          game.instance_variable_set(:@player1, { name: "Tomasz", sign: "x" })
          game.instance_variable_set(:@player2, { name: "Piotr", sign: "y" })
          game.instance_variable_set(:@active_player, { name: "Tomasz", sign: "x" })
          @s = "x"

          game.create_the_board.reverse
          board[5][0] = @s     #1st column
          board[4][0] = @s
          board[5][1] = @s     # 2nd column
          board[5][2] = @s     # 3rd column
          board[4][2] = @s
          board[3][2] = @s
          board[5][3] = @s     # 4th column
          board[4][3] = @s
          board[5][4] = @s     # 5th column
          board[5][5] = @s     # 6th column
          board[4][5] = @s
          board[3][5] = @s
          board[5][6] = @s     # 7th column
          board[4][6] = @s
          board[3][6] = @s

          game.update_the_board("1")
          game.update_the_board("2")
          game.update_the_board("3")
          game.update_the_board("4")
          game.update_the_board("5")
          game.update_the_board("6")
          game.update_the_board("7")

        end

        it { expect(board[3][0]).to eql @s } # 1st
        it { expect(board[4][1]).to eql @s } # 2nd
        it { expect(board[2][2]).to eql @s } # 3rd
        it { expect(board[3][3]).to eql @s } # 4th
        it { expect(board[4][4]).to eql @s } # 5th
        it { expect(board[2][5]).to eql @s } # 6th
        it { expect(board[2][6]).to eql @s } # 7th
      end
  end

  describe '#game_over?' do
    subject (:winner) { game.winner }
    before do
              @s = "x"
              game.instance_variable_set(:@active_player, { name: "Tomasz", sign: "x" })
              game.create_the_board

          end
    context "when vertically" do
      it do
        board[5][0], board[4][0], board[3][0], board[2][0] = @s, @s, @s, @s
        game.game_over?
        expect(subject).to eql true
      end

      it do
        board[3][5], board[2][5], board[1][5], board[0][5]  = @s, @s, @s, @s
        game.game_over?
        expect(subject).to eql true
      end

      it do
        board[3][4], board[2][4], board[1][4], board[0][4]  = @s, @s, @s, @s
        game.game_over?
        expect(subject).to eql true
      end

     it do
        board[4][3], board[3][3], board[2][3], board[1][3]  = @s, @s, @s, @s
        game.game_over?
        expect(subject).to eql true
      end

      it do
        board[4][2], board[3][2], board[2][2], board[1][2]  = @s, @s, @s, @s
        game.game_over?
        expect(subject).to eql true
      end
    end

    context "when horizontally" do
      it do
        board[0][0], board[0][1], board[0][2], board[0][3]  = @s, @s, @s, @s
        game.game_over?
        expect(subject).to eql true
      end
      it do
        board[5][0], board[5][1], board[5][2], board[5][3]  = @s, @s, @s, @s
        game.game_over?
        expect(subject).to eql true
      end

      it do
        board[3][1], board[3][2], board[3][3], board[3][4]  = @s, @s, @s, @s
        game.game_over?
        expect(subject).to eql true
      end
      it do
        board[3][3], board[3][4], board[3][5], board[3][6]  = @s, @s, @s, @s
        game.game_over?
        expect(subject).to eql true
      end
    end

    context "when diagonally" do
      it do
        board[5][0], board[4][1], board[3][2], board[2][3]  = @s, @s, @s, @s
        game.game_over?
        expect(subject).to eql true
      end

      it do
        board[3][0], board[2][1], board[1][2], board[0][3]  = @s, @s, @s, @s
        game.game_over?
        expect(subject).to eql true
      end

      it do
        board[5][3], board[4][4], board[3][5], board[2][6]  = @s, @s, @s, @s
        game.game_over?
        expect(subject).to eql true
      end

      it do
        board[3][3], board[2][4], board[1][5], board[0][6]  = @s, @s, @s, @s
        game.game_over?
        expect(subject).to eql true
      end
    end
  end

  describe '#victory' do
  end

  describe '#change_turn' do
    before do
              game.instance_variable_set(:@player1, { name: "Tomasz", sign: "x" })
              game.instance_variable_set(:@player2, { name: "Piotr", sign: "o" })
              game.instance_variable_set(:@active_player, { name: "Tomasz", sign: "x" })
              game.change_turn
          end
    it do
      plr1 = game.instance_variable_get(:@player1)
      plr2 = game.instance_variable_get(:@player2)
      active = game.instance_variable_get(:@active_player)
      expect(active).to eql plr2
    end
  end

  describe '#victory' do
    it do
      game.instance_variable_set(:@active_player, { name: "Tomasz" })
      expect { game.victory }.to output("And the winner is: Tomasz!\n").to_stdout
    end
  end

end