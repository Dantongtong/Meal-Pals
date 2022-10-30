class TimeslotController < ApplicationController  
    def update
        status = params[:status]
        timeslot_id = params[:id]
        @timeslot = Timeslot.find(timeslot_id)
        if status == 'active'
            @timeslot.guest.push(session[:user_id])
            flash[:notice] = "Joined this timeslot successfully."
        else
            @timeslot.guest.delete(session[:user_id])
            flash[:notice] = "Exited this timeslot successfully."
        end
        redirect_to restaurant_path
    end
  end