module Analytics
  def adv_format(needs_format, int1, int2)
    storage = []
    formatted = Hash.new{ |k, v| k[v] = [] }

    needs_format.each do |key, value|
      i = key
      if value.count > int1
        storage = needs_format[key].pop(value.count - int1)
        formatted[i] = value
        while storage.count > 0
          i += int2
          formatted[i] = storage.shift(int1)
        end
      else
        formatted[key] = value
      end
    end

    formatted
  end
end