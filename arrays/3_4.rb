class Cipher
  attr_reader :plaintext, :key

  CIPHER_CODES = [*"a".."z"]
  UPPERCASE_ASCII_VALUES = [*65..90]

  def initialize(plaintext:, key: 0)
    @plaintext = plaintext
    @key = key
  end

  def to_cipher
    cipher_text = ""

    plaintext.each_char do |char|
      char_ascii_value = char.ord

      if uppercase_letter?(char_ascii_value)
        character_number = (char_ascii_value - "A".ord + key) % 26
        cipher_text << CIPHER_CODES[character_number]
      else
        cipher_text << char
      end
    end

    cipher_text
  end

  private

  def uppercase_letter?(ascii_value)
    UPPERCASE_ASCII_VALUES.include?(ascii_value)
  end
end
