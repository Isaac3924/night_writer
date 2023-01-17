class NightParentClass
  
  attr_reader :handle,
              :incoming_text,
              :file_characters,
              :outgoing_text,
              :writer
    
  def initialize(file_name1)
    @handle = File.open(file_name1, "r")
    @incoming_text = @handle.read
    @file_characters = 0
    @outgoing_text = ''
  end

  def make_file(file_name2)
    @writer = File.open(file_name2, "w")
    @writer.write(@outgoing_text)
  end
end