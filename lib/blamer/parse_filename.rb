module Blamer
  class ParseFilename
    def initialize(identifier)
      @identifier = identifier
    end

    def work
      filename = @identifier.dup
      filename.slice!(Rails.root.to_s)
      filename
    end
  end
end
