class Scheduler
  attr_reader :consecutive_elements

  def initialize(activities)
    counter = -1
    @consecutive_elements = activities.each_with_object([]) do |activity, elements|
      if elements[counter] && elements[counter][0] == activity
        elements[counter][1] += 1
      else
        elements << [activity, 1]
        counter += 1
      end
    end
  end

  def valid?
    validity = true
    index = 1
    consecutive_elements.each do |element|
      if element[1] == 1 && index != consecutive_elements.length
        validity = false
      end
      index += 1
    end
    validity
  end
end