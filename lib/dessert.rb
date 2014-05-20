class Dessert
  attr_accessor :calories, :name
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def healthy?
    calories < 200
  end
  def delicious?
    true
  end
end

class JellyBean < Dessert
  def initialize(flavor)
    @calories = 5
    @name = flavor +" jelly bean"
    @delicious = (flavor != "licorice")
  end
  def delicious?
    @delicious
  end
end
