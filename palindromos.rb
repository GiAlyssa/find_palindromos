class StringProcessor

  def initialize
    @string = input
    find_largest_palindrome
  end

  def input
    puts "coloque uma string"
    gets.chomp
  end

  def has_first_and_last_digit?(plen, a, len)
    a-plen >= 0 && a-plen <= (len)
  end

  def is_a_palindrome?(a, plen)
    @string[a-plen] == @string[a+plen]
  end

  def is_the_biggest_palindrome?(plen, max_len)
    plen > max_len
  end

  def print_results(position, max_len)
   puts "O maior palindromo encontrado foi: #{@string[(position-max_len+1)..(position+max_len-1)]}"
  end

  def find_largest_palindrome
    len = @string.length - 1
    max_len = 0
    position = 0

    for a in 0..(len) do
    next if a == 0 && a == (len)
     plen = 1
      while has_first_and_last_digit?(plen, a, len) && is_a_palindrome?(a, plen) do
        plen += 1 #espande o palindromo
      end
      if is_the_biggest_palindrome?(plen, max_len)
        max_len = plen
        position = a
      end
    end
    print_results(position, max_len)
  end
end
StringProcessor.new
