require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


def fight(player1, player2)
  while player1.life_points > 0 && player2.life_points > 0
    puts "Voici l'état de chaque joueur :"
    puts player1.show_state
    puts player2.show_state
    puts " "

    puts "Passons à la phase d'attaque :"
    player1.attacks(player2)
    if player2.life_points <= 0
      break
    end
    player2.attacks(player1)
  end
end

def perform
  player1 = Player.new("Josiane")
  player2 = Player.new("José")
  fight(player1, player2)
end

perform