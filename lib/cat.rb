class Cat
  # code goes here
  @@all = []

  attr_accessor :owner, :mood
  attr_reader :name

  def initialize(name, owner, mood="nervous")
    @name = name
    @owner = owner
    @mood = mood
    @species = "cat"
    @@all << self
  end

  def self.all
    @@all
  end

end