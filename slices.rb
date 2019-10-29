numbers = [*1..16]
slice = []

# This could be done with each_slice - the point is to do it by hand
numbers.each do |x|
  slice.push(x)
  if slice.length == 4 then
    print slice
    puts ""
    slice = []
  end
end
