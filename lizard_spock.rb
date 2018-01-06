
VALID_CHOICES = %w[r p s l sp]
first_letter = { rock: 'r',
                 paper: 'p',
                 scissors: 's',
                 lizard: 'l',
                 spock: 'sp' }

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == 'r' && second == 's') ||
    (first == 'r' && second == 'l') ||
    (first == 'p' && second == 'r') ||
    (first == 'p' && second == 'sp') ||
    (first == 's' && second == 'p') ||
    (first == 's' && second == 'l') ||
    (first == 'l' && second == 'p') ||
    (first == 'l' && second == 'sp') ||
    (first == 'sp' && second == 's') ||
    (first == 'sp' && second == 'r')
end

def match_score(player, computer)
  if win?(player, computer)
    wins[:player] += 1
    prompt("Player's score: #{wins[:player]},
            Computer's score: #{wins[:computer]}")
  elsif win?(computer, player)
    wins[:computer] += 1
    prompt("Player's score: #{wins[:player]},
            Computer's score: #{wins[:computer]}")
  else
    prompt("No point given. Player score: #{wins[:player]},
            Computer score: #{wins[:computer]}")
  end
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You Won!')
  elsif win?(computer, player)
    prompt('Computer Won!')
  else
    prompt("It's a tie!")
  end
end

loop do
  wins = { player: 0, computer: 0 }
  prompt('Welcome to Rock Paper Scissors Lizard Spock')

  loop do
    choice = ''
    loop do
      prompt("Please choose one: #{first_letter}")
      choice = gets.chomp

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt('That is not a valid choice.')
      end
    end

    computer_choice = VALID_CHOICES.sample

    puts("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_results(choice, computer_choice)

    match_score(choice, computer_choice)

    if wins[:player] == 5 || wins[:computer] == 5
      break
    end
  end

  prompt('Would you like to play again?  Please enter y or n.')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing.  Good bye.')
