require 'rspec'
require_relative '../lib/player.rb'
require_relative '../lib/score.rb'

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

  context '#draw' do
    it 'should return false if the occupied spaces by a each player is less than 4' do
      board.first.fill('#')
      expect(subject.draw(board)).to be false
    end

    it 'should return true the occupied spaces by a each player is greater than 4' do
      board.map { |ary| ary.fill('*') }
      expect(subject.draw(board)).to be true
    end
  end
end
