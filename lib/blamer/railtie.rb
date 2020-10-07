module Blamer
  class Railtie < ::Rails::Railtie
    initializer 'blamer.initializer' do |app|
      app.middleware.insert(0, Blamer::Middleware)

      ActiveSupport::Notifications.subscribe('render_template.action_view') do |name, start, finish, id, payload|
        filename = ParseFilename.new(payload[:identifier]).work
        commits = GetGitCommits.new(filename).work
        Thread.current[:blamer] = commits
      end
    end
  end

  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body = @app.call(env)

      commits_array = Thread.current[:blamer]

      return [status, headers, body] unless commits_array

      body.each do |buffer|
        index = buffer.rindex(/<body>/i)
        commits_array.each do |commit|
          buffer.insert(index, (commit + '<br />').html_safe)
        end
      end

      [status, headers, body]
    end
  end
end
