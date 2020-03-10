IO.puts "Testing deal"
winner = Poker.deal([35, 27, 36, 28, 37, 29, 38, 30, 39, 31])

IO.inspect winner

IO.inspect Poker.deal([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
IO.inspect Poker.deal([27, 52, 13, 38, 51, 11, 24, 49, 10, 43])
IO.inspect Poker.deal([15, 33, 21, 4, 42, 19, 10, 52, 37, 29])

IO.puts "Testing high cards"
IO.inspect Poker.getHighCard([13,1,12,10,11],["S","S","S","S","S"])
IO.inspect Poker.getHighCard([11,9,8,10,7],["C","C","C","C","C"])
IO.inspect Poker.getHighCard([10,10,7,10,3],["S","H","D","C","C"])
IO.inspect Poker.getHighCard([2,5,5,1,1],["S","S","S","S","S"])
IO.inspect Poker.getHighCard([2,3,3,6,7],["D","C","H","S","C"])
IO.inspect Poker.getHighCard([1,2,3,4,5],["D","C","H","S","C"])

IO.puts "Testing pairs"
IO.puts Poker.checkPair([2,1,5,6,7])
IO.puts Poker.checkPair([2,3,3,6,7])
IO.puts Poker.checkPair([2,3,3,3,7])
IO.puts Poker.checkPair([2,3,3,7,7])

IO.puts "Testing two pairs"
IO.puts Poker.checkTwoPair([2,1,5,6,7])
IO.puts Poker.checkTwoPair([2,5,5,1,1])
IO.puts Poker.checkTwoPair([2,3,3,3,7])
IO.puts Poker.checkTwoPair([2,3,3,7,7])

IO.puts "Testing three of a kind"
IO.puts Poker.checkThreeKind([2,1,5,6,7])
IO.puts Poker.checkThreeKind([2,3,3,6,7])
IO.puts Poker.checkThreeKind([2,3,3,3,7])
IO.puts Poker.checkThreeKind([2,3,3,7,7])

IO.puts "Testing straight"
IO.puts Poker.checkStraight([11,9,8,10,7])
IO.puts Poker.checkStraight([2,3,3,6,7])
IO.puts Poker.checkStraight([2,3,3,3,7])
IO.puts Poker.checkStraight([2,3,4,5,6])

IO.puts "Testing flush"
IO.puts Poker.checkFlush(["C","C","C","C","C"])
IO.puts Poker.checkFlush(["S","H","D","H","C"])
IO.puts Poker.checkFlush(["D","C","H","S","C"])
IO.puts Poker.checkFlush(["S","S","S","S","S"])

IO.puts "Testing full house"
IO.puts Poker.checkFullHouse([11,9,8,10,7])
IO.puts Poker.checkFullHouse([2,3,3,6,7])
IO.puts Poker.checkFullHouse([7,3,3,3,7])
IO.puts Poker.checkFullHouse([4,3,4,3,4])

IO.puts "Testing four of a kind"
IO.puts Poker.checkFourKind([11,9,8,10,7])
IO.puts Poker.checkFourKind([7,7,7,7,6])
IO.puts Poker.checkFourKind([7,3,3,3,7])
IO.puts Poker.checkFourKind([4,4,4,3,4])

IO.puts "Testing straight flush"
IO.puts Poker.checkStraightFlush([11,9,8,10,7],["C","C","C","C","C"])
IO.puts Poker.checkStraightFlush([2,3,3,6,7],["D","C","H","S","C"])
IO.puts Poker.checkStraightFlush([2,3,3,3,7],["S","H","D","C","C"])
IO.puts Poker.checkStraightFlush([2,3,4,5,6],["S","S","S","S","S"])

IO.puts "Testing royal flush"
IO.puts Poker.checkRoyalFlush([11,9,8,10,7],["C","C","C","C","C"])
IO.puts Poker.checkRoyalFlush([2,3,3,6,7],["D","C","H","S","C"])
IO.puts Poker.checkRoyalFlush([2,3,3,3,7],["S","H","D","C","C"])
IO.puts Poker.checkRoyalFlush([13,1,12,10,11],["S","S","S","S","S"])
