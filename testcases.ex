IO.puts Poker.deal([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
IO.puts Poker.deal([15, 33, 21, 4, 42, 19, 10, 52, 37, 29])

IO.puts "Testing pairs"
IO.puts Poker.checkPair([2,1,5,6,7])
IO.puts Poker.checkPair([2,3,3,6,7])
IO.puts Poker.checkPair([2,3,3,3,7])
IO.puts Poker.checkPair([2,3,3,7,7])

IO.puts "Testing two pairs"
IO.puts Poker.checkTwoPair([2,1,5,6,7])
IO.puts Poker.checkTwoPair([2,3,3,6,7])
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
