def upcase?(char)
  char == char.upcase
end

def ord_values(char)
  range = upcase?(char) ? ('A'..'Z') : ('a'..'z')
  range.map(&:ord)
end

def operator(index, range)
  index <= (range.size / 2) - 1 ? '+' : '-'
end

def rot_character(char)
  range = ord_values(char)
  index = range.index(char.ord)
  op = operator(index, range)

  range[[index, range.size / 2].inject(op)].chr
end

def rot_13(text)
  text.split.map do |text|
    text.chars.map do |char|
      next char if char =~ /[^a-zA-Z]/

      rot_character(char)
    end.join
  end.join(' ')
end

p rot_13('Nqn Ybirynpr')
p rot_13('Tenpr Ubccre')
p rot_13('Nqryr Tbyqfgvar')
p rot_13('Nyna Ghevat')
p rot_13('Puneyrf Onoontr')
p rot_13('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p rot_13('Wbua Ngnanfbss')
p rot_13('Ybvf Unvog')
p rot_13('Pynhqr Funaaba')
p rot_13('Fgrir Wbof')
p rot_13('Ovyy Tngrf')
p rot_13('Gvz Orearef-Yrr')
p rot_13('Fgrir Jbmavnx')
p rot_13('Xbaenq Mhfr')
p rot_13('Fve Nagbal Ubner')
p rot_13('Zneiva Zvafxl')
p rot_13('Lhxvuveb Zngfhzbgb')
p rot_13('Unllvz Fybavzfxv')
p rot_13('Tregehqr Oynapu')
