class EnglishToBraille
  attr_reader :message,
              :braille_alhpabet

  def initialize(message)
    @message = message
    @braille_alhpabet = { "a" => ["0.", "..", ".."],
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
                         " " => ["..", "..", ".."],
                         "N/A" => ["XX", "XX", "XX"]
                        }
  end

  def translate

    braille_message = []
    braille_format = Hash.new{ |k, v| k[v] = [] }
    braille_format_actual = Hash.new{ |k, v| k[v] = [] }
    storage = []
    final_message_array = []

    @message.chars.each do |letter|
      match = @braille_alhpabet.keys.find {|key| key == letter}
      if match == nil
        braille_message << @braille_alhpabet["N/A"]
      else
        braille_message << @braille_alhpabet[match]
      end
    end

    braille_message.each do |braille_letter|
      braille_format[1] << braille_letter[0]
      braille_format[2] << braille_letter[1]
      braille_format[3] << braille_letter[2]
    end

    braille_format.each do |line, row_array|
      i = line
      if row_array.count > 40
        storage = braille_format[line].pop(row_array.count - 40)
        braille_format_actual[i] = row_array
        while storage.count > 0
          i += 3
          braille_format_actual[i] = storage.shift(40)
        end
      else
        braille_format_actual[i] = row_array
      end
    end

    braille_format_actual = braille_format_actual.sort_by{|k| k}.to_h

    braille_format_actual.each do |line, row_array|
      final_message_array << "#{row_array.join}\n"
    end

    final_message_array.join
  end
end