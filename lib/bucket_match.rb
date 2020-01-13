require 'set'
require 'text'

module BucketMatch

  # Matches words between two arrays, returning a hash of each word mapped to the chosen item in the other
  # Extra entries from both arrays will not be included
  # Uses exact match and then White Similarity.
  # TODO: Replace the hash with a subclass of hash and add get_extra_array1 and get_extra_array2 functions
  def self.match(array1, array2)

    # Copy the arrays to sets as a) we'll be removing entries, and b) sets will have quicker lookup
    set1 = array1.to_set
    set2 = array2.to_set

    # Find the exact matches
    merged = {}
    set1.each do |element|
      if(set2.include?(element)) 
        merged[element] = element
      end
    end
    merged.keys.each do |element|
      set1.delete(element)
      set2.delete(element)
    end

    # If done, return the hash
    if(set1.empty? or set2.empty?)
      return merged
    end

    # Try to match strings based on the White Similarity algorithm
    white = Text::WhiteSimilarity.new
    found = {}
    set1.each do |element1|
      best_distance = 0
      found_element2 = nil
      set2.each do |element2|
        distance = white.similarity(element1, element2)
        puts "Distance found of #{distance} for #{element1} and #{element2}"
        if(distance > best_distance)
          best_distance = distance
          found_element2 = element2
        end
      end
      if(found_element2)
        # TODO: This is too aggressive; it means that one value will match to the best it can, even if another has a better match to that one
        found[element1] = found_element2
        set2.delete(found_element2)
      end
    end
    found.each do |key, value|
      set1.delete(key)
    end
    merged.merge!(found)

    return merged
  end


end
