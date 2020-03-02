# frozen_string_literal: true

def not_sorted(words)
  words.each_cons(2).all? { |a, b| a > b }
end

def sort(words)
  while not_sorted(words)
    words.length.pred.times do |i|
      next unless words[i] > words[i + 1]

      words[i], words[i + 1] = words[i + 1], words[i]
    end
  end
  words
end

sort %w[a z b aaa cafe awefw]
