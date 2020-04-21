require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

@user
@player1
@player2
@enemies


def welcome_message
  puts "Bienvenue dans le jeu le plus golri de l'histoire"
  puts "_________________________________________________"
end

def fight(user, player1, player2, enemies)
  while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    user.show_state
    puts "Quelle action veux-tu effectuer ?
    > Tape a pour : chercher une meilleure arme
    > Tape s pour : chercher à te soigner 
    Ou tu peux aussi attaquer un joueur en vue :
    > Tape 0 pour : attaquer Josiane"
    player1.show_state
    puts "> Tape 1 pour : attaquer José"
    player2.show_state

    action = gets.chomp

    if action == "a" 
      user.search_weapon
    elsif action == "s"
      user.search_health_pack
    elsif action == "0"
      user.attacks(player1)
    elsif action == "1"
      user.attacks(player2)
    else puts "tu n'as pas rentré une des 4 possibilités : a, s, 0 ou 1"
    action = gets.chomp
    end
    puts "Fin du tour"
    puts "----------------------------------------"
    puts "       "

    puts "Les autres t'attaquent"
    enemies.each do |player|
    if player.life_points <= 0
    end
    player.attacks(user)
    puts "Fin du tour"
    puts "----------------------------------------"
    puts "       "
    end
  end
end

def final_announcement(user)
puts "La partie est finie"
  if user.life_points > 0 
    puts "BRAVO TU AS GAGNE"
  else puts "Loser ! Tu as perdu !"
  end
end

def perform
  welcome_message
  puts "Comment s'appelle ton personnage ?"
  user = HumanPlayer.new(gets.chomp)
  puts "    "
  player1 = Player.new("Josiane")
  player2 = Player.new("José")
  enemies = [player1, player2]
  fight(user, player1, player2, enemies)
  final_announcement(user)
end

perform
