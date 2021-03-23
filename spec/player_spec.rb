require 'card'

RSpec.describe Player do 
    it "should not add cards to hand if total is 17 or higher" do
        deck = CardDeck.new
        p = Player.new
        p.current_score = 17
        card = deck.draw_cards!(1)
        p.add_card_to_hand(card)
        expect(p.current_score).to eq(17)
    end

    it "should count A as 1 if bust" do
        deck = CardDeck.new
        p = Player.new
        card1 = Card.new('7', 's')
        card2 = Card.new('1', 'q')
        card3 = Card.new('A', 's')
        p.add_card_to_hand(card1)
        p.add_card_to_hand(card2)
        p.save
        expect(p.current_score).to eq(8)
        p.add_card_to_hand(card3)
        p.save
        expect(p.current_score).to eq(19)
    end

    it "should count A as 11 if no bust" do
        deck = CardDeck.new
        p = Player.new
        card1 = Card.new('2', 's')
        card2 = Card.new('2', 's')
        card3 = Card.new('A', 's')
        p.add_card_to_hand(card1)
        p.add_card_to_hand(card2)
        p.save
        p.add_card_to_hand(card3)
        p.save
        expect(p.current_score).to eq(15)
    end

end
