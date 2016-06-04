# A basic Shrift Cell mapping to a String.
class ShriftCell
  attr_reader :field

  def initialize(field)
    @field = field
  end

  def process(target)
    target.send(field)
  end

  def set(value, target)
    target.send("#{@field}=", value)
  end
end
