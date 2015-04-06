require 'simplecov'
require 'pry'
require 'vcr'

module SimpleCov::Configuration
  def clean_filters
    @filters = []
  end
end

def authenticate
  WhenIWork.configure(ENV['WHENIWORK_USERNAME'], ENV['WHENIWORK_PASSWORD'], ENV['WHENIWORK_API_KEY'])
end

SimpleCov.configure do
  clean_filters
  load_adapter 'test_frameworks'
end

ENV["COVERAGE"] && SimpleCov.start do
  add_filter "/.rvm/"
end
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'when-i-work'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|

end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/when-i-work_cassettes'
  config.hook_into :webmock
end