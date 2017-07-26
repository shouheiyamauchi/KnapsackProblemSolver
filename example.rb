require_relative "./knapsack_problem_solver"

camping_items = [
  {
    item: "Water",
    weight: 3,
    value: 10
  },
  {
    item: "Book",
    weight: 1,
    value: 3
  },
  {
    item: "Food",
    weight: 2,
    value: 9
  },
  {
    item: "Jacket",
    weight: 2,
    value: 5
  },
  {
    item: "Camera",
    weight: 1,
    value: 6
  }
]

shop_items = [
  {
    item: "Stereo",
    weight: 4,
    value: 3000
  },
  {
    item: "Laptop",
    weight: 3,
    value: 2000
  },
  {
    item: "Guitar",
    weight: 1,
    value: 1500
  }
]

camping_bag = KnapsackProblemSolver.new(camping_items)
puts "The most valuable items to take to a camping trip for a 6kg bag are:"
camping_bag.max_value_items(6).each do |item|
  puts item[:item]
end

shop_bag = KnapsackProblemSolver.new(shop_items)
puts "The most valuable items that fits into a 4kg bag from the shop are:"
shop_bag.max_value_items(4).each do |item|
  puts item[:item]
end
