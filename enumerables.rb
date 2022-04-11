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

    

end

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]