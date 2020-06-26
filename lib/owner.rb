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
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
    dog.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)

  end

  def buy_dog (name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    Cat.all.each do |cat|
      cat.mood = "nervous"
    end

    Dog.all.each do |dog|
      dog.mood = "nervous"
    end
    
    Cat.all.each do |cat|
      cat.owner = nil
    end

    Dog.all.each do |dog|
      dog.owner = nil
    end


  end

  def list_pets
    cat_list = Cat.all.select do |cat|
      cat.owner == self
    end

    dog_list = Dog.all.select do |dog|
      dog.owner == self
    end 
    "I have #{dog_list.length} dog(s), and #{cat_list.length} cat(s)."
  end



end
