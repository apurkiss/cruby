module Cruby
  class Add
    def self.ruby(count = DEFAULT_ITERATIONS)
      add(method(:ruby_add), count)
      count
    end

    def self.c(count = DEFAULT_ITERATIONS)
      add(method(:c_add), count)
      count
    end

    private

    def self.add(callback, count)
      beginning_time = Time.now
      callback.call(count)
      end_time = Time.now
      puts "Time elapsed #{(end_time - beginning_time) * 1000} milliseconds."
    end

    def self.ruby_add(count)
      puts '<--- Ruby --->'
      i = 0
      count.times do
        i += 1
      end
      i
    end

    def self.c_add(count)
      puts '<--- C --->'
      puts Cruby::Cperf.add(count)
    end
  end
end
