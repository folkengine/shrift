require_relative 'shrift_map'

# I map ShriftMaps
class ShriftMapper
  attr_reader :hashmap

  def initialize(hashmap: {})
    @hashmap = hashmap
    clean
  end

  def fetch(key)
    @hashmap[key.downcase.to_sym]
  end

  def store(key, value)
    @hashmap[key] = value
  end

  def parse(shrift_map_string)
    hash = {}
    ShriftMap.new(shrift_map_string).hashmap.each do |key, val|
      hash[@hashmap[key]] = val
    end
    hash
  end

  def to_hash
    @hashmap
  end

  # :reek:UncommunicativeVariableName :reek:FeatureEnvy
  def to_shrift_string(mappie)
    return mappie if mappie.is_a?(String)
    return mappie.map { |k, v| @hashmap.key(k).to_s.downcase + v.to_s }.join if mappie.is_a?(Hash)
    @hashmap.map { |k, v| k.to_s.downcase + mappie.send(v).to_s }.join
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
    @hashmap.map { |k, v| target.send("#{v}=", shrift_map.fetch(k)) }
  end

  private

  # Convert Hash keys to symbols
  def clean
    @hashmap = Hash[@hashmap.map { |key, value| [key.downcase.to_sym, value] }]
  end
end
