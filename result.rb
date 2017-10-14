class Result
  attr_reader :result_array

  def initialize
    @result_file_name = "#{File.dirname(__FILE__)}/data/result.txt"
    @result_array = []
  end

  def result_read
    File.open(@result_file_name, "r:UTF-8") do |file|
      file.each_line {|x| result_array.push(x.chomp)}
    end
  end
end