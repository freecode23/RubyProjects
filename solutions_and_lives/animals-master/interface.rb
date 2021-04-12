require_relative 'lion'
require_relative 'meerkat'
require_relative 'warthog'
require_relative 'animal'

simba = Lion.new("simba")
nala = Lion.new("nala")
timon = Meerkat.new("timon")
pumbaa = Warthog.new("pumbaa")

animals = [simba, nala, timon, pumbaa]

animals.each do|animal|
  puts animal.talk
end

p Animal.phyla
p timon.eat("Doug")
p pumbaa.eat("timon")
p nala.eat("simba")
