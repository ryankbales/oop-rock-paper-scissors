require 'pry'

module Winner
  def get_winner(choices) #takes an array of two items
    win_lose_tie = ""
    if choices[0] == "rock"
      if choices[1] == "paper"
        win_lose_tie = "lose"
      elsif  choices[1] == "scissors"
        win_lose_tie = "win"
      else
        win_lose_tie = "tie"
      end
    end

    if choices[0] == "paper"
      if choices[1] == "rock"
        win_lose_tie = "win"
      elsif  choices[1] == "scissors"
        win_lose_tie = "lose"
      else
        win_lose_tie = "tie"
      end
    end

    if choices[0] == "scissors"
      if choices[1] == "rock"
        win_lose_tie = "lose"
      elsif  choices[1] == "paper"
        win_lose_tie = "win"
      else
        win_lose_tie = "tie"
      end
    end
    return win_lose_tie
  end
end

class Human
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def play_again?(response, status)
    status = (response == "yes") ? true : false
  end
end

class Machine
  attr_reader :name
  def initialize
    @name = "McApple"
  end
end

class RockPaperScissors
  include Winner
  attr_accessor :player1, :player2

  def initialize
    puts "Let's play Rock, Paper, Scissors!"
    puts "=================================================================="
  end

  def play
    puts "Enter your name:"
    name = gets.chomp.capitalize
    player1 = Human.new(name)
    player2 = Machine.new
    response = "yes" #default is set to keep the game playing unless player says no
    status = true
    while player1.play_again?(response, status)
      begin
        puts "#{player1.name} choose: (r)ock, (p)aper or (s)cissors"
        human_input = gets.chomp.downcase.to_sym
      end until WEAPONS.keys.include?(human_input)
      machine_choice = WEAPONS.keys.shuffle.first

      choices = []
      choices << WEAPONS[human_input]
      choices << WEAPONS[machine_choice]

      result = self.get_winner(choices)
      puts "#{player2.name} picked #{choices[1]}"
      puts "#{player1.name} picked #{choices[0]}"

      if result == "win"
        puts "#{player1.name}, you win!"
      elsif result == "lose"
        puts "Ah shucks, #{player1.name} lost!"
      else
        puts "It's a tie, try again!"
      end
      puts "#{player1.name}, would you like to play again?"
      response = gets.chomp.downcase
    end
  end
end

WEAPONS = {r: "rock", p: "paper", s: "scissors"}
game = RockPaperScissors.new()
game.play
