def not_sorted(words)
	(words.length-1).times do |i|
		return true if words[i] > words[i+1]
	end
	return false
end

def sort words
	while not_sorted(words)
		(words.length-1).times do |i|
			if words[i] > words[i+1]
				tmp = words[i]
				words[i] = words[i+1]
				words[i+1] = tmp
			end
		end
	end
	return words
end

def sort_c words
	while not_sorted(words){
		(words.length-1).times { |i|
			if (words[i] > words[i+1]){
				tmp = words[i];
				words[i] = words[i+1];
				words[i+1] = tmp;
			}
		}
	}
	return words;
end

p sort_c ["a", "z", "b", 'aaa', 'cafe', 'awefw']