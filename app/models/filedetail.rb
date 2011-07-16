class Filedetail < ActiveRecord::Base
attr_accessible :fdata, :fdata_password, :fdata_days
	has_attached_file :fdata,
	:path => ":rails_root/uploads/:class/:id/:basename, :extension"
validates_presence_of :fdata_file_name, :fdata_password, :fdata_days
validates_length_of :fdata_password, :in => 3..30
validates_numericality_of :fdata_days
validate :fdata_days_cannot_be_less_than_1
def fdata_days_cannot_be_less_than_1
	errors.add(:fdata_days, "The number of days should not be lessthan 1.") if
	!fdata_days.blank? and fdata_days < 1
end
	
end
