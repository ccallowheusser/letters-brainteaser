# Simplified version, fewer lines of code
def getstr()

	repeat = 1
	repeatlrgst = 1
	prevletter = ''
	wrds = []
	word = ''

	puts "Input any phrase to find the word with most repeated letters, or type quit:"
	str = gets.strip.downcase
	str == 'quit' ? (exit 0) : repeatedLetters(str, repeat, repeatlrgst, prevletter, wrds, word)
end

def repeatedLetters(str, repeat, repeatlrgst, prevletter, wrds, word)
	puts "words #{wrds}"
	puts "string #{str}"
	puts "repeat #{repeat}"
	puts "repeatlrgst #{repeatlrgst}"
	puts "prevletter #{prevletter}"
	puts ""
	if str.empty?
		if wrds.length == 0
			puts 'No word had repeated letters.'
		elsif wrds.length == 1
			puts "Highest repeated letters is in the word: #{wrds} "
		else
			puts "Multiples found: "
			for i in 1..wrds.length
	   		puts "#{wrds[i-1]}"
	   	end
		end
	elsif str[0] == ' '
		if repeat > repeatlrgst
			wrds = []
			wrds = wrds.push(word)
			repeatlrgst = repeat
		elsif repeat > 1 && repeat = repeatlrgst
			wrds = wrds.push(word)
		end
		word = ''
		prevletter = ''
		repeatedLetters(str[1..(str.length)], 1, repeatlrgst, '', wrds, word)
	else
		word = word+str[0]
		if str[0] == prevletter
			repeat = repeat + 1
			repeatedLetters(str[1..(str.length)], 1, repeatlrgst, '', wrds, word)
		else
			prevletter = str[0]
			repeatedLetters(str[1..(str.length)], 1, repeatlrgst, prevletter, wrds, word)
		end
	end
end

getstr()
