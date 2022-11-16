class TimeslotsController < ApplicationController  
    def new
        @timeslot = Timeslot.new
        @restaurant_id = session[:restaurant_id]
    end

    def create
        restaurant_id = session[:restaurant_id]
        user_id = session[:user_id]
        ts = timeslot_params
        if params["start_time"] != ''
            ts['start_time'] = Time.strptime(params["start_time"],"%m/%d/%Y %I:%M %p")
            ts['restaurant_id'] = restaurant_id
            ts['user_id'] = user_id
            @timeslot = Timeslot.create!(ts)
            if @timeslot.save
            flash[:notice] = "This timeslot was successfully created."
            else
            flash[:notice] = "This timeslot failed to be created."
            end
        else
            flash[:notice] = "Please select a valid time slot."
        end
        redirect_to restaurant_path(restaurant_id)
    end

    def edit
        restaurant_id = session[:restaurant_id]
        status = params[:status]
        timeslot_id = params[:id]
        @user_id = session[:user_id]
        @timeslot = Timeslot.find(timeslot_id)
        if @user_id != @timeslot.user_id
            if status == 'active'      
                Guest.create!({'timeslot_id': timeslot_id,'user_id': @user_id })
                flash[:notice] = "Joined this timeslot successfully."
            else
                @guest = Guest.find_by(:timeslot_id =>timeslot_id, :user_id => @user_id )
                @guest.destroy
                flash[:notice] = "Exited this timeslot successfully."
            end
            @timeslot.save!
        end
        redirect_to restaurant_path(restaurant_id)
    end

    def show
        restaurant_id = session[:restaurant_id]
        timeslot_id = params[:id]
        @timeslot = Timeslot.find(timeslot_id)
        @guests = Guest.where(:timeslot_id =>timeslot_id).to_a
    end

    def destroy
        restaurant_id = session[:restaurant_id]
        @timeslot = Timeslot.find(params[:id])
        @guests =Guest.where(:timeslot_id =>params[:id])
        if @guests.present?
            @guests.each do |g|
                g.destroy
            end
        end
        @timeslot.destroy
        redirect_to restaurant_path(restaurant_id)
        flash[:notice] ='Timeslot was successfully destroyed.'
    end

    def timeslot_params
        params.require(:timeslot).permit(:restaurant_id, :user_id, :max_number)
    end
  end