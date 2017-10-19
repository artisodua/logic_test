if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "questions"
require_relative "result"

user_name = ARGV[0]
user_name = "Таинственный незнакомец" if user_name == nil

puts "#{user_name} добро пожаловать. Предлагаем Вам пройти тест на общительность!"

question = Questions.new
question.question_read
question.print_question

result = Result.new
result.result_read

def print_result(sum, result_array)
  case sum
    when 30..32 then puts "#{result_array[0]}"
    when 25..29 then puts "#{result_array[1]}"
    when 19..24 then puts "#{result_array[2]}"
    when 14..19 then puts "#{result_array[3]}"
    when 9..13 then puts "#{result_array[4]}"
    when 4..8 then puts "#{result_array[5]}"
    when 0..3 then puts "#{result_array[6]}"
  end
end

print_result(question.sum, result.result_array)