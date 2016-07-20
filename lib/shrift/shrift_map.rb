require_relative 'shrift_exception'

# A String that alternates between characters and numbers. Short hand for a collection
# of variables that hold integer values.
#
# Shrift map keys are lowercase.
#
class ShriftMap
  attr_reader :schema, :shrift_map_string

  def initialize(shrift_map_string)
    @shrift_map_string = shrift_map_string
    @schema = {}
    split(shrift_map_string)
  end

  def fetch(key)
    @schema[key.downcase.to_sym].to_i
  end

  def store(key, value)
    @schema[key.downcase.to_sym] = value.to_i
  end

  def to_hash
    @schema
  end

  def to_s
    @shrift_map_string
  end

  def self.to_shrift_map(hash)
    ShriftMap.new(ShriftMap.to_shrift_map_string(hash))
  end

  def self.to_shrift_map_string(hash)
    hash.map { |key, val| "#{key}#{val}" }.join
  end

  private

  def split(shrift_map_string)
    until shrift_map_string.empty?
      shrift_group = shrift_map_string.scan(/^([a-zA-Z]+)(\d+)(.*)/).first
      begin
        store(shrift_group[0], shrift_group[1])
      rescue NoMethodError
        raise ShriftException, "Unbalanced ShriftMap: #{@shrift_map_string}"
      end
      shrift_map_string = shrift_group[2]
    end
  end
end
