module Cruby
  class Ruby < Base
    def all(count = DEFAULT_RUBY_ITERATIONS)
      add(count)
      multiply(count)
      divide(count)
    end

    def add(count = DEFAULT_RUBY_ITERATIONS)
      start(__method__, count)
      ruby_add(count)
      time
    end

    def multiply(count = DEFAULT_RUBY_ITERATIONS)
      start(__method__, count)
      ruby_multiply(count)
      time
    end

    def divide(count = DEFAULT_RUBY_ITERATIONS)
      start(__method__, count)
      ruby_divide(count)
      time
    end

    private

    def ruby_add(count)
      i = 0
      count.times do
        i += 1
      end
    end

    def ruby_multiply(count)
      j = 1
      count.times do
        j = count * 1
      end
    end

    def ruby_divide(count)
      j = count
      count.times do
        j /= 2
      end
    end
  end
end
