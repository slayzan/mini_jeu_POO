require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


def print_menu
   puts"------------------------------------------------"
   puts"|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
   puts "|Le but du jeu est d'être le dernier survivant !|"
   puts "-------------------------------------------------"
end

def define_player
   puts 'quel est ton nom ?'
   name = gets.chomp
   player = HumanPlayer.new(name)
   player
end

def create_bot(ennemies, name)
   bot= Player.new(name)
   ennemies << bot
end

def   wait_action(ennemies)
   puts 'Quelle action veux-tu effectuer ?'
   puts ''
   puts 'a - chercher une meilleure arme'
   puts 's - chercher à se soigner'
   puts ''
   puts 'attaquer un joueur en vue :'
   puts "0 - #{ennemies[0].name} a #{ennemies[0].life_points}"
   puts "1 - #{ennemies[1].name} a #{ennemies[1].life_points}"
   action = gets.chomp
   action
end

def  do_action(action,ennemies,player)
   case action
   when 'a'
      player.search_weapon
   when 's'
      player.search_health_pack
   when '0'
      player.attacks(ennemies[0])
   when '1'
      player.attacks(ennemies[1])
   else
      puts 'Erreur commande inconnue'
   end   
end

def deal_player(ennemies, player)
   ennemies.each do |bot|
      bot.attacks(player) if bot.life_points.positive?
      puts ''
   end
end

ennemies = []
print_menu
player1 = define_player
create_bot(ennemies, 'Josiane')
create_bot(ennemies, 'José')
while player1.life_points.positive? && ennemies[0].life_points.positive? || ennemies[1].life_points.positive?
   puts ''
   player1.show_state
   puts ''
   action = wait_action(ennemies)
   puts ''
   do_action(action,ennemies,player1)
   puts ''
   puts 'les autres joueurs t\'attaquent' if ennemies[0].life_points.positive? || ennemies[1].life_points.positive?
   deal_player(ennemies,player1)
end
#binding.pry