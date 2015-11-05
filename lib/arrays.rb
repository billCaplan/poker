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

def my_transpose(matrix)
  matrix.shift.zip(*matrix[0..-1])
end

def stock_picker(prices)
  best_profit = 0
  current_profit = 0
  days = []
  prices.each_with_index do |day1, i|
    prices.each_with_index do |day2, i2|
      next if i2 < i
      if day2 > day1
        current_profit = day2-day1
        if current_profit > best_profit
          best_profit = current_profit
          days = [i, i2]
        end
      end
    end
  end
  days
end
