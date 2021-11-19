require 'rails_helper'

RSpec.describe TutorsController, type: :controller do

  let(:course) { Course.create({name: 'BCA', credits: 100, months_duration: 6}) }

  let(:valid_attributes) {
    {course_id: course.id, first_name: 'akash', last_name: 'sharma', email: 'abc@gmail.com', mobile: '1234567890', doj: Date.today}
  }

  let(:invalid_attributes) {
    {course_id: course.id, first_name: '', last_name: 11111, email: 'abc@gmail.com', mobile: '1234567890', doj: Date.today}
  }

  describe "GET #index" do
    it "returns a success response" do
      Tutor.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      tutor = Tutor.create! valid_attributes
      get :show, params: {id: tutor.to_param}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      tutor = Tutor.create! valid_attributes
      get :edit, params: {id: tutor.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Tutor" do
        expect{
          post :create, params: {tutor: valid_attributes}
        }.to change(Tutor, :count).by(1)
      end

      it "redirects to the created tutor" do
        post :create, params: {tutor: valid_attributes}
        expect(response).to redirect_to(Tutor.last)
      end
    end

    context "with invalid params" do
      it "returns a fail response" do
        post :create, params: {tutor: invalid_attributes}
        expect(response).not_to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {first_name: 'akki', last_name: 'sharma', email: 'abc@gmail.com', mobile: '1234567890', doj: Date.today}
      }

      it "updates the requested tutor" do
        tutor = Tutor.create! valid_attributes
        put :update, params: {id: tutor.to_param, tutor: new_attributes}
        tutor.reload
        expect(response).to redirect_to(tutor)
      end

      it "redirects to the tutor" do
        tutor = Tutor.create! valid_attributes
        put :update, params: {id: tutor.to_param, tutor: valid_attributes}
        expect(response).to redirect_to(tutor)
      end
    end

    context "with invalid params" do
      it "returns a fail response" do
        tutor = Tutor.create! valid_attributes
        put :update, params: {id: tutor.to_param, tutor: invalid_attributes}
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested tutor" do
      tutor = Tutor.create! valid_attributes
      expect {
        delete :destroy, params: {id: tutor.to_param}
      }.to change(Tutor, :count).by(-1)
    end

    it "redirects to the tutors list" do
      tutor = Tutor.create! valid_attributes
      delete :destroy, params: {id: tutor.to_param}
      expect(response).to redirect_to(tutors_url)
    end
  end

end
