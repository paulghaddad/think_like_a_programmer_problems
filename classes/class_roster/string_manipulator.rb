require 'forwardable'

class StringManipulator
  extend Forwardable
  def_delegator :@string, :[], :[]

  attr_reader :string

  def initialize(string)
    @string = string
  end

  def append(character)
    string + character
  end

  def concatenate(appended_string)
    string + appended_string
  end

  def character_at(position)
    raise ArgumentError if position > string.length - 1
    string[position]
  end
end
