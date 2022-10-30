class TimeslotsController < ApplicationController  
    def show
        status = params[:status]
        timeslot_id = params[:id]
        @timeslot = Timeslot.find(timeslot_id)
        if status == 'active'
            @timeslot.guest=session[:user_id]
            flash[:notice] = "Joined this timeslot successfully."
        else
            @timeslot.guest=nil
            flash[:notice] = "Exited this timeslot successfully."
        end
        redirect_to restaurant_path
    end
  end