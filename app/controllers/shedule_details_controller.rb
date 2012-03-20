# -*- encoding : utf-8 -*-  
class SheduleDetailsController < ApplicationController
  # GET /shedule_details
  before_filter :authenticate_user!, :except => [:index, :widget]

  def index
    @shedule = Shedule.find(params[:shedule_id])
    if params[:teacher_id]
      @shedule_details = @shedule.shedule_details.find_all_by_teacher_id(params[:teacher_id])
    else
      @shedule_details = nil
    end
    if params[:teacher_id]
      @teacher_id = params[:teacher_id]
    else
      @teacher_id = nil
    end
    #respond_to do |format|
     # format.html {render :layout=>false} # new.html.erb
      #format.json { render json: @shedule_details }
    #end
  end
  
  def widget
    @shedule = Shedule.find(params[:shedule_id])
    if params[:teacher_id]
      @shedule_details = @shedule.shedule_details.where(:teacher_id=>params[:teacher_id])#.where(:day_week =>params[:day])
    else
      @shedule_details = nil
    end
    if params[:teacher_id]
      @teacher_id = params[:teacher_id]
    else
      @teacher_id = nil
    end
    render :layout=>false
#    respond_to do |format|
#      format.html {render :layout=>false} # new.html.erb
#      #format.json { render json: @shedule_details }
#    end
  end
  
  def new
    @shedule = Shedule.find(params[:shedule_id])
    @shedule_detail = @shedule.shedule_details.new
    @shedule_detail.day_week = params[:day]
    @shedule_detail.lesson_no = params[:lesson]
    @shedule_detail.teacher_id = params[:teacher_id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shedule_detail }
    end
  end
  def create
    @shedule_detail = SheduleDetail.new 
    @shedule_detail.shedule = Shedule.find(params[:shedule_id])
    if @shedule_detail.update_attributes(params[:shedule_detail])
      redirect_to shedule_shedule_details_path(@shedule, :teacher_id=>@shedule_detail.teacher_id), notice: 'Shedule Detail was successfully created.' 
    else
      render action: "new" 
    end
  end
  
  def edit
    @shedule = Shedule.find(params[:shedule_id])
    @shedule_detail = SheduleDetail.find(params[:id])
     
  end

  
  def update
    @shedule = Shedule.find(params[:shedule_id])
    @shedule_detail = SheduleDetail.find(params[:id])
      
    if @shedule_detail.update_attributes(params[:shedule_detail])
      redirect_to shedule_shedule_details_path(@shedule, :teacher_id=>@shedule_detail.teacher_id), notice: 'Shedule Detail was successfully updated.' 
    else
      render action: "edit" 
    end
  end
  def destroy
    @shedule = Shedule.find(params[:shedule_id])
    @shedule_detail = SheduleDetail.find(params[:id])
    @shedule_detail.destroy
    redirect_to shedule_shedule_details_path(@shedule, :teacher_id=>@shedule_detail.teacher_id), notice: 'Shedule details was successfully deleted.' 
  end
end
