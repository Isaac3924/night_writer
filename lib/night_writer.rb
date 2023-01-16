handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

changed_text = incoming_text.upcase

writer = File.open(ARGV[1], "w")

writer.write(changed_text)

writer.close

old_file_name = 'message.txt'
new_file_name = 'changed_message.txt'
old_file_characters = incoming_text.length

puts "Created '#{new_file_name}' from '#{old_file_name}' which had #{old_file_characters} characters."
# class NightWriter
#   attr_reader :handle,
#               :incoming_text,
#               :out_going_text,
#               :writer

#   def initialize
#     @handle = File.open(ARGV[0], "r")
#     @incoming_text = @handle.read
#     puts @incoming_text
#     @out_going_text = ''
#   end

#   def self.from_terminal(file_name)
#     night_writer.new(file_name)
#   end

#   def read
#     @incoming_text = @handle.read
#   end

#   def print_read
#     puts @incoming_text
#   end

#   def change_text
#     @out_going_text = @incoming_text.upcase
#   end

#   def make_file
#     writer = File.open(ARGV[1], "w")
#     writer.write(capitalized_text)
#   end
# end