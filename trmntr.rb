def say(statement)
  puts statement
end

def show_intro
  title = File.readlines("trmntr.txt","r+")
  title = title[0].split("\n")

  t_ascii = File.readlines("trmntr6.txt","r+")
  t_ascii = t_ascii[0].split("\n")

  say "\nWELCOME TO: \n"
  say title
  say ""
  say t_ascii
  say "\nGive us your name survivor:"
  name_input = gets.chomp
end

def ask_question(question, options)
  say question
  say "Options: #{options}"
  gets.chomp.downcase 
end

name = show_intro

Decisions = %w(rock paper scissors)

  def askFuture(future)
    if future == "yes" || future == "y"

      say "\nFinally! Somebody who is ready to stand up against the machines!\n"
      sleep(5)
      say "\nBut the only way to beat them is...\n"
      sleep(5)

    else future == "no" || future == "n"

      doom = File.readlines("trmntr5.txt","r+")
      doom = doom[0].split("\n")
      say ""
      say doom
      sleep(2)
      say "\nRestart the game?"
      say "Options: (Y)es/(N)o"
      rstrt_input = gets.chomp.downcase
  
        if rstrt_input == "yes" || rstrt_input == "y"
          load "trmntr.rb"
        else rstrt_input == "no" || rstrt_input == "n"
          exit
        end

    end  
  end

# Question 1
future = ask_question("\n#{name}, the future of our world is in your \"hands\". Are you up for it?", "(Y)es/(N)o")
askFuture(future)
  
  def askRPS(rps, future) 
    if rps == "yes" || rps == "y"
      say "\nGood! Now go into battlefield and defeat them!\n"
      sleep(2)
    else rps == "no" || rps == "n"
      say "\nToo bad... learn how to! Our future depends on you!\n"
      sleep(2)
    end
  end

# Question 2
rps = ask_question("\nYou know how to play rock, paper or scissors?\n", "(Y)es/(N)o")
askRPS(rps, future)

# Round Starts
  draws = wins = losses = 0
  5.times do
    begin
      say "\n>>>>>>>>>>>>>>>>>>Start the round by entering rock paper or scissors<<<<<<<<<<<<<<<<<<\n"
      player_choice = gets.chomp.downcase
    end until Decisions.include?(player_choice)

    machine_choice_idx = rand(3)

    say "\nYou chose #{player_choice}, T-3000 choose #{Decisions[machine_choice_idx]}\n"

    if player_choice == Decisions[machine_choice_idx]
      say "\n====>Draw. This machine is a tough one to crack!\n"
      draws += 1
    elsif player_choice == Decisions[machine_choice_idx - 1]
      say "\n====>T-3000 wins\n"
      losses += 1
    else
      say "\n====>YOU WIN! KEEP GOING\n"
      wins += 1
    end
  end

# Game Results
  puts "\nWins : #{wins}\nLosses : #{losses}\nDraw:    #{draws}"
  if wins > losses
    
    win = File.readlines("trmntr2.txt","r+")
    win = win[0].split("\n")
    say ""
    say win
    say "\nYou saved us #{name}! HUMANITY HAS BEEN SAVED!!\n"
  
  elsif wins < losses
    
    lose = File.readlines("trmntr4.txt","r+")
    lose = lose[0].split("\n")
    say ""
    say lose
    say "\nIts a sad day.. You have lost and the world will be dominated by machines!\n"
  
  elsif wins == losses
    
    draw = File.readlines("trmntr3.txt","r+")
    draw = draw[0].split("\n")
    say ""
    say draw
    say "\nThis machine is hard to beat. Until next time!\n"

  end

# Restart Game
  sleep(5)
  say "\nRestart the game?"
  say "Options: (Y)es/(N)o"
  restart_input = gets.chomp.downcase
  
  if restart_input == "yes" || restart_input == "y"
    load "trmntr.rb"
  else restart_input == "no" || restart_input == "n"
    exit
  end
  