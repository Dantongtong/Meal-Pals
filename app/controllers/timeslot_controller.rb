class TimeslotController < ApplicationController  
    def join_timeslot
        timeslot_id = params[:id]
        @timeslot = Timeslot.find(timeslot_id)
        @timeslot.guest.push(session[:user_id])
        flash[:notice] = "Joined this timeslot successfully."
        redirect_to restaurant_path
    end

    def exit_timeslot
        timeslot_id = params[:id]
        @timeslot = Timeslot.find(timeslot_id)
        @timeslot.guest.delete(session[:user_id])
        flash[:notice] = "Exited this timeslot successfully."
        redirect_to restaurant_path
    end
  end