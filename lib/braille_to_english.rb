class BrailleToEnglish
  attr_reader :braille_message
  
  def initialize(message)
    @braille_message = message
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
  
  english_message = []
  message_order = Hash.new{ |k, v| k[v] = [] }

  @braille_message.split.each do |row_message|
    i = 0
    row_message.scan(/../).each do |message_element|
        message_order[i] << message_element
        i += 1
    end
  end

  message_order_actual = Hash.new{ |k, v| k[v] = [] }
  storage = []

  message_order.each do |key, array|
    i = key
    if array.count > 3
      storage = message_order[key].pop(array.count - 3)
      message_order_actual[i] = array
      while storage.count > 0
        i += 40
        message_order_actual[i] = storage.shift(3)
      end
    else
      message_order_actual[key] = array 
    end
  end

  message_order_actual = message_order_actual.sort_by{|k| k}.to_h

  message_order_actual.each do |key, letter_array|
    english_message << braille_alhpabet[letter_array]
  end

  english_message.join
  end
end