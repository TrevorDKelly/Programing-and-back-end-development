require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'pioneers'

class DecipherTest < Minitest::Test
  def test_decipher
    assert_output("Ada Lovelace\n") { decipher('Nqn Ybirynpr') }
    assert_output("Grace Hopper\n") { decipher('Tenpr Ubccre') }
    assert_output("Adele Goldstine\n") { decipher('Nqryr Tbyqfgvar') }
    assert_output("Alan Turing\n") { decipher('Nyna Ghevat') }
    assert_output("Charles Babbage\n") { decipher('Puneyrf Onoontr') }
    assert_output("Abdullah Muhammad bin Musa al-Khwarizmi\n") { decipher('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv') }
    assert_output("John Atanasoff\n") { decipher('Wbua Ngnanfbss') }
    assert_output("Lois Haibt\n") { decipher('Ybvf Unvog') }
    assert_output("Claude Shannon\n") { decipher('Pynhqr Funaaba') }
    assert_output("Steve Jobs\n") { decipher('Fgrir Wbof') }
    assert_output("Bill Gates\n") { decipher('Ovyy Tngrf') }
    assert_output("Tim Berners-Lee\n") { decipher('Gvz Orearef-Yrr') }
    assert_output("Steve Wozniak\n") { decipher('Fgrir Jbmavnx') }
    assert_output("Konrad Zuse\n") { decipher('Xbaenq Mhfr') }
    assert_output("Sir Antony Hoare\n") { decipher('Fve Nagbal Ubner') }
    assert_output("Marvin Minsky\n") { decipher('Zneiva Zvafxl') }
    assert_output("Yukihiro Matsumoto\n") { decipher('Lhxvuveb Zngfhzbgb') }
    assert_output("Hayyim Slonimski\n") { decipher('Unllvz Fybavzfxv') }
    assert_output("Gertrude Blanch\n") { decipher('Tregehqr Oynapu') }
  end
end

