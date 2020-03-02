# frozen_string_literal: true

def not_sorted(words)
  (words.length - 1).times do |i|
    return true if words[i] > words[i + 1]
  end
  false
end

def sort(words)
  while not_sorted(words)
    (words.length - 1).times do |i|
      next unless words[i] > words[i + 1]

      tmp = words[i]
      words[i] = words[i + 1]
      words[i + 1] = tmp
    end
  end
  words
end

p sort %w[a z b aaa cafe awefw]
