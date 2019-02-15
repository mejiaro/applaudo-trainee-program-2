class Array
  def to_histogram
    b = self
    if b.empty?
      puts 'The array is empty'
    else
      puts b.each_with_object(Hash.new(0)) { |word, hash| hash[word] += 1 }
    end
  end
end
