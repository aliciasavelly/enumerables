require "byebug"

class Array
  def my_each(&prc)
    self.length.times do |i|
      prc.call(self[i])
    end
  end

  def my_select(&prc)
    arr = []
    self.my_each do |num|
      arr << num if prc.call(num)
    end
    arr
  end

  def my_reject(&prc)
    arr = []

    self.my_each do |num|
      arr << num unless prc.call(num)
    end

    arr
  end

  def my_any?(&prc)
    self.my_each do |num|
      return true if prc.call(num)
    end

    false
  end

  def my_all?(&prc)
    self.my_each do |num|
      return false unless prc.call(num)
    end

    true
  end

  def my_flatten
    flat_array = []

    self.my_each do |el|
      if el.is_a?(Array)
        flat_array += el.my_flatten
      else
        flat_array << el
      end
    end

    flat_array
  end

  def my_zip(*args)
    new_arr = []
    idx = 0
    self.my_each do |var|
      temp = []
      temp << var
      args.my_each do |arr|
        temp << arr[idx]
      end

      idx +=1
      new_arr << temp
    end

    new_arr
  end

  def my_rotate(rotation = 1)
    # if rotation < 0
    #   negative = true
    #   rotation *= -1
    # else
    #   negative = false
    # end
    #
    # rot_arr = self.dup
    # rotation.times do
    #   if negative
    #     rot_arr.unshift(rot_arr.pop)
    #   else
    #     rot_arr << rot_arr.shift
    #   end
    # end
    # rot_arr
    split_idx = rotation % self.length
    self.drop(split_idx) + self.take(split_idx)
  end

  def my_join(seperator = "")
    str = ""
    idx = 0

    self.my_each do |char|
      str += char
      str += seperator unless idx == self.length() - 1
      idx += 1
    end

    str
  end

  def my_reverse
    # new_arr = []
    # duplicate = self.dup
    # duplicate.my_each do |var|
    #   new_arr << duplicate.pop
    # end
    # new_arr += duplicate
    # new_arr
    reversed_arr = []

    self.my_each do |el|
      reversed_arr.unshift(el)
    end

    reversed_arr
  end

end
