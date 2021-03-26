# frozen_string_literal: true

require_relative 'player'

class Dealer < Player
  def initialize
    super
    @name = 'Dealer'
  end
end
