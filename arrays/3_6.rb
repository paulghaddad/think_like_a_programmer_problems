class Cipher
  attr_reader :string, :key

  CIPHER_CODES = [*"A".."Z"]
  UPPERCASE_ASCII_VALUES = [*65..90]
  MAX_KEY = 24

  def initialize(string:)
    @string = string
    @key = generate_random_key
  end

  def encode
    encoded_text = ""

    string.each_char do |char|
      char_ascii_value = char.ord

      if uppercase_letter?(char_ascii_value)
        character_number = (char_ascii_value - "A".ord + key) % 26
        encoded_text << CIPHER_CODES[character_number]
      else
        encoded_text << char
      end
    end

    encoded_text
  end

  def decode
    decoded_text = ""

    string.each_char do |char|
      char_ascii_value = char.ord

      if uppercase_letter?(char_ascii_value)
        character_number = (char_ascii_value - "A".ord - key) % 26
        decoded_text << CIPHER_CODES[character_number]
      else
        decoded_text << char
      end
    end

    decoded_text
  end

  private

  def uppercase_letter?(ascii_value)
    UPPERCASE_ASCII_VALUES.include?(ascii_value)
  end

  def generate_random_key
    Random.rand(MAX_KEY) + 1
  end
end
