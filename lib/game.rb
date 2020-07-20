class Player
   attr_accessor :name, :life_points

   def initialize(name)
      @name = name
      @life_points = 10
   end

   def show_state
         puts "#{@name} a #{@life_points} points de vie"
   end

   def gets_damage(damage)
      @life_points = @life_points.positive? ? @life_points - damage : 0
      puts "le joueur #{@name} a été tué !" if @life_points <= 0
   end

   def attacks(player)
      dgt = compute_damage
      puts "#{@name} attaque le joueur #{player.name}"
      puts "il lui inflige #{dgt} points de dégats"
      player.gets_damage(dgt)
   end

   def compute_damage
      damage = rand(1..6)
      damage += 4 if damage == 6
      damage
   end
end

class HumanPlayer < Player
   attr_accessor :weapon_level

   def initialize(name)
      @name = name
      @life_points = 100
      @weapon_level = 1
   end
   
   def show_state
      puts "#{@name} a #{@life_points} point de vie et une arme de niveau #{@weapon_level}"
   end

   def compute_damage
      super * @weapon_level
   end

   def search_weapon
      level = rand(1..6)
      puts "tu as trouvé une arme de niveau #{level}"
      puts level > @weapon_level ? "Youhou ! elle est meilleure que ton arme actuelle : tu la prends" : "M@*#$... elle n'est pas mieux que ton arme actuelle..."
      @weapon_level = level > @weapon_level ? level : @weapon_level
   end
   
   def search_health_pack
    pack = rand(1..6)
    puts "Tu n'as rien trouvé..." if pack == 1
    if pack > 1 && pack < 6
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points + 50 > 100 ? @life_points = 100 : @life_points += 50
    elsif pack == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points + 80 > 100 ? @life_points = 100 : @life_points += 80
    end
  end
end