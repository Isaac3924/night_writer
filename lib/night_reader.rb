require_relative 'night_reader_class'

night_reader = NightReaderClass.from_terminal(ARGV[0])
night_reader.change_text_reader
night_reader.make_file(ARGV[1])
puts night_reader.file_statement