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
end

a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []

a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]

a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true