#Owner instance methods
#    #cats
#      returnsa a collection of all the cats that belong to the owner (FAILED - 1)
#    #dogs
#      returnsa a collection of all the dogs that belong to the owner (FAILED - 2)
#    #buy_cat
#      can buy a cat that is an instance of the Cat class (FAILED - 3)
#      knows about its cats (FAILED - 4)
#    #buy_dog
#      can buy a dog that is an instance of the Dog class (FAILED - 5)
#      knows about its dogs (FAILED - 6)
#    #walk_dogs
#      walks the dogs which makes the dogs' moods happy (FAILED - 7)
#    #feed_cats
#      feeds cats which makes the cats' moods happy (FAILED - 8)
#    #sell_pets
#      can sell all its pets, which makes them nervous (FAILED - 9)
#      can sell all its pets, which leaves them without an owner (FAILED - 10)
#    #list_pets
#      can list off its pets (FAILED - 11)
require 'pry'
class Owner
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  def say_species
    "I am a human."
  end
  def self.all
    @@all
  end
  def self.count
    self.all.count
  end
  def self.reset_all
    @@all = []
  end
  def cats
    Cat.all.select do |person|
      person.owner == self
    end  
  end 
  def dogs
    Dog.all.select do |person|
      person.owner == self
    end  
  end 
  def buy_cat(name)
    Cat.new(name, self)
  end   
  def buy_dog(name)
    Dog.new(name, self)
  end
  def walk_dogs
    self.dogs.map {|dog| dog.mood = "happy"}
  end  
  def feed_cats
    self.cats.map {|cat| cat.mood = "happy"}
  end  
  def sell_pets
    pets = self.cats + self.dogs
    pets.map do |pets| 
      pets.mood = "nervous" 
      pets.owner = nil
    end  
  end 
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end            
end