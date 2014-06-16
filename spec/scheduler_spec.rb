require 'scheduler'

describe Scheduler do
  it 'returns an array of activities with the number of consecutive iterations' do
    input = ["archery", "crafts", "archery", "archery", "crafts"]
    output = [['archery', 1],
              ['crafts', 1],
              ['archery', 2],
              ['crafts', 1],]
    scheduler = Scheduler.new(input)
    expect(scheduler.consecutive_elements).to eq output
  end

  it 'validates the schedule meets the camp rules' do
    input = ["archery", "archery", "crafts", "crafts"]
    scheduler = Scheduler.new(input)
    expect(scheduler.valid?).to eq true
  end

  it 'validates the schedule meets the camp rules' do
    input = ["archery", "archery", "crafts"]
    scheduler = Scheduler.new(input)
    expect(scheduler.valid?).to eq true
  end

  it 'validates the schedule does not meet the camp rules' do
    input = ["archery", "crafts"]
    scheduler = Scheduler.new(input)
    expect(scheduler.valid?).to eq false
  end
end