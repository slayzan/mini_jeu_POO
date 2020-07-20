require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("jean")
player2 = Player.new("jossiane")
while (player1.life_points.positive? && player2.life_points.positive?)
   puts "Voici l'etat de chaque joueur :"
   player1.show_state
   player2.show_state
   puts ""
   puts "Passons à la phase d'attaque:"
   player2.attacks(player1)
   break if player1.life_points.negative?
   player1.attacks(player2)
   puts ""
end
#binding.pry