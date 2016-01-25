require_relative "../game"

describe Game do
  let(:game) { Game.new }
  describe '#initialize' do

    context 'when initialized' do
      it { expect(game.player1).to eql nil }
      it { expect(game.player2).to eql nil }
      it { expect(game.active_player).to eql nil }
      it { expect(game.board).to eql [] }
      it { expect(game.winner).to eql false }
    end
  end

  describe '#create_the_board' do
    before { game.create_the_board }
    context 'when created' do
      it { expect(game.board.size).to eql 6 }
      it { expect(game.board[0].size).to eql 7 }
      it { expect(game.board[0][0]).to eql " " }
    end
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
      expect(subject.instance_variable_get(:@player1)).to eq :player1
      expect(subject.instance_variable_get(:@player2)).to eq :player2
      expect(subject.instance_variable_get(:@active_player)).to eq :player1
    end
  end

  describe '#get_input' do
  end

  describe '#correct_input?' do
  end

  describe '#empty_space?' do
  end

  describe '#update_board' do
  end

  describe '#game_over?' do
  end

  describe '#victory' do
  end

  describe '#change_turn' do
  end

end