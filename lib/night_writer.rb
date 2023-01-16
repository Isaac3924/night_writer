require_relative 'night_writer_class'

night_writer = NightWriterClass.from_terminal(ARGV[0])
night_writer.change_text
night_writer.make_file(ARGV[1])