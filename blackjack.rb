class Player
	attr_accessor :hand
	
	def initialize (card1, card2)
		@hand = Array.new
		hand.push(card1, card2)
	end
	
	#returns total value of player or dealer's hand
	def count ()
		count = 0
		hand.each do |card|
			if card.type != 'Ace'
			count += card.value.to_i
			end
		end
		hand.each do |card|
			if card.type == 'Ace' && count > 10
				count += 1
			elsif card.type == 'Ace' && count <= 10
				count += 11
			end		
		end
		return count
	end				
end

class Card
	attr_accessor :value, :type, :suit
	def initialize (type, suit, value)
		@type = type
		@suit = suit
		@value = value
	end
end

class Engine
	attr_accessor :deck, :dealer, :player
	def initialize ()
		@deck  = Array.new
		deck.push(Card.new('2', 'Diamonds', '2'))
		deck.push(Card.new('2', 'Hearts', '2'))
		deck.push(Card.new('2', 'Spades', '2'))
		deck.push(Card.new('2', 'Clubs', '2'))
		deck.push(Card.new('3', 'Diamonds', '3'))
		deck.push(Card.new('3', 'Hearts', '3'))
		deck.push(Card.new('3', 'Spades', '3'))
		deck.push(Card.new('3', 'Clubs', '3'))
		deck.push(Card.new('4', 'Diamonds', '4'))
		deck.push(Card.new('4', 'Hearts', '4'))
		deck.push(Card.new('4', 'Spades', '4'))
		deck.push(Card.new('4', 'Clubs', '4'))
		deck.push(Card.new('5', 'Diamonds', '5'))
		deck.push(Card.new('5', 'Hearts', '5'))
		deck.push(Card.new('5', 'Spades', '5'))
		deck.push(Card.new('5', 'Clubs', '5'))
		deck.push(Card.new('6', 'Diamonds', '6'))
		deck.push(Card.new('6', 'Hearts', '6'))
		deck.push(Card.new('6', 'Spades', '6'))
		deck.push(Card.new('6', 'Clubs', '6'))
		deck.push(Card.new('7', 'Diamonds', '7'))
		deck.push(Card.new('7', 'Hearts', '7'))
		deck.push(Card.new('7', 'Spades', '7'))
		deck.push(Card.new('7', 'Clubs', '7'))
		deck.push(Card.new('8', 'Diamonds', '8'))
		deck.push(Card.new('8', 'Hearts', '8'))
		deck.push(Card.new('8', 'Spades', '8'))
		deck.push(Card.new('8', 'Clubs', '8'))
		deck.push(Card.new('9', 'Diamonds', '9'))
		deck.push(Card.new('9', 'Hearts', '9'))
		deck.push(Card.new('9', 'Spades', '9'))
		deck.push(Card.new('9', 'Clubs', '9'))
		deck.push(Card.new('Jack', 'Diamonds', '10'))
		deck.push(Card.new('Jack', 'Hearts', '10'))
		deck.push(Card.new('Jack', 'Spades', '10'))
		deck.push(Card.new('Jack', 'Clubs', '10'))
		deck.push(Card.new('Queen', 'Diamonds', '10'))
		deck.push(Card.new('Queen', 'Hearts', '10'))
		deck.push(Card.new('Queen', 'Spades', '10'))
		deck.push(Card.new('Queen', 'Clubs', '10'))
		deck.push(Card.new('King', 'Diamonds', '10'))
		deck.push(Card.new('King', 'Hearts', '10'))
		deck.push(Card.new('King', 'Spades', '10'))
		deck.push(Card.new('King', 'Clubs', '10'))
		deck.push(Card.new('Ace', 'Diamonds', '11'))
		deck.push(Card.new('Ace', 'Hearts', '11'))
		deck.push(Card.new('Ace', 'Spades', '11'))
		deck.push(Card.new('Ace', 'Clubs', '11'))
		deck.shuffle!
		@dealer = Player.new(deck.pop, deck.pop)
		@player = Player.new(deck.pop, deck.pop)
	end
	
	#checks player and dealer's hands for scenarios that would end the round
	def roundIsOver ()
		if dealer.count == 21 && player.count ==21
			puts "There is a tie. You keep your bet."
			puts "Your cards are:"
			player.hand.each do |i|
				puts "\t#{i.type} of #{i.suit}"
			end
			return true
		end
		if dealer.count > 21 && player.count > 21
			puts "You and the dealer both bust. You lose your bet."
			puts "Your final cards were:"
			player.hand.each do |i|
				puts "\t#{i.type} of #{i.suit}"
			end
			return true
		end
		if dealer.count > 21
			puts "Dealer busts. You win!"
			puts "Your final cards were:"
			player.hand.each do |i|
				puts "\t#{i.type} of #{i.suit}"
			end
			return true
		end
		if player.count > 21
			puts "You bust. You lose your bet."
			puts "Your final cards were:"
			player.hand.each do |i|
				puts "\t#{i.type} of #{i.suit}"
			end
			return true
		end
		if player.count == 21
			puts "Blackjack! You win!"
			puts "Your final cards were:"
			player.hand.each do |i|
				puts "\t#{i.type} of #{i.suit}"
			end
			return true
		end
		return false		
	end
	
	#starts a new round
	def play ()
		while (!roundIsOver)
			puts "Your cards are:"
			player.hand.each do |i|
				puts "\t#{i.type} of #{i.suit}"
			end
			puts "Type hit or stand"
			move = gets.chomp
			
			while move != "stand" && move != "hit"
				puts "That was not a correct response. Please type 'hit' or 'stand'"
				move = gets.chomp
			end
			
			#player takes turn
			if move == "hit"
				player.hand.push(deck.pop)
			end
			
			#dealer takes turn
			if dealer.count < 17
				dealer.hand.push(deck.pop)
			end
		end		
	end	
end

a = Engine.new
a.play()


