# frozen_string_literal: true

require 'test_helper'

class BubbleSortTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::BubbleSort::VERSION
  end

  def test_that_it_sorts_strings_correctly
    assert_equal ::BubbleSort.sort(%w[they understand stuff that are like books]), %w[are books like stuff that they understand]
  end

  def test_that_it_sorts_integers_correctly
    assert_equal ::BubbleSort.sort([10, 2, 1, 4, 100, 3, 2]), [1, 2, 2, 3, 4, 10, 100]
  end
end
