require 'json'
require 'faraday'
require 'faraday_middleware'

require_relative 'when-i-work/error'
require_relative 'when-i-work/resource'
require_relative 'when-i-work/authentication'
require_relative 'when-i-work/shift'

module WhenIWork
  class << self
    attr_accessor :username, :password, :api_key, :token

    def api_url
      "https://api.wheniwork.com/"
    end

    def configure(username, password, api_key)
      self.username = username
      self.password = password
      self.api_key = api_key
    end

    def client(options = {})
      unless options[:skip_authentication]
        self.token ||= Authentication.login(username, password, api_key)
      end

      Faraday.new(url: api_url) do |faraday|
        #faraday.response :detailed_logger
        faraday.request :json
        faraday.response :json, :content_type => /\bjson$/
        faraday.adapter Faraday.default_adapter
        faraday.headers = { 'W-Token' => self.token } if self.token
      end
    end

  end

end