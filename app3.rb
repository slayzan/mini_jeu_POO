require 'bundler'
require 'faker'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def print_menu
   puts"------------------------------------------------"
   puts"|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
   puts "|Le but du jeu est d'être le dernier survivant !|"
   puts "-------------------------------------------------"
end

print_menu
puts "comment veut-tu t'appeler ?"
name = gets.chomp

d1 = Game.new(name)
while d1.is_still_going?

   puts ''
   d1.menu
   puts ''
   d1.kill_player
   puts "les autres joueurs t\'attaquent\n" if d1.is_still_going?
   d1.enemies_attack
   sleep 2
   puts ''
   d1.show_player
end
d1.end
