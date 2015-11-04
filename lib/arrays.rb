class Array

  def my_uniq
    uniques = []
    self.select do |el|
       next if uniques.include?(el)
       uniques << el
     end
      uniques
  end


  def two_sum
    sums = []

    self.each_with_index do |num1, i1|
      self.each_with_index do |num2, i2|
        next if i1 == i2 || i1 > i2
        sums << [i1, i2] if num1 + num2 == 0
      end
    end
    sums
  end


end
