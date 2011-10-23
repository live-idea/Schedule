class TeachersController < ApplicationController
 before_filter :authenticate_user!
 # GET /teachers
  # GET /teachers.json
  def index
   @teachers = Teacher.all
  end
  
  def new
    @teacher = Teacher.new
  end

  def edit
    @teacher = Teacher.find params[:id]
  end

  
  def update
      @teacher = Teacher.find(params[:id])

      if @teacher.update_attributes(params[:teacher])
        redirect_to teachers_path, notice: 'Teacher was successfully updated.' 
      else
        render action: "edit" 
      end
  
  end

  def create
    @teacher = Teacher.new 
    
    if @teacher.update_attributes(params[:teacher])
      redirect_to teachers_path, notice: 'Teacher was successfully created.' 
    else
      render action: "new" 
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    redirect_to teachers_path, notice: 'Teacher was successfully deleted.' 
  end

end
