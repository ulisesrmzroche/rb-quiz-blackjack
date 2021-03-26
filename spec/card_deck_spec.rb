# frozen_string_literal: true

require 'card_deck'

RSpec.describe CardDeck do
  it 'should start with 52 cards' do
    cd = CardDeck.new
    cards = cd.instance_variable_get(:@cards)
    expect(cards.length).to eq(52)
  end
end
