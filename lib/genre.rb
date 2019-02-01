class Genre 
  attr_reader :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def artists
    
  end
  
  
end