module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      @file = File.new(filename)
      @headers = @file.gets.chomp.split(', ')

      @file.each do |row|
        @csv_contents<< row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end

    def each
      @file.rewind
      @file.gets # skip headers
      @file.each do |row|
        yield row
      end
    end
  end
end

class RubyCsv
  include ActsAsCsv # mixin!
  acts_as_csv
end

csv = RubyCsv.new
puts csv.headers.inspect
puts csv.csv_contents.inspect
csv.each{|row| puts row }
