module Blamer
  class GetGitCommits
    def initialize(filename)
      @filename = filename
    end

    def work
      # Blamer.configuration.repository_root
      command = "git log --pretty=format:'%an - %cd - %H' -- #{Rails.root.to_s + @filename}"
      raw_commits = `#{command}`
      return nil unless raw_commits.present?

      parse_raw_commits(raw_commits)
    end

    def parse_raw_commits(raw_commits)
      raw_commits.split("\n")
    end
  end
end
