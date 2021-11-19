module Api
  module V1

    class CoursesController < ActionController::API

      def index
        courses_with_tutors = Course.courses_with_tutors
        render json: {data: courses_with_tutors, status: :ok}
      end

      # POST /courses or /courses.json
      def create
        course = Course.new(course_params)

        if course.save
          render json: course, status: :created
        else
          render json: course.errors, status: :unprocessable_entity
        end
      end

      private
      # Only allow a list of trusted parameters through.
      def course_params
        params.require(:course).permit(:name, :credits, :months_duration, tutors_attributes: [:first_name, :last_name, :email, :mobile, :doj])
      end

    end

  end
end