require_relative 'shrift_map'

# I map ShriftMaps
class ShriftMapper
  attr_reader :schema

  def initialize(schema: {})
    @schema = schema
    clean
  end

  def fetch(key)
    @schema[key.downcase.to_sym]
  end

  def store(key, value)
    @schema[key] = value
  end

  def parse(shrift_map_string)
    Hash[ShriftMap.new(shrift_map_string).schema.map { |key, val| [@schema[key], val] }]
  end

  def to_hash
    @schema
  end

  # :reek:UncommunicativeVariableName :reek:FeatureEnvy
  def to_shrift_string(mappie)
    return mappie if mappie.is_a?(String)
    return mappie.map { |k, v| @schema.key(k).to_s.downcase + v.to_s }.join if mappie.is_a?(Hash)
    @schema.map { |k, v| k.to_s.downcase + mappie.send(v).to_s }.join
  end

  def to_shrift_map(mappie)
    ShriftMap.new(to_shrift_string(mappie))
  end

  # Shrift Cell Methods

  def process(target)
    to_shrift_string(target)
  end

  # :reek:UncommunicativeVariableName
  def set(value, target)
    shrift_map = to_shrift_map(value)
    @schema.map { |k, v| target.send("#{v}=", shrift_map.fetch(k)) }
  end

  private

  # Convert Hash keys to symbols
  def clean
    @schema = Hash[@schema.map { |key, value| [key.downcase.to_sym, value] }]
  end
end
