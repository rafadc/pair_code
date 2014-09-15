class Subtitles

	def initialize(filename)
		@subtitle = File.open(filename)
	end

	def print_subtitles 
		@subtitle.each {|line| print line}
	end

	def file_to_array
		subtitle_string = ""
		
		@subtitle.each do |line|
			subtitle_string << line
		end

		return subtitle_string.split("\r\n\r\n")
	end

	def time_shift(shift_in_ms)
		subtitle_array = file_to_array

		subtitle_array.each do |sub|
			full_time = sub.lines.at(1)

			start_time = shift_in_ms + time_to_ms(full_time[0..11])
			end_time = shift_in_ms + time_to_ms(full_time[17..28])

			full_time[0..11] = format_time(start_time)
			full_time[17..28] = format_time(end_time)
			puts full_time

		end
	end

	def time_to_ms(org_time)
		(org_time[0..1].to_i * 3600000) + (org_time[3..4].to_i * 60000) + (org_time[6..11].delete(",").to_i)
	end

	def format_time(time_ms)
		hour = time_ms / 3600000
		min = (time_ms - hour * 3600000) / 60000
		ms = time_ms - (hour * 3600000) - (min * 60000)
		hour.to_s.rjust(2, padstr="0") + ":" + min.to_s.rjust(2, padstr="0") + ":" + ms.to_s.rjust(5, padstr="0")
	end

end

newSubs = Subtitles.new("sample.txt")

newSubs.time_shift(2500)