require 'pry'

class Owner
  @@all = []
    def initialize(name, species="human")
      @name = name
      @species = species
      @@all << self
    end

    def name
      @name
    end

    def species
      @species
    end

    def say_species
      return "I am a #{@species}."
    end

    def self.all
      @@all
    end
    
    def self.count
      @@all.count
    end

    def self.reset_all
      @@all.clear
    end

    def cats
      Cat.all.select {|cat| cat.owner == self}
    end

    def dogs
      Dog.all.select {|dog| dog.owner == self}
    end

    def buy_cat(cat_name)
      Cat.new(cat_name,owner=self)
    end

    def buy_dog(dog_name)
      Dog.new(dog_name,owner=self)
    end

    def walk_dogs
      Dog.all.each do |dogs|
        dogs.mood = "happy"
      end
    end

    def feed_cats
      Cat.all.each do |cats|
        cats.mood = "happy"
      end
    end

    def sell_pets
      self.dogs.each do |my_dogs|
        my_dogs.mood = "nervous"
        my_dogs.owner = nil
      end
      self.cats.each do |my_cats|
        my_cats.mood = "nervous"
        my_cats.owner = nil
      end
    end

    def list_pets
      return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end  
end

# binding.pry