class WelcomeController < ApplicationController

  def index
    @courses_with_tutors = Course.courses_with_tutors
  end

end