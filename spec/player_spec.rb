require 'rspec'
require_relative '../lib/player'

RSpec.describe Player do
  before do
    subject.players.push('Ali')
    subject.players.push('Alex')
  end

  context 'when first created' do
    it 'should be instance of player class' do
      expect(subject).to be_instance_of Player
    end

    it 'should have a :players array' do
      expect(subject.players).to be_a_kind_of Array
    end

    it 'next_player should return 0' do
      expect(subject.next_player).to eql(0)
    end
  end

  context '#icon' do
    it 'should return an icon from * sign to #' do
      expect { subject.next_player }.to change { subject.icon }.from('#').to('*')
    end
  end

  context '#current_player' do
    it 'shoul switch the player' do
      expect { subject.next_player }.to change { subject.current_player }.from('Alex').to('Ali')
    end
  end
end
