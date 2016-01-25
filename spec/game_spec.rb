require_relative "../game"

describe Game do
  describe '#initialize' do
    let(:game) { Game.new("Tomasz", "Piotr") }
    context 'when initialized' do
      it { expect game.player1.to eql "Tomasz"}
      it { expect game.player1.to eql "Piotr"}
      it { expect game.activeplayer.to eql player1}
      it { expect game.board.to eql []}
    end
  end

end