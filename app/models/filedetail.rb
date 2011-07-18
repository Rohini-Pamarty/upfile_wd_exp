class Filedetail < ActiveRecord::Base
attr_accessible :fdata, :fdata_password, :fdata_days
	has_attached_file :fdata,
	:path => ":rails_root/uploads/:class/:id/:basename, :extension"
validates_presence_of :fdata_file_name, :fdata_password, :fdata_days
validates_length_of :fdata_password, :in => 3..30


	
end
