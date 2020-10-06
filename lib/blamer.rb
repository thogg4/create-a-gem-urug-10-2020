module Blamer
  autoload :Configuration, 'blamer/configuration'
  autoload :ParseFilename, 'blamer/parse_filename'
  autoload :GetGitCommits, 'blamer/get_git_commits'
  class Error < StandardError; end

  def self.configure
    yield(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end

raise(Blamer::Error, 'This gem can only be used with Rails') unless defined?(Rails)

require 'blamer/railtie' if defined?(Rails::Railtie)
