class KnapsackProblemSolver

  attr_accessor :items

  def initialize(items)
    @items = items
  end

  # Return the list of items with maximum value given the capacity
  def max_value_items(max_capacity)
    construct_max_value_table(max_capacity)

    @max_value_items_table.last.last
  end

  # Construct a table with all items as rows[i] and the capacity incrementing by 1 as columns[i]
  def construct_max_value_table(max_capacity)
    @max_value_items_table = []

    items.each_with_index do |item, i|
      @max_value_items_table.push([])
      for current_capacity in 1..max_capacity
        j = current_capacity - 1
        if item[:weight] == current_capacity && item[:value] > (items_value_calc(above_items(i, j)))
          @max_value_items_table[i].push([item])
        elsif item[:weight] < current_capacity
          remainder = j - item[:weight]
          if (items_value_calc([item] + above_items(i, remainder)) > (items_value_calc(above_items(i, j))))
            @max_value_items_table[i].push([item] + above_items(i, remainder))
          else
            @max_value_items_table[i].push(above_items(i, j))
          end
        else
          @max_value_items_table[i].push(above_items(i, j))
        end
      end
    end

    return @max_value_items_table
  end

  # Return an array of the items in the row above in same column
  def above_items(i, j)
    if i == 0
      []
    else
      @max_value_items_table[i - 1][j]
    end
  end

  # Calculate the value of the items
  def items_value_calc(items)
    value = 0

    items.each do |item|
      value += item[:value]
    end

    value
  end

end
