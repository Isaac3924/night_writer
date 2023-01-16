class BrailleToEnglish
  attr_reader :message
  
  def initialize(message)
    @message = message
  end
  
  def translate
    braille_alhpabet = { "z" => ["0.", ".0", "00"],
                          " " => ["..", "..", ".."]
                        }
  
    braille_message = []
    message_slots = []
  
    @message.chars.each do |letter|
      match = braille_alhpabet.keys.find {|key| key == letter}
      if match == nil
        braille_message << letter
      else
        braille_message << braille_alhpabet[match]
      end
    end
  
    braille_format = Hash.new{ |k, v| k[v] = [] }
  
    braille_message.each do |braille_letter|
      braille_format[1] << braille_letter[0]
      braille_format[2] << braille_letter[1]
      braille_format[3] << braille_letter[2]
    end
  
    braille_format_actual = Hash.new{ |k, v| k[v] = [] }
    storage = []
  
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
  
    final_message_array = []
  
    braille_format_actual.each do |line, row_array|
      final_message_array << "#{row_array.join}\n"
    end
  
      inal_message_array.join
  end
end