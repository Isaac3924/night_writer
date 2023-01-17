require_relative './night_parent_class'
require_relative './english_to_braille'

class NightWriterClass < NightParentClass
  def self.from_terminal(file_name1)
    if File.exists?(file_name1)
      NightWriterClass.new(file_name1)
    else
      puts "The first file is not in the directory. Please input a file that is."
    end
  end
    
  def change_text_writer
    translated_text = EnglishToBraille.new(@incoming_text)
    @outgoing_text = translated_text.translate
    @file_characters = @incoming_text.length
  end

  def file_statement
    "Created '#{File.basename(@writer)}' from '#{File.basename(@handle)}' which had #{file_characters} characters."
  end
end