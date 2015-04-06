module WhenIWork
  class Shift < Resource
    def self.all(options = {})
      client.get 'shifts', options
    end
  end
end