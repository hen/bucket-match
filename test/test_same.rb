require 'minitest/autorun'
require 'bucket_match'

class SameTest < Minitest::Test
  def test_same_0
    assert_equal Hash.new, BucketMatch::match([], [])
  end
  def test_same_1
    the_word = 'The Word'
    expected = {the_word => the_word}
    array = [the_word]
    assert_equal expected, BucketMatch::match(array, array)
  end
  def test_same_2
    the_word1 = 'The Word 1'
    the_word2 = 'The Word 2'
    expected = {the_word1 => the_word1, the_word2 => the_word2}
    array1 = [the_word1, the_word2]
    array2 = [the_word2, the_word1]
    assert_equal expected, BucketMatch::match(array1, array2)
  end
end
