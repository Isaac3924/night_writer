require_relative './night_parent_class'
require_relative './braille_to_english'

class NightReaderClass < NightParentClass 
  def self.from_terminal(file_name1)
    if File.exists?(file_name1)
      NightReaderClass.new(file_name1)
    else
      puts "The first file is not in the directory. Please input a file that is."
    end
  end
    
  def change_text_reader
    translated_text = BrailleToEnglish.new(@incoming_text)
    @outgoing_text = translated_text.translate
    @file_characters = @outgoing_text.length
  end

  def file_statement
    "Created '#{File.basename(@writer)}' containing #{file_characters} characters, from '#{File.basename(@handle)}'."
  end
end