module WhenIWork
  class User < Resource
    def self.all(options = {})
      client.get '2/users', options
    end
  end
end