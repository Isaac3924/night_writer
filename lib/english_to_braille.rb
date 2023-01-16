class EnglishToBraille
  attr_reader :message

  def initialize(message)
    @message = message.downcase
  end

  def translate
    braille_alhpabet = { "a" => ["0.", "..", ".."],
                         "b" => ["0.", "0.", ".."],
                         "c" => ["00", "..", ".."],
                         "d" => ["00", ".0", ".."],
                         "e" => ["0.", ".0", ".."],
                         "f" => ["00", "0.", ".."],
                         "g" => ["00", "00", ".."],
                         "h" => ["0.", "00", ".."],
                         "i" => [".0", "0.", ".."],
                         "j" => [".0", "00", ".."],
                         "k" => ["0.", "..", "0."],
                         "l" => ["0.", "0.", "0."],
                         "m" => ["00", "..", "0."],
                         "n" => ["00", ".0", "0."],
                         "o" => ["0.", ".0", "0."],
                         "p" => ["00", "0.", "0."],
                         "q" => ["00", "00", "0."],
                         "r" => ["0.", "00", "0."],
                         "s" => [".0", "0.", "0."],
                         "t" => [".0", "00", "0."],
                         "u" => ["0.", "..", "00"],
                         "v" => ["0.", "0.", "00"],
                         "w" => [".0", "00", ".0"],
                         "x" => ["00", "..", "00"],
                         "y" => ["00", ".0", "00"],
                         "z" => ["0.", ".0", "00"],
                         " " => ["..", "..", ".."]
                        }

    braille_message = []

    @message.chars.each do |letter|
      match = braille_alhpabet.keys.find {|key| key == letter}
      if match == nil
        braille_message << letter
      else
        braille_message << braille_alhpabet[match]
      end
    end

    braille_format = {line1: [],
                      line2: [],
                      line3: []}

    braille_message.each do |braille_letter|
      braille_format[:line1] << braille_letter[0]
      braille_format[:line2] << braille_letter[1]
      braille_format[:line3] << braille_letter[2]
    end

    braille_formatted_message = "#{braille_format[:line1].join}\n#{braille_format[:line2].join}\n#{braille_format[:line3].join}"
  end
end