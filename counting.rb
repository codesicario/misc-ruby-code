5.times do |index|
  puts index
  break if index == 2
end

#---------------------------

number = 0

until number == 10
  number += 1
  next if number.odd?
    puts number
end

#---------------------------------

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)

  next unless number_a == 5 || number_b == 5

  puts "5 was reached!"
  break
end

#---------------------------


def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end
