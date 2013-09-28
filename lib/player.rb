class Player
  attr_accessor :hand, :pot, :cards



  def initialize
    @hand = Hand.new
    @pot = 500
    @cards = @hand.cards

  end



end