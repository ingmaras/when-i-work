module WhenIWork
  class User < Resource
    def self.all(options = {})
      client.get 'users', options
    end
  end
end