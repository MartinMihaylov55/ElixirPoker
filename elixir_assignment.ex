defmodule Poker do
	def deal([]), do: :error
	def deal(list) do
	if Enum.all?(list,&is_integer/1)==false do #if any card is not an int
		:error
		end
	player1=Enum.take(list,5) # take 5 elements from the beginning of the list
	player2=Enum.take(list,5) # take 5 remaining elements
	#TODO
	:winning
	end

	def determineSuite(card_number) do
		cond do
			card_number<=13 -> "C" #Clubs
			card_number<=26 -> "D" #Diamonds
			card_number<=39 -> "H" #Hearts
			card_number<=52 -> "S" #Spades
		end
	end

	def royalFlush(list) do #return true if there's a royal flush;false otherwise
		:TODO
	end

	def straightFlush(list) do
		:TODO
	end

	def fourOfAKind(list) do
		:TODO
	end
end
