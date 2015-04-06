module WhenIWork
  class Shift < Resource
    def self.all(options = {})
      client.get('shifts', options).body
    end
  end
end