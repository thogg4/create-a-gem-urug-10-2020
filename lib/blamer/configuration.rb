# frozen_string_literal: true

module Blamer
  class Configuration
    attr_accessor :repository_root

    def initialize
      @repository_root = nil
    end
  end
end
