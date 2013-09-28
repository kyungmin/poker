require 'rspec'
require_relative '../lib/poker'

describe "Game of Poker" do
  subject(:poker) { Poker.new }
  let(:player) { poker.players[0] }

  it "should exist" do
    expect(poker).to_not be_nil
  end

  describe "Player" do

    it "should have a pot" do
      expect(player.pot).to_not be_nil
    end
  end


  describe "Hand" do
    it "should have 5 cards" do
      expect(player.cards.count).to eq(5)
    end

    # it "discarding card should decrease the # cards in hand" do
    #   expect { poker.players[0].discard(2) }.to change { poker.players[0].hand.cards.count }.by(-1)
    # end

    let(:old_card) { Card.new(player.cards[2].suit, player.cards[2].value) }

    it "replacing a card should work" do
      poker.replace(player, 2)
      expect(player.cards[2]).to_not eq(old_card)
    end
  end




  describe "Deck" do
    subject(:deck) { Deck.new }

    it "should have 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    let(:heart) { deck.cards.select { |card| card.suit == :heart } }
    it "should have 13 cards of the same suit" do
      expect(heart.count).to eq(13)
    end

    let(:unshuffled_cards) { Deck.new.cards }
    let(:shuffled_cards) { deck.shuffle }
    it "should be different after shuffling" do
      shuffled_cards.should_not == unshuffled_cards
    end

    it "draw cards should decrease the # cards in deck" do
      expect { deck.draw_card }.to change { deck.cards.length }.by(-1)
    end

  end

  describe "Card" do
    subject(:card) { Card.new(:diamond, 4) }
    it { should respond_to(:suit) }
    it { should respond_to(:value) }
  end


end