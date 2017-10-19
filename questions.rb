class Questions
  attr_reader :sum

  def initialize
    @questions_file_name = "#{File.dirname(__FILE__)}/data/questions.txt"
    @questions_array = []
    @sum = 0
  end

  def question_read
    File.open(@questions_file_name, "r:UTF-8") do |file|
      file.each_line {|x| @questions_array.push(x.chomp)}
    end
  end

  def print_question
    @questions_array.each do |question|
      puts question
      user_input = nil

      while user_input != "1" and user_input != "2" and user_input != "3" do
        puts "Сделайте сой выбор:\n 1. ДА\n 2. НЕТ\n 3. ИНОГДА"
        user_input = STDIN.gets.chomp
      end

      if user_input.include?("1")
        @sum += 2
      elsif user_input.include?("3")
        @sum += 1
      end
    end
  end
end