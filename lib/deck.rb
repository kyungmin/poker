class Deck
  attr_accessor :cards

  def initialize
    @cards = get_cards
  end

  def get_cards
    cards = []
    [:heart, :diamond, :spade, :club].each do |suit|
      13.times do |value|
        cards << Card.new(suit, value)
      end
    end

    cards
  end

  def shuffle
    @cards.shuffle!
  end

  def draw_card
    @cards.pop
  end
end


