#There is a syntax error on line 13 but i have no idea what the hell it is. Please help!!!
defmodule Poker do
	#Hands will be divided into a list containing 2 lists each of length 5
	#The first list contains the card values and the second list contains their suits

	def deal([]), do: :error

	def deal(list) do

		if Enum.all?(list,&is_integer/1)==false do #if any card is not an int
			:error
		end

		p1hand = [convertHand(list, 0), Enum.map(convertHand(list, 0), &determineSuit/1)]
		p2hand = [convertHand(list, 1), Enum.map(convertHand(list, 0), &determineSuit/1)]

		IO.inspect p1hand
		IO.inspect p2hand
		:winner
	end

#---------------------------------------------------------

	def convertHand(listOfCards, i) when i>7 do
  	[Enum.at(listOfCards,i)]
	end

	def convertHand(listOfCards, i) do
		[Enum.at(listOfCards,i)] ++ convertHand(listOfCards, i+2)
	end

#---------------------------------------------------------

#Reminder: The letter for each suit is in ascending order in terms of ascii value
	def determineSuit(card_number) do
		cond do
			card_number<=13 -> "C" #Clubs
			card_number<=26 -> "D" #Diamonds
			card_number<=39 -> "H" #Hearts
			card_number<=52 -> "S" #Spades
		end
	end

#This needs to be rewritten; p1hand and p2hand in the deal function contain a list of all of the suits that can be checked using Enum.all?
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
end
