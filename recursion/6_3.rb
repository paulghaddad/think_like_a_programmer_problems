require 'pry'

def count_of_target_iterative(collection:, target:)
  collection.inject(0) do |target_count, element|
    if element == target
      target_count += 1
    else
      target_count
    end
  end
end

def count_of_target_head_recursive(collection:, target:)
  return 0 if collection.empty?

  target_count = count_of_target_head_recursive(collection: collection[1..-1], target: target)

  if collection.first == target
    target_count + 1
  else
    target_count
  end
end

def count_of_target_tail_recursive(collection:, target:)
  return 0 if collection.empty?

  target_count = collection.first == target ? 1 : 0

  return target_count + count_of_target_tail_recursive(collection: collection[1..-1], target: target)
end
