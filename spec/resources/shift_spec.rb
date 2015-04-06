require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WhenIWork::Shift do
  before { authenticate }
  describe "GET shifts" do
    it "gets shifts" do
      VCR.use_cassette("shifts", match_requests_on: [:headers]) do
        response = WhenIWork::Shift.all
        expect(response).to include('start', 'end', 'shifts')
      end
    end
  end
end
