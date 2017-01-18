class Array
	# Divides an array into two parts.
	# If the number of elements is an odd number, 
	# the first array will have the extra element,
	# otherwise, they are equal in size.
	def halve
		return [self, []] if self.size == 1
		return [[], []] if self.empty?
		half = (self.size / 2.0).ceil
		[self[0...half], self[half..-1]]
	end
end


def merge_sort(arr)
	return arr if arr.size == 1
	a, b = arr.halve
	c = []

	a_ = merge_sort(a)
	b_ = merge_sort(b)
	
	loop do
		if a_.empty? 
			c += b_
			break
		elsif b_.empty? 
			c += a_ 
			break
		end
				
		case a_[0] <=> b_[0]
		when 1
			c << b_.shift
		when 0
			c << a_.shift
			c << b_.shift
		when -1
			c << a_.shift
		end
	end
	c
end

p merge_sort %w(54 32 98 2 78 15 26 4 4 55 1 5 878).map { |x| x.to_i }