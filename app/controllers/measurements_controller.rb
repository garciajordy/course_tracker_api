class MeasurementsController < ApplicationController
    include CurrentUserConcern
    def create
        @measurement = Measurement.create(amount: params[:measurement][:amount],
            user_id: @current_user.id,
            course_id: params[:measurement][:course_id])
            if @measurement
                render :json => {
                    measurement: @measurement,
                    status: :created
                }
            else
                render json: { status: 401 }
            end
    end

    def update
        @measurement.find(params[:measurement][:id])
        @measurement.update(amount: params[:measurement][:amount])
        if @measurement.save
            render :json => {
                status: :success
            }
        else
            render json: { status: 401 }
        end
    end

    def destroy
        @measurement.find(params[:id])
        @measurement.destroy
        render json: { status: :success}
    end
end
