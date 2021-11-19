require 'rails_helper'

RSpec.describe "Tutors", type: :request do
  describe "GET /tutors" do
    it "get tutor index" do
      get tutors_path
      expect(response).to have_http_status(200)
    end
  end
end
