require_relative 'night_writer_class'

night_writer = NightWriterClass.from_terminal(ARGV[0])
night_writer.change_text_writer
night_writer.make_file(ARGV[1])
puts night_writer.file_statement