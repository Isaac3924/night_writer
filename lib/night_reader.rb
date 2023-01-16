require_relative 'night_reader_class'

night_reader = NightReaderClass.from_terminal(ARGV[0])
night_reader.change_text
night_reader.make_file(ARGV[1])