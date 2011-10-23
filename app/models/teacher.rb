class Teacher < ActiveRecord::Base
  has_many :shedule_details
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates :full_name, :presence=>true
  validates :department, :presence=>true
  
  
end
