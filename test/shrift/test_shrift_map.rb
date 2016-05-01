require 'psych'
require 'shrift'

require_relative('../test_helper')
require_relative('examples/character')

class TestShriftMap < Minitest::Test
  include Shrift

  def setup
    @shrift_map = ShriftMap.new({ch: 'charisma', dx: 'dexterity'})
  end

  def test_new
    assert_equal @shrift_map.fetch(:ch), 'charisma'
    assert_equal @shrift_map.fetch(:dx), 'dexterity'
  end

  def test_store
    @shrift_map.store(:s, 'strength')
    @shrift_map.store(:st, 'strength')
    assert_equal @shrift_map.fetch(:s), 'strength'
    assert_equal @shrift_map.fetch(:st), 'strength'

    # first = ['Character', {foo: 20, bar: 10}, 20, 4010, Example::Character]
  end
end
