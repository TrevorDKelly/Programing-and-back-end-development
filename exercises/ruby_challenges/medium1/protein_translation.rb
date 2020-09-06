class InvalidCodonError < StandardError
end

class Translation
  CODON_CODES = {
    ['AUG'] => 'Methionine',
    ['UUU', 'UUC'] => 'Phenylalanine',
    ['UUA', 'UUG'] => 'Leucine',
    ['UCU', 'UCC', 'UCA', 'UCG'] => 'Serine',
    ['UAU', 'UAC'] => 'Tyrosine',
    ['UGU', 'UGC'] => 'Cysteine',
    ['UGG'] => 'Tryptophan',
    ['UAA', 'UAG', 'UGA'] => 'STOP'
  }

  def self.of_codon(codon)
    CODON_CODES.each do |codes, acid|
      return acid if codes.include?(codon)
    end
    raise InvalidCodonError
  end

  def self.of_rna(strand)
    raise InvalidCodonError if strand.size % 3 != 0

    codons = split_strand(strand)

    acids = codons.map do |codon|
      Translation.of_codon(codon)
    end

    parse_to_stop_codon(acids)
  end

  def self.parse_to_stop_codon(acids)
    if acids.include?('STOP')
      stop_index = acids.index('STOP')
      acids[0...stop_index]
    else
      acids
    end
  end

  def self.split_strand(strand)
    codon = ''
    codons = []
    strand.each_char do |char|
      codon << char
      if codon.size == 3
        codons << codon.dup
        codon = ''
      end
    end

    codons
  end
end

# of rna
#   get strand as string
#   return array of strings
#
#   split string into chunks of 3
#   raise error if not %3==0
#   pass each into the of codon method
#     add to array
#   return array up to but not including the stop if there is one
#
#   split strand
#     initaiaze codon string
#     iterate thru chars
#       add to codon string
#       add string copy to array if it has 3 chars
#         empty string
#     return array
#
# of codon
#   get 3 char string
#   retunr string
#
#   find the 3 char string's codon
#   return codon
#
#   hash codes => codons
#
#   iterate thru hash
#     if codes hash has code then retunr condon
#   raise error
