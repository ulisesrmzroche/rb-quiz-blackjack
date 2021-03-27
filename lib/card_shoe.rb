# frozen_string_literal: true

require_relative 'card_deck'

# CardShoe is where the player draw cards from
# A card shoe consists of all the cards from a given number of decks
class CardShoe
  attr_accessor :card_decks, :num_decks, :did_shuffle

  def initialize(num_decks = 6)
    @card_decks = _make_card_decks(num_decks) || []
    @card_deck_length = @card_decks.first.length
    @cards = @card_decks.flatten
    @did_shuffle = false
  end

  def shuffled?
    @did_shuffle == true
  end

  def total_card_count
    @cards.length
  end

  def can_draw?
    total_card_count.positive?
  end

  def empty?
    total_card_count.zero?
  end

  def two_decks_remaining?
    @cards.length == @card_deck_length * 2
  end

  def draw_cards(num_cards)
    return [] if empty?
    return _shuffle_cards if two_decks_remaining? && !shuffled?

    cards = @cards.sample num_cards
    cards.each do |card|
      @cards.delete card
    end
    cards
  end

  private

  def _make_card_decks(num_decks)
    card_decks = []
    num_decks.times do
      deck = CardDeck.new
      deck.shuffle
      card_decks << deck.cards
    end
    card_decks
  end

  def _shuffle_cards
    @cards.shuffle
    @did_shuffle = true
  end
end
