VALID_CHOICES = ["rock", "paper", "scissors"]

def display_results(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
      (player == 'paper' && computer == 'rock') ||
      (player == 'scissors' && computer == 'paper')
    prompt("You Won!")
  elsif (player == 'rock' && computer == 'paper') ||
        (player == 'paper' && computer == 'scissors') ||
        (player == 'scissors' && computer == 'rock')
      prompt("Computer Won!")
  else
      prompt("It's a tie!")
  end
end

def test_method
  prompt('test message')
end

test_method

def prompt(message)
  puts("=> #{message}")
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt('That is not a valid choice.')
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts ("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt('Do you want to play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt('Thank you for playing.  Good bye.')
