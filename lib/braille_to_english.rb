class BrailleToEnglish
  attr_reader :message
  
  def initialize(message)
    @message = message
  end
  
  def translate
    
    braille_alhpabet = { ["0.", "..", ".."] => "a",
                         ["0.", "..", ".."] => "b",
                         ["00", "..", ".."] => "c",
                         ["00", ".0", ".."] => "d",
                         ["0.", ".0", ".."] => "e",
                         ["00", "0.", ".."] => "f",
                         ["00", "00", ".."] => "g",
                         ["0.", "00", ".."] => "h",
                         [".0", "0.", ".."] => "i",
                         [".0", "00", ".."] => "j",
                         ["0.", "..", "0."] => "k",
                         ["0.", "0.", "0."] => "l",
                         ["00", "..", "0."] => "m",
                         ["00", ".0", "0."] => "n",
                         ["0.", ".0", "0."] => "o",
                         ["00", "0.", "0."] => "p",
                         ["00", "00", "0."] => "q",
                         ["0.", "00", "0."] => "r",
                         [".0", "0.", "0."] => "s",
                         [".0", "00", "0."] => "t",
                         ["0.", "..", "00"] => "u",
                         ["0.", "0.", "00"] => "v",
                         [".0", "00", ".0"] => "w",
                         ["00", "..", "00"] => "x",
                         ["00", ".0", "00"] => "y",
                         ["0.", ".0", "00"] => "z",
                         ["..", "..", ".."] => " " 
  }
  
  braille_message = []

  braille_message << braille_alhpabet[@message.split]

  braille_message.join
  
  # @message.split.each do |row_message|
  #   braille_alhpabet.keys.find_all do |row_alphabet|
  #     row_alphabet == row_message
  #   end
  #   match = braille_alhpabet.keys.map { |key| key == row[0] }
  #   if match == nil
  #     braille_message << row
  #   else
  #     braille_message << braille_alhpabet[match]
  #   end
  # end
  
  # braille_format = Hash.new{ |k, v| k[v] = [] }
  
  # braille_message.each do |braille_letter|
  #   braille_format[1] << braille_letter[0]
  #   braille_format[2] << braille_letter[1]
  #   braille_format[3] << braille_letter[2]
  # end


  
  # braille_format_actual = Hash.new{ |k, v| k[v] = [] }
  # storage = []
  
  # braille_format.each do |line, row_array|
  #   i = line
  #   if row_array.count > 40
  #     storage = braille_format[line].pop(row_array.count - 40)
  #     braille_format_actual[i] = row_array
  #     while storage.count > 0
  #       i += 3
  #       braille_format_actual[i] = storage.shift(40)
  #     end
  #   else
  #     braille_format_actual[i] = row_array
  #   end
  # end
  
  # braille_format_actual = braille_format_actual.sort_by{|k| k}.to_h
  #   final_message_array = []
  
  #   braille_format_actual.each do |line, row_array|
  #     final_message_array << "#{row_array.join}\n"
  #   end
  
  #   final_message_array.join
  end
end