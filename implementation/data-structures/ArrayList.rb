class ArrayList
  attr_reader :array, :end

  def initialize(size: 10)
    @end = -1
    @array = Array.new(size)
  end

  def isEmpty
    if @end == -1
      return true
    else 
      return false
    end
  end

  def isFull
    if @end == @array.length - 1
      return true
    else 
      return false
    end
  end

  def print_oob
    puts "ERROR: arraylist: index out of bounds"
  end

  def expand
    double = Array.new(@array.length * 2)
    @array.each_with_index do |element, index|
      double[index] = @array[index]
    end
    @array = double
  end

  def push(element)
    if self.isFull
      self.expand
    end
    @end += 1 
    @array[@end] = element
  end

  def pop
    if self.isEmpty
      puts "ERROR: pop from empty arraylist"
    else
      element = @array[@end]
      @array[@end] = nil
      @end -= 1
      return element
    end
  end

  def shuffle_down 
    array = Array.new(@array.length)
    @array.each_with_index do |element, index|
      if index != 0
        array[index - 1] = element
      end
    end
    @array = array
  end

  def shuffle_up
    array = Array.new(@array.length)
    @array.each_with_index do |element, index|
      array[index + 1] = element
    end
    @array = array
  end

  def shift
    if self.isEmpty
      puts "ERROR: shift from empty arraylist"
    else 
      element = @array[@end]
      self.shuffle_down
      @end -= 1
      return element
    end
  end

  def unshift(element)
    if self.isFull
      self.expand
    end
    self.shuffle_up
    @end += 1
    @array[0] = element
  end

  def get(index)
    if index < 0 || index > @end
      self.print_oob
    else 
      return @array[@end]
    end
  end

  def put(index, element)
    if index < 0 || index > @end
      self.print_oob
    else
      @array[@end] = element
    end
  end

end

def print_info(a)
  puts ''
  puts "+--"
  puts "Size is: " + a.array.length.to_s
  puts "End is: " + a.end.to_s
  puts "Empty? " + a.isEmpty.to_s
  puts "Full? " + a.isFull.to_s
  puts "+--"
  puts ''
end

def main
  puts "Initializing..."
  a = ArrayList.new(size: 2)
  print_info(a)

  puts "Pushing a and b"
  a.push('a')
  a.push('b')
  print_info(a)
  puts "Pushing c"
  a.push('c')
  print_info(a)

  puts "Popping c: #{a.pop}"

  print_info(a)

  puts "Unshifting d..."

  a.unshift('d')
  print a.array
  print_info(a)

  puts "Shifting d..."
  a.shift
  print a.array
  print_info(a)

end

main
