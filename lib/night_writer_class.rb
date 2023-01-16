class NightWriterClass
  
    attr_reader :handle,
                :incoming_text,
                :old_file_characters,
                :outgoing_text,
                :writer
    
    def initialize(file_name1, file_name2)
      if File.exists?(file_name1)
        @handle = File.open(file_name1, "r")
        @incoming_text = @handle.read
        @old_file_characters = @incoming_text.length
        change_text
        make_file(file_name2)
      else
        puts "The first file is not in the directory. Please input a file that is."
      end
    end
    
    def self.from_terminal(file_name1, file_name2)
      if File.exists?(file_name1)
        NightWriterClass.new(file_name1, file_name2)
      else
        puts "The first file is not in the directory. Please input a file that is."
      end
    end
    
    def read
      @incoming_text = @handle.read
    end
    
    def print_read
      puts @incoming_text
    end
    
    def change_text
      @outgoing_text = @incoming_text.upcase
    end
    
    def make_file(file_name2)
      @writer = File.open(file_name2, "w")
      @writer.write(@outgoing_text)
  
      puts "Created '#{File.basename(@writer)}' from '#{File.basename(@handle)}' which had #{old_file_characters} characters."
    end
  end