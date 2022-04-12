class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        new_arr = []
        self.my_each{|ele| new_arr << ele if prc.call(ele)}
        new_arr
    end

    def my_reject(&prc)
        new_array=[]
        self.my_each{|ele|new_array << ele if !proc.call(ele)}
        return new_array
    end

    def my_any?(&prc)
        self.my_each{|ele| return true if proc.call(ele)}
        return false
    end

    def my_all?(&prc)
        self.my_each {|ele| return false if !proc.call(ele)}
        true
    end

    def my_flatten    #[1, [1,2]]
        single = []

        i = 0
        while i < self.length
            if self[i].is_a?(Array)
                single += self[i].my_flatten
            else
                single << self[i]
            end
            i += 1
        end
        # prc = Proc.new { |subarray|
        #     if subarray.is_a?(Array)
        #         single += subarray.my_flatten
        #     else
        #         single << subarray
        #     end
        # }

        # self.my_each{prc}
        single
    end

    # def my_zip(*args) #doesn't work
    #     new_arr = Array.new(self.length){Array.new(self.length, nil)}
    #     args = args.unshift(self)
    #     args.each_with_index do |arg, i|
    #         arg.each_with_index do |ele, idx|
    #             if i < self.length || idx < self.length
    #                 new_arr[idx][i] = ele
    #             end
    #         end
    #     end
    #     new_arr
    # end

    # def my_rotate(num=1) #doesn't work
    #     clone_self = self[0..-1]

    #     n = 0
    #     while n < num.abs
    #         i = 0
    #         while i < self.length
    #             clone_self[i-1] = self[i]
    #             i += 1
    #         end
    #         n += 1
    #     end
    #     clone_self
    # end

    def my_join(seperator="")
        new_str = ""
        i = 0
        while i < self.length
            if i == self.length - 1
                new_str += self[i]
            else
                new_str += (self[i] + seperator)
            end
            i += 1
        end
        new_str
    end

    def my_reverse
        reversed = []
        i = self.length-1
        while i > -1
            reversed << self[i]
            i -= 1
        end
        reversed
    end
    
end

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]