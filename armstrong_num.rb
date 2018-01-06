
puts "Enter first 3 digit number."
num = gets.chomp.to_i
puts "Enter second 3 digit number higher than first."
sec_num = gets.chomp.to_i
arm_num = (num..sec_num).to_a
arm_num.each {|x| puts (x%10 * (x%10 * (x%10)))}
