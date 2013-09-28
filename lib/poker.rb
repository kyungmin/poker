require_relative './player.rb'
require_relative './hand.rb'
require_relative './card.rb'
require_relative './deck.rb'

class Poker
  attr_accessor :deck, :players

  def initialize
    @deck = Deck.new
    @players = [Player.new, Player.new]
    deal_cards
  end

  def deal_cards
    players.each do |player|
      player.cards = draw_cards_from_deck
    end
  end

  def replace(player, index)
    player.cards[index] = deck.draw_card
  end


  private

  def draw_cards_from_deck
    cards = []
    5.times do
      cards << deck.draw_card
    end
    cards
  end
end
