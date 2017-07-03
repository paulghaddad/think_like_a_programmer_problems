def array_iterative_sum(collection, collection_size)
  sum = 0

  for i in (0...collection_size)
    sum += collection[i]
  end

  sum
end

def array_delegate_sum(collection, collection_size)
  return 0 if collection_size.zero?

  last_number = collection[collection_size - 1]
  all_but_last_sum = array_iterative_sum(collection, collection_size - 1)
  last_number + all_but_last_sum
end

def array_recursive_sum(collection, collection_size)
  return 0 if collection_size.zero?

  last_number = collection[collection_size - 1]
  all_but_last_sum = array_recursive_sum(collection, collection_size - 1)
  last_number + all_but_last_sum
end

