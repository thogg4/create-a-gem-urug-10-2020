module Blamer
  class Railtie < ::Rails::Railtie
    initializer 'blamer.initializer' do
      ActiveSupport::Notifications.subscribe('render_template.action_view') do |name, start, finish, id, payload|
        filename = ParseFilename.new(payload[:identifier]).work
        commits = GetGitCommits.new(filename).work
      end
    end
  end
end
