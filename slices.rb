numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
slice = []

numbers.each do |x|
  slice.push(x)
  if slice.length == 4 then
    print slice
    puts ""
    slice = []
  end
end
