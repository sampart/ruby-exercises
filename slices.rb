numbers = [*1..16]
slice = []

numbers.each do |x|
  slice.push(x)
  if slice.length == 4 then
    print slice
    puts ""
    slice = []
  end
end
