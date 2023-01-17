require_relative './braille_to_english'

class NightReaderClass
  
  attr_reader :handle,
              :incoming_text,
              :new_file_characters,
              :outgoing_text
    
  def initialize(file_name1)
    @handle = File.open(file_name1, "r")
    @incoming_text = @handle.read
    @new_file_characters = 0
    @outgoing_text = ''
  end
    
  def self.from_terminal(file_name1)
    if File.exists?(file_name1)
      NightReaderClass.new(file_name1)
    else
      puts "The first file is not in the directory. Please input a file that is."
    end
  end
    
  def change_text
    translated_text = BrailleToEnglish.new(@incoming_text)
    @outgoing_text = translated_text.translate
    @new_file_characters = @outgoing_text.length
  end
    
  def make_file(file_name2)
    writer = File.open(file_name2, "w")
    writer.write(@outgoing_text)
  
    puts "Created '#{File.basename(writer)}' containing #{new_file_characters} characters, from '#{File.basename(@handle)}'."
  end
end