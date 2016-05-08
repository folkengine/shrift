require_relative 'shrift_map'

# I map ShriftMaps
class ShriftMapper
  attr_reader :hashmap

  def initialize(hashmap: {})
    @hashmap = hashmap
    clean
  end

  def fetch(key)
    @hashmap[key.upcase.to_sym]
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

  # Disable :reek:FeatureEnvy
  def to_shrift_string(mappie)
    shrift_string = ''
    mappie.each do |key, val|
      shrift_string << @hashmap.key(key).to_s
      shrift_string << val.to_s
    end
    shrift_string
  end

  def to_shrift_map(mappie)
    ShriftMap.new(to_shrift_string(mappie))
  end

  private

  # Convert Hash keys to symbols
  def clean
    @hashmap = Hash[@hashmap.map { |key, value| [key.upcase.to_sym, value] }]
  end
end
