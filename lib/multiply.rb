module Cruby
  class Multiply
    def self.ruby(count = DEFAULT_ITERATIONS)
      multiply(method(:ruby_multiply), count)
      count
    end

    def self.c(count = DEFAULT_ITERATIONS)
      multiply(method(:c_multiply), count)
      count
    end

    private

    def self.multiply(callback, count)
      beginning_time = Time.now
      callback.call(count)
      end_time = Time.now
      puts "Time elapsed #{(end_time - beginning_time) * 1000} milliseconds."
    end

    def self.ruby_multiply(count)
      puts '<--- Ruby --->'
      i = 0
      j = 10
      count.times do
        i += 1
        j *= 2
        j = 10
      end
      i
    end

    def self.c_multiply(count)
      puts '<--- C --->'
      puts Cruby::Cperf.multiply(count)
    end
  end
end
