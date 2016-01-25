require_relative "../game"

describe Game do
  describe '#initialize' do
    let(:game) { Game.new("Tomasz", "Piotr") }
    context 'when initialized' do
      it { expect game.player1.to eql "Tomasz" }
      it { expect game.player1.to eql "Piotr" }
      it { expect game.activeplayer.to eql player1 }
      it { expect game.board.to eql [] }
      it { expect game.winner.to eql false }
    end
  end

  describe '#get_input' do
  end

  describe '#check_input' do
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