contents = File.read('file.txt')
contents.split(/\r?\n/).each do |line|
  puts line if line.match?(/.*monkey.*/)
end
