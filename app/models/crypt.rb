class Crypt < ActiveRecord::Base
end


class Caesar
  def initialize(shift, alphabet = ('a'..'z').to_a.join)
    i = shift % alphabet.size
    @decrypt = alphabet
    @encrypt = alphabet[i..-1] + alphabet[0...i]
  end

  def encrypt(string)
    string.downcase.tr(@decrypt, @encrypt)
  end

  def decrypt(string)
    if string == nil
      string = ' '
    end
    string.downcase.tr(@encrypt, @decrypt)
  end
end
