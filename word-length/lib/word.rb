class Word
  def longest(phrase)
    palavras = phrase.split().sort()
    maior = ''
    for palavra in palavras do
      if palavra.length() > maior.length()
        maior = palavra       
      end
    end 
  return maior
  end

  def shortest(phrase)
    palavras = phrase.split().sort()
    menor = palavras[0]
    for palavra in palavras do
      if (palavra.length() < menor.length() && palavra.length() != 1) || (palavra.length == menor.length && palavra.downcase() < menor.downcase())
        menor = palavra        
      end
    end 
  return menor   
  end
end
