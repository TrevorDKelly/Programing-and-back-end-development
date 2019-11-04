# create YAML file of sentences and parts of speach
#   sentences
#     ordered by numbers
#     parts of speach capitalized
#   parts of speach
#     key is part of speach
#     value is list of them
#
# import yaml
#
# get parts of speach
#   save each type as array
#
# get sentence
#   pull in random sentence
#   replace parts
#     split sentence
#       if is part of speach
#         replace with random one
#     join together
#
# output sentence

require 'yaml'
MADLIBS_FILE = YAML.load_file('madlibs.yaml')

def fill_word(word)
  case word
  when 'NOUN'      then MADLIBS_FILE['parts_of_speach']['noun'].sample
  when 'VERB'      then MADLIBS_FILE['parts_of_speach']['verb'].sample
  when 'ADVERB'    then MADLIBS_FILE['parts_of_speach']['adverb'].sample
  when 'ADJECTIVE' then MADLIBS_FILE['parts_of_speach']['adjective'].sample
  else                  word
  end
end

def madlib
  sentence = MADLIBS_FILE['sentences'].sample
  puts sentence.split(/\b/).map { |word| fill_word(word) }.join
end

madlib
madlib
madlib
