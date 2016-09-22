require "test/unit"
require_relative "blackjack"

class BlackJackTests < Test::Unit::TestCase
	
	def test_player
		p1 = Player.new(Card.new('Queen', 'Hearts', '10'), Card.new('5', 'Diamonds', '5'))
		p2 = Player.new(Card.new('Ace', 'Diamonds', '11'), 
						Card.new('King', 'Diamonds', '10'))
		
		#test initialization
		assert_equal(p1.count, 15)
		assert_equal(p2.count, 21)
	end
	
	def test_card
		c = Card.new('Queen', 'Hearts', '10')
		
		#test initialization
		assert_equal(c.type, 'Queen')
		assert_equal(c.suit, 'Hearts')
		assert_equal(c.value, '10')
	end
	
	def test_engine
		e = Engine.new

		#test initialization
		assert_not_nil(e.deck)
		assert_not_nil(e.dealer)
		assert_not_nil(e.player)
		
		#test roundIsOver method
		#case where both players have 21
		e.dealer.hand.clear
		e.player.hand.clear
		e.dealer.hand.push(Card.new('Jack', 'Diamonds', '10'))
		e.dealer.hand.push(Card.new('5', 'Hearts', '5'))
		e.dealer.hand.push(Card.new('6', 'Hearts', '6'))
		e.player.hand.push(Card.new('King', 'Diamonds', '10'))
		e.player.hand.push(Card.new('5', 'Spades', '5'))
		e.player.hand.push(Card.new('6', 'Spades', '6'))
		assert(e.roundIsOver)
		
		#case where both players bust
		e.dealer.hand.clear
		e.player.hand.clear
		e.dealer.hand.push(Card.new('Jack', 'Diamonds', '10'))
		e.dealer.hand.push(Card.new('Queen', 'Hearts', '10'))
		e.dealer.hand.push(Card.new('5', 'Hearts', '5'))
		e.player.hand.push(Card.new('Jack', 'Diamonds', '10'))
		e.player.hand.push(Card.new('Queen', 'Hearts', '10'))	
		e.player.hand.push(Card.new('5', 'Hearts', '5'))
		assert(e.roundIsOver)
		
		#case where dealer busts
		e.dealer.hand.clear
		e.player.hand.clear
		e.dealer.hand.push(Card.new('Jack', 'Diamonds', '10'))
		e.dealer.hand.push(Card.new('King', 'Hearts', '10'))
		e.dealer.hand.push(Card.new('5', 'Hearts', '5'))
		e.player.hand.push(Card.new('Jack', 'Diamonds', '10'))
		e.player.hand.push(Card.new('5', 'Hearts', '5'))
		assert(e.roundIsOver)
		
		#case where player busts
		e.dealer.hand.clear
		e.player.hand.clear
		e.dealer.hand.push(Card.new('Jack', 'Diamonds', '10'))
		e.dealer.hand.push(Card.new('5', 'Hearts', '5'))
		e.player.hand.push(Card.new('Jack', 'Diamonds', '10'))	
		e.player.hand.push(Card.new('5', 'Hearts', '5'))
		e.player.hand.push(Card.new('Jack', 'Spades', '10'))	
		assert(e.roundIsOver)
		
		#case where player gets Blackjack
		e.dealer.hand.clear
		e.player.hand.clear
		e.dealer.hand.push(Card.new('Jack', 'Diamonds', '10'))	
		e.dealer.hand.push(Card.new('5', 'Hearts', '5'))
		e.player.hand.push(Card.new('Jack', 'Diamonds', '10'))
		e.player.hand.push(Card.new('Ace', 'Hearts', '11'))
		assert(e.roundIsOver)
					
	end
end