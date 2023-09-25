require_relative 'human_player'
require_relative 'computer_player'
require_relative 'mastermind.rb'
require 'colorize'

def be_the_creator
    valid_feedback = []
    valid_combination = []
    attempt = 0


    # The computer
    puts "You'll make the secret color combination that the laptop has to guess"
    Mastermind.set_secret_combination(HumanPlayer.human_makes_combinations)

    computer_player_combination = ComputerPlayer.computer_make_combination
    feedback = Mastermind.send_feedback(computer_player_combination)

    puts "Good, Now the laptop is guessing your secret color combination"

    10.times do
        attempt += 1
        computer_player_combination = ComputerPlayer.guess_combination_from_feedback(feedback)
        feedback = Mastermind.send_feedback(computer_player_combination)
        

        valid_feedback = Mastermind.send_feedback(merge(ComputerPlayer.show_valid_colors, computer_player_combination))
        valid_combination = merge(ComputerPlayer.show_valid_colors, computer_player_combination)
        puts "\n"
        puts "Attempts: " + attempt.to_s
        thinking
        puts "\n"
        puts Mastermind.show_colors(valid_combination) + Mastermind.vizualize_feedback(valid_feedback)
        puts "\n"
        if valid_combination == Mastermind.show_secret_combination
            puts "=" * 50
            puts "\n"
            puts "Number of attemps: " + attempt.to_s
            puts "\n"
            puts "The laptop has successfully  guessed you color combination. It is:".light_green
            puts "\n"
            puts Mastermind.show_colors(valid_combination)
            break
        end
        
    end
    if valid_combination != Mastermind.show_secret_combination
        puts "=" * 50
        puts "\n"
        puts "Number of attemps: " + attempt.to_s
        puts "Unfortunately the laptop has failled to guess your code. You WON".light_blue
    end