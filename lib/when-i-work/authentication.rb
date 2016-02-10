module WhenIWork
  class Authentication < Resource

    class << self

      def login(username, password, api_key)
        client = client(skip_authentication: true)
        response = client.post '2/login' do |request|
          request.body = { username: username, password: password, key: api_key }
        end    

        if response.success? && response.body['token']
          response.body['token']
        end
      end

    end

  end
end