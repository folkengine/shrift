# Shrift

[![Build Status](https://travis-ci.org/folkengine/shrift.svg?branch=master)](https://travis-ci.org/folkengine/shrift)

Makes short shrift of objects. 

## Warning

This is alpha software and only works with basic Objects. 

Shrift is a simple DSL generator that turns Objects to single line Strings for easy storage and debugging. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shrift'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shrift

## Usage

Given a simple class: 

```ruby
class Character
  attr_accessor :character_name, :strength, :dexterity,
                :constitution, :wisdom, :intelligence, :charisma, :hit_points

  def initialize(character_name = '')
    @character_name = character_name
  end
end
```

I setup a Shrift that maps the first cell  to character_name, the second cell to a ShriftMap of most of the integer 
fields, and the third field mapped as an integer to hit_points:

```ruby
shrift_mapper = ShriftMapper.new(hashmap: {
        ST: 'strength',
        DX: 'dexterity',
        CN: 'constitution',
        W: 'wisdom',
        I: 'intelligence',
        CH: 'charisma'})
shrift = Shrift.new(Character, [ShriftCell.new(:character_name), shrift_mapper, ShriftInt.new(:hit_points)])

bub = Character.new('bub')
bub.strength = 15
bub.dexterity = 14
bub.constitution = 10
bub.wisdom = 18
bub.intelligence = 3
bub.charisma = 6
bub.hit_points = 4

bubbu_shrift = shrift.short(bub)
```

This returns a Shrift String of:
 
```ruby
bub:st15dx14cn10w18i3ch6:4
```

To turn it back into an Object, I just need to pass the Shrift String into the Shrift's classify method:

```ruby
new_bub = @shrift.classify(bubbu_shrift)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/folkengine/shrift.

