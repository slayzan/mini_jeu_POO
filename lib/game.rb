class Game
   attr_accessor :human_player, :enemies

   def initialize(name)
      i = 0
      @human_player = HumanPlayer.new(name)
      @enemies = []
      4.times {create_bot(Faker::Name.name)}
   end

   def create_bot(name)
      bot = Player.new(name)
      @enemies << bot
   end

   def show_ennemies
      @enemies.each {|bot| puts bot.name}
   end

   def kill_player
      @enemies.each do |bot|
         if bot.life_points.negative?
            @enemies.delete(bot) 
            puts "#{bot.name} est mort"
         end
      end
   end

   def is_still_going?
      @enemies.count.positive? && human_player.life_points.positive?
   end

   def show_player
      @human_player.show_state
      @enemies.each {|bot| puts "#{bot.name} a encore #{bot.life_points} point de vie"}
   end

   def menu
      puts "Quelle action veux-tu effectuer ?\n"
      puts 'a - chercher une meilleure arme'
      puts "s - chercher à se soigner\n"
      puts 'attaquer un joueur en vue :'
      f1 = fight_rand_ennemie
      puts "0 - #{@enemies[f1].name} a #{@enemies[f1].life_points} point de vie"
      f2 = fight_rand_ennemie
      puts "1 - #{@enemies[f2].name} a #{@enemies[f2].life_points} point de vie"
      choose = gets.chomp
      print ''
      menu_choice(choose,f1,f2)
   end

   def menu_choice(choose,f1,f2)
      case choose
      when 'a'
         human_player.search_weapon
      when 's'
         human_player.search_health_pack
      when '0'
         human_player.attacks(@enemies[f1])
      when '1'
         human_player.attacks(@enemies[f2])
      else
         puts 'Erreur commande inconnue'
      end   
   end

   def fight_rand_ennemie
      left = 0
      @enemies.each {|bot| left += 1}
      choose = rand(0..left - 1)
      choose
   end

   def check_dead
      @enemies.each {bot}
   end
   def enemies_attack
      @enemies.each { |ennemy| ennemy.attacks(human_player) }
   end

   def end
      puts human_player.life_points <= 0 ? 'T\'as perdu !' : 'Bien joue'
   end
end