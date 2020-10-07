require 'pry'

class Rails
  class << self
    def root
      "/test/root"
    end
  end
end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "blamer"

require "minitest/autorun"
