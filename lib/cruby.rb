require 'extension'
require 'cruby/version'
require 'base'
require 'c'
require 'ruby'

module Cruby
  DEFAULT_RUBY_ITERATIONS = 100_000_000
  DEFAULT_C_ITERATIONS = 1_000_000_000

  def self.c
    Cruby::C.new
  end

  def self.ruby
    Cruby::Ruby.new
  end
end
