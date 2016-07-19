require 'shrift/shrift_cell'
require 'shrift/shrift_factory'
require 'shrift/shrift_int'
require 'shrift/shrift_map'
require 'shrift/shrift_mapper'

# Making short shrift of Objects.
class Shrift
  attr_reader :clazz

  def initialize(clazz, guide = [])
    @clazz = clazz
    @guide = guide
  end

  # Turns the target class into a Shrift String
  def short(target)
    @guide.map { |cell| cell.process(target) }.join(':')
  end

  def classify(shrift_string)
    zippy = @guide.zip(shrift_string.split(':'))
    objective = Object.const_get(clazz.to_s).new

    zippy.each do |cell|
      cell[0].set(cell[1], objective)
    end

    objective
  end
end
