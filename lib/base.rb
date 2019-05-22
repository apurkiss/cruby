module Cruby
  class Base
    def start(count)
      puts "Iterations:   #{count.round.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"
      @start_time = Time.now
    end

    def time
      puts "Milliseconds: #{((Time.now - @start_time) * 1000)}"
    end
  end
end
