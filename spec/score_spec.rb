require 'rspec'
require '../lib/player.rb'
require '../lib/score.rb'

RSpec.describe Score do
  subject { Score.new(player) }
  let(:board) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }
  let(:player) do
    player = Player.new
    player.players.push('Abd')
    player.players.push('Alex')
    player
  end

  before { player.next_player }

  context 'when first created' do
    it 'should be instance of Score' do
      expect(subject).to be_kind_of(Score)
    end

    it 'should have a player' do
      expect(subject.players.players).to include('Alex')
    end
  end

  context '#get_position' do
    it 'should return the actual position fot the given board item' do
      expect(subject.get_position(board, 1)).to eql([0, 0])
    end
  end

  context '#check_winner' do
    it 'test for a horizontal direction accomplishment' do
      expect(subject.check_winner([['*', 2, 3], ['*', 5, 6], [7, 8, 9]], [2, 0])).to be(true)
    end

    it 'test for a diagonal' do
      expect(subject.check_winner([[1, 2, '*'], [4, 5, '#'], ['*', 8, 9]], [1, 1])).to be(true)
    end

    it 'test for a vertical direction accomplishment' do
      expect(subject.check_winner([[1, 2, '*'], [4, 5, '*'], [7, 8, 9]], [2, 2])).to be(true)
    end

    it 'test for a unfinished game' do
      expect(subject.check_winner([[1, 2, '*'], [4, 5, 6], [7, 8, 9]], [1, 2])).to be(false)
    end
  end
end
