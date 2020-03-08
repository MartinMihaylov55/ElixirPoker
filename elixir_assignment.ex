#There is a syntax error on line 13 but i have no idea what the hell it is. Please help!!!
defmodule Poker do
	#Hands will be divided into a list containing 2 lists each of length 5
	#The first list contains the card values and the second list contains their suits

	def deal([]), do: :error

	def deal(list) do

		if Enum.all?(list,&is_integer/1)==false do #if any card is not an int
			:error
		end

		p1hand = [Enum.map(convertHand(list, 0), &getCardValue/1), Enum.map(convertHand(list, 0), &determineSuit/1)]
		p2hand = [Enum.map(convertHand(list, 1), &getCardValue/1), Enum.map(convertHand(list, 1), &determineSuit/1)]

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

def getCardValue(card) when card<=13 do
	card
end

def getCardValue(card) do
	getCardValue(card-13)
end

#-----------------------------------------------------------
end
