module WhenIWork
  class Shift < Resource
    def self.all(options = {})
      client.get('2/shifts', options).body
    end
  end
end