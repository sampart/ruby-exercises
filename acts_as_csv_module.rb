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
    private def row_string_to_array(row_string)
      row_string.chomp.split(', ')
    end

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      @file = File.new(filename)
      @headers = @file.gets.chomp.split(', ')

      @file.each do |row|
        @csv_contents<< row_string_to_array(row)
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
        yield CsvRow.new(@headers, row_string_to_array(row))
      end
    end
  end
end

class CsvRow
  def initialize(headers, data)
    @headers = headers
    @data = data
  end

  def method_missing name, *args
    name_string = name.to_s
    if @headers.include? name_string
      return @data[@headers.index(name_string)]
    else
      super
    end
  end

  def methods
    @headers.each{|header| puts header}
    super
  end

  def respond_to_missing?(method_name, include_private = false)
    @headers.include? method_name.to_s || super
  end
end


class RubyCsv
  include ActsAsCsv # mixin!
  acts_as_csv
end

csv = RubyCsv.new
puts csv.headers.inspect
puts csv.csv_contents.inspect
csv.each{|row| puts row.one }
