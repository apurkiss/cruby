module Cruby
  class Divide
    def self.ruby(count = DEFAULT_ITERATIONS)
      divide(method(:ruby_divide), count)
      count
    end

    def self.c(count = DEFAULT_ITERATIONS)
      divide(method(:c_divide), count)
      count
    end

    private

    def self.divide(callback, count)
      beginning_time = Time.now
      callback.call(count)
      end_time = Time.now
      puts "Time elapsed #{(end_time - beginning_time) * 1000} milliseconds."
    end

    def self.ruby_divide(count)
      puts '<--- Ruby --->'
      i = 0
      j = 10
      count.times do
        i += 1
        j /= 2
        j = 10
      end
      i
    end

    def self.c_divide(count)
      puts '<--- C --->'
      puts Cruby::Cperf.divide(count)
    end
  end
end
