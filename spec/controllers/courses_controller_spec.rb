require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  let(:valid_attributes) {
    {name: 'BCA', credits: 100, months_duration: 6}
  }

  let(:invalid_attributes) {
    {name: '', credits: 'abcd', months_duration: 6}
  }


  describe "GET #index" do
    it "returns a success response" do
      Course.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      course = Course.create! valid_attributes
      get :show, params: {id: course.to_param}
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
      course = Course.create! valid_attributes
      get :edit, params: {id: course.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Course" do
        expect {
          post :create, params: {course: valid_attributes}
        }.to change(Course, :count).by(1)
      end

      it "redirects to the created course" do
        post :create, params: {course: valid_attributes}
        expect(response).to redirect_to(Course.last)
      end
    end

    context "with invalid params" do
      it "returns a fail response" do
        post :create, params: {course: invalid_attributes}
        expect(response).not_to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: 'BCA', credits: 150, months_duration: 6}
      }

      it "updates the requested course" do
        course = Course.create! valid_attributes
        put :update, params: {id: course.to_param, course: new_attributes}
        course.reload
        expect(response).to redirect_to(course)
      end

      it "redirects to the course" do
        course = Course.create! valid_attributes
        put :update, params: {id: course.to_param, course: valid_attributes}
        expect(response).to redirect_to(course)
      end
    end

    context "with invalid params" do
      it "returns a fail response" do
        course = Course.create! valid_attributes
        put :update, params: {id: course.to_param, course: invalid_attributes}
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested course" do
      course = Course.create! valid_attributes
      expect {
        delete :destroy, params: {id: course.to_param}
      }.to change(Course, :count).by(-1)
    end

    it "redirects to the courses list" do
      course = Course.create! valid_attributes
      delete :destroy, params: {id: course.to_param}
      expect(response).to redirect_to(courses_url)
    end
  end

end
