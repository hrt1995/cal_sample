require 'benchmark'

a = 3 #基数
b = 100001 #指数
y = nil

# 普通にべき乗計算した場合

result = Benchmark.realtime do
  y = a ** b
end
puts y
puts "処理時間：#{result}s"

# 高速なべき乗計算を実現する場合

result = Benchmark.realtime do
  def cal
    if b.even?
      b = b/2
      y = pow(a*a, b)
    elsif b.odd?
      y = a*pow(a, b-1)
    end
  end
end
puts y
puts "処理時間：#{result}s"
