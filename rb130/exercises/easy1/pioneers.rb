# get string
# return string
# 
# for each letter in teh given string, return its rot13 diference
# 
# check if letter is before or after n
# if before
#   add 13 letters
# else
#   subtract 13 letters
# 
# create two arrays - a to m and n to z
# 
# for each letter
#   cap is true if letter is capital
#   if in first array
#     return same index of second
#   elsif in second array
#     return same index of first
#   else
#     retunr character
# 
#   capitalize if cap
 
def decipher(name)
  first13 = ('a'..'m').to_a
  second13 = ('n'..'z').to_a

  new_name = name.each_char.map do |char|
    cap = char.upcase == char ? true : false

    letter = if first13.include?(char.downcase)
               second13[first13.index(char.downcase)]
             elsif second13.include?(char.downcase)
               first13[second13.index(char.downcase)]
             else
               char
             end

    cap ? letter.upcase : letter
  end

  puts new_name.join
end

['Nqn Ybirynpr',
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Nyna Ghevat',
'Puneyrf Onoontr',
'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
'Wbua Ngnanfbss',
'Ybvf Unvog',
'Pynhqr Funaaba',
'Fgrir Wbof',
'Ovyy Tngrf',
'Gvz Orearef-Yrr',
'Fgrir Jbmavnx',
'Xbaenq Mhfr',
'Fve Nagbal Ubner',
'Zneiva Zvafxl',
'Lhxvuveb Zngfhzbgb',
'Unllvz Fybavzfxv',
'Tregehqr Oynapu'].each {|name| decipher(name)}
