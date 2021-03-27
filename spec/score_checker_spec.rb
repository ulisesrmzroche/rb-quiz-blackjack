# frozen_string_literal: true

require 'player'
require 'dealer'
require 'card'


RSpec.describe ScoreChecker do
  before :each do
    @dealer = Dealer.new
    @player = Player.new
  end

  it 'player should win if dealer busts and player didnt' do
    @player.current_hand = [
      Card.new('10', 's'),
      Card.new('10', 'c'),
      Card.new('A', 'd')

    ]
    @dealer.current_hand = [
      Card.new('9', 's'),
      Card.new('5', 'h'),
      Card.new('8', 'd')
    ]
    @player.save
    @dealer.save
    sc = ScoreChecker.new(@player, @dealer, 2)
    expect(sc.winner).to eq 'Player'
  end

  it 'dealer should win if player busts and dealer didnt' do
    @dealer.current_hand = [
      Card.new('10', 's'),
      Card.new('10', 'c'),
      Card.new('A', 'd')

    ]
    @player.current_hand = [
      Card.new('9', 's'),
      Card.new('5', 'h'),
      Card.new('8', 'd')
    ]
    @player.save
    @dealer.save

    sc = ScoreChecker.new(@player, @dealer, 2)
    expect(sc.winner).to eq 'Dealer'
  end
end
