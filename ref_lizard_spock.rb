VALID_CHOICES = %w[r p s l sp]
WINS = { player: 0, computer: 0 }
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
    WINS[:player] += 1
    prompt("Player's score: #{WINS[:player]},
            Computer's score: #{WINS[:computer]}")
  elsif win?(computer, player)
    WINS[:computer] += 1
    prompt("Player's score: #{WINS[:player]},
            Computer's score: #{WINS[:computer]}")
  else
    prompt("No point given. Player score: #{WINS[:player]},
            Computer score: #{WINS[:computer]}")
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

def game_reset(player, computer)
  WINS[:player] == 0
  WINS[:computer] == 0
end

loop do
  game_reset(player_choice, computer_choice)
  prompt('Welcome to Rock Paper Scissors Lizard Spock.  The first player to 5 points wins.')

  loop do
    choice = ''
    loop do
      prompt("Please choose one: #{first_letter}")
      player_choice = gets.chomp

      if VALID_CHOICES.include?(player_choice)
        break
      else
        prompt('That is not a valid choice.')
      end
    end

    computer_choice = VALID_CHOICES.sample

    puts("You chose: #{player_choice}; Computer chose: #{computer_choice}")

    display_results(player_choice, computer_choice)

    match_score(player_choice, computer_choice)

    if WINS[:player] == 5 || WINS[:computer] == 5
      break
    end
  end

  prompt('Would you like to play again?  Please enter y or n.')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing.  Good bye.')
