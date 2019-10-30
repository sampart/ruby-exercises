if ARGV.length != 1
  puts "Please specify one string to search for"
  exit
end

contents = File.read('file.txt')
contents.split(/\r?\n/).each do |line|
  puts line if line.match?(/.*#{Regexp.quote(ARGV[0])}.*/)
end
