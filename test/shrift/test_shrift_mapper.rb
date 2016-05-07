require 'shrift'

require_relative('../test_helper')
require_relative('examples/character')

class TestShriftMapper < Minitest::Test
  include Shrift

  def setup
    @shrift_mapper = ShriftMapper.new({ch: 'charisma', dx: 'dexterity'})
  end

  def test_new
    assert_equal '15', @shrift_map.fetch(:s)
    assert_equal '20', @shrift_map.fetch(:ch)
    assert_equal '19', @shrift_map.fetch(:dx)
  end

  def test_invalid
    shrift_map_string = 's15ch20dx'
    assert_raises(ShriftException) {ShriftMap.new(shrift_map_string)}
  end

  def test_to_s
    assert_equal @shrift_map.to_s, @shrift_map_string
  end
end
