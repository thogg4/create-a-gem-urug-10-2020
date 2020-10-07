require "test_helper"

class BlamerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Blamer::VERSION
  end
end

class ParseFilenameTest < Minitest::Test
  def test_it_returns_expected_filename
    test_path = '/path/for/test'
    identifier = Rails.root + test_path
    filename = Blamer::ParseFilename.new(identifier).work
    assert_equal filename, test_path
  end
end

class Configuration < Minitest::Test
  def test_setting_configuration
    Blamer.configure do |config|
      config.api_key = '123456'
    end

    assert_equal Blamer.configuration.api_key, '123456'
  end
end
