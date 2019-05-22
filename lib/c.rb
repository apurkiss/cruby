module Cruby
  class C < Base
    attr_accessor :optimized

    def initialize
      @optimized = false
    end

    def all(count = DEFAULT_C_ITERATIONS)
      add(count)
      multiply(count)
      divide(count)
    end

    def add(count = DEFAULT_C_ITERATIONS)
      start(count)
      c_add(count)
      time
    end

    def multiply(count = DEFAULT_C_ITERATIONS)
      start(count)
      c_multiply(count)
      time
    end

    def divide(count = DEFAULT_C_ITERATIONS)
      start(count)
      c_divide(count)
      time
    end

    def optimize
      @optimized = true
    end

    def deoptimize
      @optimized = false
    end

    def optimized?
      optimized
    end

    private

    def c_add(count)
      if optimized?
        Cruby::Cperf.add_optimized(count)
      else
        Cruby::Cperf.add(count)
      end
    end

    def c_multiply(count)
      if optimized?
        Cruby::Cperf.multiply_optimized(count)
      else
        Cruby::Cperf.multiply(count)
      end

    end

    def c_divide(count)
      if optimized?
        Cruby::Cperf.divide_optimized(count)
      else
        Cruby::Cperf.divide(count)
      end
    end
  end
end
