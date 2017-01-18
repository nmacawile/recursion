# Returns the first n (n > 0) members of the fibonacci sequence

# Non-recursive solution
def fibs n
	seq = []
	n.times { |i| i == 0 || i == 1 ? seq << i : seq << seq[i - 1] + seq[i - 2] }
	seq
end

# two-liner recursive solution. However, it produces an extra element in the sequence.
# If you set n to 2, you will get 3 elements.
#def fibs_rec_with_extra n, arr = []
#	n == 0 || n == 1 ? arr[n] = n :	arr[n] = fibs_rec_with_extra(n - 1, arr)[n - 1] + fibs_rec_with_extra(n - 2, arr)[n - 2]	
#	arr
#end

# Recursive solution
def fibs_rec(n, arr = [])	
	if arr[n - 1].nil? && n > 0	# eliminates redundant assignment if the array index already has value
		if n >= 3
			arr << fibs_rec(n - 1, arr)[n - 2] + fibs_rec(n - 2, arr)[n - 3]
		elsif n == 2
			arr << 0
			arr << 1
		elsif n == 1
			arr << 0
		end
	end	
	arr
end

puts "Fibonacci sequence:"
print "n = "
if ARGV.empty?	
	p fibs_rec(gets.to_i)
else
	puts ARGV[0].to_i
	p fibs_rec(ARGV[0].to_i)
end