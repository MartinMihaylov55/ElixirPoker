
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

		rankOfHand1=determineRank(hd(p1hand),tl(p1hand))
		rankOfHand2=determineRank(hd(p2hand),tl(p2hand))

		if rankOfHand1 > rankOfHand2 do
			winningHand=p1hand
		end
	
		if rankOfHand1 < rankOfHand2 do
			winningHand=p2hand
		end

		if rankOfHand1==rankOfHand2 do
			{highCard1,highSuite1}=getHighCard(hd(p1hand),tl(p1hand))
			{highCard2,highSuite2}=getHighCard(hd(p2hand),tl(p2hand))
			if highCard1>highCard2 do
				winningHand=p1hand
			end
			
			if highCard1<highCard2 do
				winningHand=p2hand
			end

			if highCard1==highCard2 && determineSuitRank(highSuite1)>determineSuitRank(highSuite2) do
				winningHand=p1hand
			end
			
			if highCard1==highCard2 && determineSuitRank(highSuite1)<determineSuitRank(highSuite2) do
				winningHand=p2hand
			end
			
		end

		winningHand
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
	if checkFlush(suits_list) and Enum.sort(values_list) == [1,10,11,12,13] do
		:true
	else
		:false
	end

	#check if Ace,King,Queen,Jack,10 are not in the list of values
	#if not (1 in values_list) || not (13 in values_list) || not (12 in values_list) || not (11 in values_list) || not (10 in values_list) do
	#:false
	#end
end

#--------------------------------------------------------------------

def checkStraightFlush(values_list,suits_list) do
	main_suite=hd(suits_list) # reference suit
        #check if the suit is the same for every card
        if (checkStraight(values_list) and checkFlush(suits_list)) do
          :true
	else
		:false
        end
end

#-----------------------------------------------------------------------

def checkFourKind(values_list) do
	if Enum.count(Map.values(Enum.frequencies(values_list)), &(&1 == 4)) == 1 do
		:true
	else
		:false
	end
end

#-----------------------------------------------------------------------

def checkFullHouse(values_list) do
	if (Enum.count(Map.values(Enum.frequencies(values_list)), &(&1 == 3)) == 1) and (Enum.count(Map.values(Enum.frequencies(values_list)), &(&1 == 2)) == 1) do
		:true
	else
		:false
	end
end

#-----------------------------------------------------------

#Note: To check for a flush, you simply need to see if Enum.all? is true for comparing the head of the list to all of the other suits to see if they are equal
def checkFlush(suits_list) do
	main_suite=hd(suits_list) # reference suit
	#check if the suit is the same for every card
        if (Enum.all?(suits_list, &(&1 == main_suite))) do
					:true
				else
					:false
        end

	#checkFlushHelper(values_list,true)
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

#determine and return the rank of the hand from 10 to 1, where 10 is the highest rank
def determineRank(values_list,suits_list) do
	cond do
		checkRoyalFlush(values_list,suits_list) -> 10
		checkStraightFlush(values_list,suits_list) -> 9
		checkFourKind(values_list) -> 8
		checkFullHouse(values_list) -> 7
		checkFlush(suits_list) -> 6
		checkStraight(values_list) -> 5
		checkThreeKind(values_list) -> 4
		checkTwoPair(values_list) -> 3
		checkPair(values_list) -> 2
		true -> 1 #no combination was found	
	end
end

#determines the rank of the suit
def determineSuitRank(suite) do
	cond do
		'S' -> 4
		'H' -> 3
		'D' -> 2
		'C' -> 1
		true -> -1
	end
end

end
