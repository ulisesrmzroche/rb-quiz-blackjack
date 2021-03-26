# frozen_string_literal: true

require_relative 'card'

require_relative 'card_deck_builder'
class CardDeck
  attr_accessor :cards

  def initialize
    @cards = CardDeckBuilder.build
  end

  def shuffle
    @cards.shuffle!
  end

  def empty?
    @cards.length.zero?
  end

  def draw_cards(num_cards)
    return if empty?

    drawn_cards = @cards.sample(num_cards)
    drawn_cards.each do |card|
      @cards.delete card
    end
    drawn_cards
  end

  def total_card_count
    cards.length
  end
end
