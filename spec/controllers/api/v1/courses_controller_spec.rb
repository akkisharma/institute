require 'rails_helper'

RSpec.describe Api::V1::CoursesController, type: :request do


  let(:valid_attributes) {
    {
      course: {name: "MCOM1", credits: 50, months_duration: 36,
        tutors_attributes: [
          {first_name: "akash", last_name: "sharma", email: "akash@gmail.com", mobile: "438726428376", doj: "01/08/21"}
        ]
      }
    }
  }

  let(:invalid_attributes) {
    {
      course: {name: "", credits: 50, months_duration: 36,
        tutors_attributes: [
          {first_name: "", last_name: "sharma", email: "rahul@gmail.com", mobile: "43872642832", doj: "01/08/21"}
        ]
      }
    }
  }

  describe "POST #create" do

    context "with valid params" do
      it "creates a new Course with tutors" do
        expect{
          post '/api/v1/courses', params: valid_attributes
        }.to change(Course, :count).by(1)
      end

    end

    context "with invalid params" do
      it "returns a fail response" do
        post '/api/v1/courses', params: invalid_attributes
        expect(response).not_to be_successful
      end
    end

  end

  describe "GET #index" do

    it "get courses with tutors" do

      post '/api/v1/courses', params: valid_attributes
      get '/api/v1/courses'

      json_response = JSON.parse(response.body)['data']
      expect(json_response).not_to eq([])
    end

    it "get no courses with tutors" do

      post '/api/v1/courses', params: invalid_attributes
      get '/api/v1/courses'

      json_response = JSON.parse(response.body)['data']
      expect(json_response).to eq([])
    end

  end


end