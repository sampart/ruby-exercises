limit = 10
range = 1..limit
answer = rand(range)

puts "What's your guess? (%s)" % range
loop do
  guess = gets.to_i
  break if guess == answer
  if guess < answer
    puts "Go higher"
  else
    puts "Go lower"
  end
end

puts "You got it!"
