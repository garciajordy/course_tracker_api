class CoursesController < ApplicationController
  include CurrentUserConcern
  def index
    @courses = Course.all
    render :json => @courses
  end

  def show
    @course = Course.find(params[:id])
    render :json => {
      course: @course,
      measurements: @course.measurements.where(user_id: Session.first.user_id)
    }
  end
end
