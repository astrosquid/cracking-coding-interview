def mergesort(list)
  if list.length == 1
    return list
  end

  sorted = []
  first = []
  second = []
  if list.length > 1
    first = mergesort(list.slice(0, list.length / 2))
    second = mergesort(list.slice(list.length / 2, list.length / 2))
  end

  while first.length != 0 && second.length != 0 do 
    if first[0] < second[0]
      sorted.push(first.shift())
    else
      sorted.push(second.shift())
    end
  end

  if first.length == 0
    sorted = [*sorted, *second]
  else 
    sorted = [*sorted, *first]
  end

  return sorted
end

def main
  unsorted = [22, 3, 6, 91, 1, 10, 29, 300]
  print unsorted.to_s + "\n"
  sorted = mergesort(unsorted)
  print sorted
end

main
