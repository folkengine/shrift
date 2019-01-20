require_relative('shrift_cell')

# A Shrift Cell where the value is in integer.
class ShriftInt < ShriftCell
  def process(target)
    target.send(field)
  end

  def set(value, target)
    target.send("#{field}=", value.to_i)
  end
end
