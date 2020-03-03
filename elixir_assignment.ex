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

	def checkRoyalFlush(hand) do #return true if there's a royal flush;false otherwise
		:TODO
	end

	def checkStraightFlush(hand) do
		:TODO
	end

	def checkFourOfAKind(hand) do
		:TODO
	end

	def checkPair(hand) do
		:TODO
	end
	
	def checkStraight(hand) do
		:TODO
	end

	def checkFlush(hand) do
		main_suite=elem((hd hand),1) # reference suite
		hand_copy=hand
		if length(hand)<=0 do #finish this part
			:true
		else
			head=hd(hand_copy)
			hand_copy=hand_copy--[head]
			if elem(head,1)!=main_suite do
				:false
			end
		end
		:true
	end

	def 

	checkThreeofAKind(hand) do
		:TODO
	end

	checkTwoPairs(hand) do
		:TODO
	end

	checkFullHouse(hand) do
		:TODO
	end
end
