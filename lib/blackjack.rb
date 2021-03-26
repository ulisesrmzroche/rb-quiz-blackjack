# frozen_string_literal: true

require_relative 'dealer'
require_relative 'player'
require_relative 'game'

class Blackjack
  def initialize(options = [])
    @dealer = Dealer.new
    @player = Player.new
    @game = Game.new(@player, @dealer, {
                       single_hand: options.find('single_hand') ? true : false
                     })
  end

  def start
    @game.start
  end
end
