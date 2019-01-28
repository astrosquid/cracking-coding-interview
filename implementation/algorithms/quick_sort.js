function quicksort(array)
{
  if (!array.length) return []

  const left = []
  const right = []
  const pivot = array[0]

  for (let i = 1; i < array.length; i++) 
  {
    if (array[i] > pivot) {
      right.push(array[i])
    } else {
      left.push(array[i])
    }
  }

  return quicksort(left).concat(pivot, quicksort(right))
}

/*
Step 1 − Choose the highest index value has pivot
Step 2 − Take two variables to point left and right of the list excluding pivot
Step 3 − left points to the low index
Step 4 − right points to the high
Step 5 − while value at left is less than pivot move right
Step 6 − while value at right is greater than pivot move left
Step 7 − if both step 5 and step 6 does not match swap left and right
Step 8 − if left ≥ right, the point where they met is new pivot
*/

function quicksortNoRecursion(array) {
	let pivot = array[array.length - 1]
  let left = 0
  let right = array.length - 2

  while (left <= array.length - 1 && right >= 0) {
    if (array[left] >= pivot && array[right] <= pivot) {
      const temp = array[left]
      array[left] = array[right]
      array[right] = temp
    }

    if (array[left] < pivot) {
      left += 1
    }

    if (array[right] > pivot) {
      right -= 1
    }


  }
}

//const unsorted = [2, 1, 4, 10, 88, 1, 52, 12]
const unsorted = [1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1]
console.log(unsorted)
const sorted = quicksort(unsorted)
console.log(sorted)

