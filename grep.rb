if ARGV.length != 1
  puts "Please specify one string to search for"
  exit
end

contents = File.read('file.txt')
contents.split(/\r?\n/).each_with_index do |line, index|
  puts "%d: %s" % [index + 1, line] if line.match?(/.*#{Regexp.quote(ARGV[0])}.*/)
end
