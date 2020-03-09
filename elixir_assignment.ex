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

def checkRoyalFlush(values_list,suits_list) do
	main_suite=hd(suits_list) #a reference suit
	#check if the suit is the same for every card
	if not Enum.all?(suits_list,fn(suite)->suite==main_suite end) do
		:false
	end

	#check if Ace,King,Queen,Jack,10 are not in the list of values
	if not (1 in values_list) || not (13 in values_list) || not (12 in values_list) || not (11 in values_list) || not (10 in values_list) do
	:false
	end

	:true
end

#--------------------------------------------------------------------

def checkStraightFlush(values_list,suits_list) do
	main_suite=hd(suits_list) # reference suit
        #check if the suit is the same for every card
        if not (Enum.all?(suits_list,fn(suite)->suite==main_suite end)) do
                :false
        end

	:TODO #finish difference comparison
end

#-----------------------------------------------------------

def checkFlush(values_list,suits_list) do
	main_suite=hd(suits_list) # reference suit
	#check if the suit is the same for every card
        if not (Enum.all?(suits_list,fn(suite)->suite==main_suite end)) do
                :false
        end

	checkFlushHelper(values_list,true)
end

#a helper function to check if the difference between 2 cards is 1
def checkFlushHelper([head|t],condition) do
	tail=tl(t)
	#if the difference between 2 cards is 1, it's not a flush
	if ((tail-head)==1) do
	 :false
	end
	if t==[] do
		condition
	end 	# return condition is list is empty

	checkFlushHelper(t,true)
end

#---------------------------------------------------------------------

def checkStraight(values_list) do
	sorted = Enum.sort(values_list)
	checkStraight(sorted, 0)
end

def checkStraight(sorted_vals, 3) do
	if Enum.at(sorted_vals, 3) == (Enum.at(sorted_vals, 4) - 1) do
		:true
	else
		:false
	end
end

def checkStraight(sorted_vals, n) do
	if Enum.at(sorted_vals, n) == (Enum.at(sorted_vals, n + 1) - 1) do
		checkStraight(sorted_vals, n+1)
	else
		:false
	end
end

#-----------------------------------------------------------------------

def checkThreeKind(values_list) do
	if Enum.count(Map.values(Enum.frequencies(values_list)), &(&1 == 3)) == 1 do
		:true
	else
		:false
	end
end

#-----------------------------------------------------------------------

def checkTwoPair(values_list) do
	if Enum.count(Map.values(Enum.frequencies(values_list)), &(&1 == 2)) == 2 do
		:true
	else
		:false
	end
end

#-----------------------------------------------------------------------

def checkPair(values_list) do
	if Enum.count(Map.values(Enum.frequencies(values_list)), &(&1 == 2)) == 1 do
		:true
	else
		:false
	end
end

#-----------------------------------------------------------------------
def getHighCard(values_list,suits_list) do
	max_value=Enum.max(values_list) # get max value
	#finds the corresponding suite of the high card
	[suite,_]=Enum.with_index(suits_list) |> Enum.filter_map(fn {x, _} -> x == max_value end, fn {_, i} -> i end)
	#return the tuple containing max value and suite
	{max_value,suite}
end

end
