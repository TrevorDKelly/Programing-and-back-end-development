class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(compare_strand)
    distance = 0

    smaller_strand_size = if @strand.size < compare_strand.size
                            @strand.size
                          else
                            compare_strand.size
                          end

    smaller_strand_size.times do |i|
      distance += 1 unless @strand[i] == compare_strand[i]
    end

    distance
  end
end

# have strand
# get new strand
# return int
#   nuber of changes
#
# given two strings, find how many letters differ
#
# if either of the strands is shorter, only count to the available length
#
# case
#   all upper in examples
# bad input test
#   not a string
#   chars other than ACGT
#
# distance = 0
# find size of shorter string
# iterate short size -1 times
#   compare index of strings
#   add 1 to distance if not the same
#
# return distance
