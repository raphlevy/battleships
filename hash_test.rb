ships =  { 'Boat' => [[1,1], [1,2], [1,3]], 'Dingy' => [[3,3], [3,4], [3,5]] }

2.1.5 :017 > ships.values.join
 => "111213333435"
2.1.5 :018 > ships
 => {"Boat"=>[[1, 1], [1, 2], [1, 3]], "Dingy"=>[[3, 3], [3, 4], [3, 5]]}
2.1.5 :019 > v = ships.values
 => [[[1, 1], [1, 2], [1, 3]], [[3, 3], [3, 4], [3, 5]]]
2.1.5 :020 > k = ships.keys
 => ["Boat", "Dingy"]
2.1.5 :021 > ships.(1,3)
NoMethodError: undefined method `call' for #<Hash:0x007fcc5290fe40>
  from (irb):21
  from /richardgeoghegan.rvm/rubies/ruby-2.1.5/bin/irb:11:in `<main>'
2.1.5 :022 > ships.has_values?(1,3)
NoMethodError: undefined method `has_values?' for #<Hash:0x007fcc5290fe40>
  from (irb):22
  from /richardgeoghegan.rvm/rubies/ruby-2.1.5/bin/irb:11:in `<main>'
2.1.5 :023 > ships.has_values?([1,3])
NoMethodError: undefined method `has_values?' for #<Hash:0x007fcc5290fe40>
  from (irb):23
  from /richardgeoghegan.rvm/rubies/ruby-2.1.5/bin/irb:11:in `<main>'
2.1.5 :024 > ships.has_value?([1,3])
 => false
2.1.5 :025 > ships.has_value?(1,3)
ArgumentError: wrong number of arguments (2 for 1)
  from (irb):25:in `has_value?'
  from (irb):25
  from /richardgeoghegan.rvm/rubies/ruby-2.1.5/bin/irb:11:in `<main>'
2.1.5 :026 > ships.has_value?[1,3]
ArgumentError: wrong number of arguments (0 for 1)
  from (irb):26:in `has_value?'
  from (irb):26
  from /richardgeoghegan.rvm/rubies/ruby-2.1.5/bin/irb:11:in `<main>'
2.1.5 :027 > ships.has_value?([1,3])
 => false
2.1.5 :028 > v .has_value?([1,3])
NoMethodError: undefined method `has_value?' for [[[1, 1], [1, 2], [1, 3]], [[3, 3], [3, 4], [3, 5]]]:Array
  from (irb):28
  from /richardgeoghegan.rvm/rubies/ruby-2.1.5/bin/irb:11:in `<main>'
2.1.5 :029 > v.has_value?([1,3])
NoMethodError: undefined method `has_value?' for [[[1, 1], [1, 2], [1, 3]], [[3, 3], [3, 4], [3, 5]]]:Array
  from (irb):29
  from /richardgeoghegan.rvm/rubies/ruby-2.1.5/bin/irb:11:in `<main>'
2.1.5 :030 > v.has_value?([1, 3])
NoMethodError: undefined method `has_value?' for [[[1, 1], [1, 2], [1, 3]], [[3, 3], [3, 4], [3, 5]]]:Array
  from (irb):30
  from /richardgeoghegan.rvm/rubies/ruby-2.1.5/bin/irb:11:in `<main>'
2.1.5 :031 > ships.has_value?([1, 3])
 => false
2.1.5 :032 > s = v[0] | v[1]
 => [[1, 1], [1, 2], [1, 3], [3, 3], [3, 4], [3, 5]]
2.1.5 :033 >