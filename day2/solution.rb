$count = 0

def sign(val)
  '±+-'[val <=> 0]
end

def isSafe?(report)
  dir = sign(report[1] - report[0])
  return false if dir == '±'
  report.each_with_index do |_x, idx|
    next if idx < 1
    diff = report[idx] - report[idx - 1]
    return false if sign(diff) != dir or diff.abs > 3
  end
  true
end

def part1
  File.foreach('input1.txt') do |line|
    report = line.split.map(&:to_i)
    $count += 1 if isSafe?(report)
  end
end

def part2
  File.foreach('input1.txt') do |line|
    report = line.split.map(&:to_i)
    $count += 1 if report.count.times.map { |n| isSafe?(report.reject.with_index { |_el, idx| idx == n }) }.any?
  end
end

part2

puts $count
