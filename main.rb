if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

current_puth = File.dirname(__FILE__)
questions_puth = current_puth + "/data/questions.txt"
result_puth = current_puth + "/data/result.txt"
questions_array = []
result_array = []

if File.exist?(questions_puth)
  File.open(questions_puth,"r:UTF-8") do |file|
  file.each_line {|x| questions_array.push(x.chomp)}
  end
else
  puts "Файл не найден"
end

if File.exist?(result_puth)
  File.open(result_puth,"r:UTF-8") do |file|
  file.each_line {|x| result_array.push(x.chomp)}
  end
else
  puts "Файл не найден"
end

user_name = ARGV[0]

if user_name == nil
  user_name = "Таинственный незнакомец"
end

puts "#{user_name} добро пожаловать. Предлагаем Вам пройти тест на общительность!"

result_yes = 0
result_sometimes = 0
sum = 0

for item in questions_array do
  puts item
  user_input = nil

  while (user_input != "1" and user_input != "2" and user_input != "3") do
    puts "Сделайте сой выбор:\n 1. ДА\n 2. НЕТ\n 3. ИНОГДА"
    user_input = STDIN.gets.chomp
  end

  if user_input == "1"
    result_yes += 2
  elsif
    user_input == "3"
    result_sometimes += 1
  end
end

sum = result_yes + result_sometimes
puts "Вы набрали: #{sum} баллов"

if
  sum >= 30 && sum <= 32
  puts "#{result_array[0]}"
elsif
  sum >= 25 && sum <= 29
  puts "#{result_array[1]}"
elsif
  sum >= 19 && sum <= 24
  puts "#{result_array[2]}"
elsif
  sum >= 14 && sum <= 18
  puts "#{result_array[3]}"
elsif
  sum >= 9 && sum <= 13
  puts "#{result_array[4]}"
elsif
  sum >= 4 && sum <= 8
  puts "#{result_array[5]}"
elsif
  sum <= 3
  puts "#{result_array[6]}"
end