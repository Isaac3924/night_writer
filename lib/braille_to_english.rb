require_relative "./analytics"

class BrailleToEnglish
  include Analytics

  attr_reader :braille_message,
              :braille_alhpabet
  
  def initialize(message)
    @braille_message = message
    @braille_alhpabet = { ["0.", "..", ".."] => "a",
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
  end
  
  def split_braille
    message_order = Hash.new{ |k, v| k[v] = [] }

    
    @braille_message.split.each do |row_message|
      i = 0
      row_message.scan(/../).each do |message_element|
          message_order[i] << message_element
          i += 1
      end
    end

    message_order
  end

  def translate
  
    english_message = []

    message_order = split_braille

    message_order_actual = adv_format(message_order, 3, 40)

    message_order_actual = message_order_actual.sort_by{|k| k}.to_h

    message_order_actual.each do |key, letter_array|
      english_message << @braille_alhpabet[letter_array]
    end

    english_message.join
  end
end