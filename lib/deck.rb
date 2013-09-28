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

  def draw_card(num_cards = 1)
    drawn_cards = []
    num_cards.times do
      drawn_cards << @cards.pop
    end
    drawn_cards
  end
end


