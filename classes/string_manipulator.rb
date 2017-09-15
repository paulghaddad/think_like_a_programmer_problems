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
    raise ArgumentError if invalid_position?(position)
    string[position]
  end

  def remove(position, number)
    raise ArgumentError if invalid_position?(position)
    ending_position = position + number

    new_string = ""
    string.each_char.with_index do |char, i|
      new_string << char unless i.between?(position, ending_position - 1)
    end

    new_string
  end

  private

  def invalid_position?(position)
    position > string.length - 1
  end
end
