require 'shrift'

require_relative('../test_helper')

class TestShriftMap < Minitest::Test
  include Shrift

  def setup
    @shrift_map_string = 's15ch20dx19'
    @shrift_map = ShriftMap.new(@shrift_map_string)
  end

  def test_new
    assert_equal 15, @shrift_map.fetch(:s)
    assert_equal 20, @shrift_map.fetch(:ch)
    assert_equal 19, @shrift_map.fetch(:dx)
  end

  def test_invalid
    shrift_map_string = 's15ch20dx'
    assert_raises(ShriftException) { ShriftMap.new(shrift_map_string) }
  end

  def test_to_s
    assert_equal @shrift_map.to_s, @shrift_map_string
  end

  def test_to_shrift_map
    hash = {S: 16, CH: 16}
    shrift_map = ShriftMap.to_shrift_map(hash)
    assert_equal hash, shrift_map.hashmap
  end
end
