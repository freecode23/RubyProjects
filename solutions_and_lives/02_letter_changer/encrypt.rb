def encrypt(text)
  alphabet = ("A".."Z").to_a
  text.upcase.split("").map do |letter|
    index = alphabet.index(letter)
    index.nil? ? letter : alphabet[index - 3]
  end.join
end


[A,B,C,D,E,F,G,H]
[B,R,O,W,X,F,O,X,J,U,M,P,] iterate through letter

alphabet.index('B') == 1
alphabet.index('R') == 20


alphabet[index - 3]
alphabet[-1] => "Z"
alphabet[20-3] => "P"



