require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WhenIWork::Shift do
  describe "GET shifts" do
    it "gets shifts" do
      VCR.use_cassette("authenticate", match_requests_on: [:headers]) do
        response = WhenIWork.configure(ENV['WHENIWORK_USERNAME'], ENV['WHENIWORK_PASSWORD'], ENV['WHENIWORK_API_KEY'])
        expect(response).to_not be_nil
      end

      VCR.use_cassette("shifts", match_requests_on: [:headers]) do
        response = WhenIWork::Shift.all
        expect(response.body).to include('start', 'end', 'shifts')
      end
    end
  end
end
