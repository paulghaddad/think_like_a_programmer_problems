class AsciiConverter
  def self.convert_to_integer(character:)
    character.ord - "0".ord
  end
end
