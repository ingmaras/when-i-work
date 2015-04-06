module WhenIWork
  class Authentication < Resource

    class << self

      def login(username, password, api_key)
        response = client.post 'login' do |request|
          request.body = { username: username, password: password, key: api_key }
        end    

        if response.success? && response.body['token']
          response.body['token']
        else
          raise Error::AuthenticationFailedError
        end
      end

    end

  end
end