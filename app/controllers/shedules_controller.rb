class ShedulesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  # GET /shedules
  # GET /shedules.json
  def index
   @shedules = Shedule.all
  end
  def new
    @shedule = Shedule.new
     respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shedule }
    end
  end
  def create
    @shedule = Shedule.new 
    
    if @shedule.update_attributes(params[:shedule])
      redirect_to shedules_path, notice: 'Shedule was successfully created.' 
    else
      render action: "new" 
    end
  end
  
  def edit
    @shedule = Shedule.find params[:id]
  end

  
  def update
      @shedule = Shedule.find(params[:id])

      if @shedule.update_attributes(params[:shedule])
        redirect_to shedules_path, notice: 'Shedule was successfully updated.' 
      else
        render action: "edit" 
      end  
  end
  def destroy
    @shedule = Shedule.find(params[:id])
    @shedule.destroy
    redirect_to shedules_path, notice: 'Shedule was successfully deleted.' 
  end
end
