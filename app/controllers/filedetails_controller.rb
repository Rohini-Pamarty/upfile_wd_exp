class FiledetailsController < ApplicationController
	def index
		@filedetail=Filedetail.all
	end
	def new
		@filedetail=Filedetail.new
	end
	def create
		@filedetail=Filedetail.new(params[:filedetail])
		if @filedetail.save
			redirect_to(:action => "show", :id => @filedetail.id)
		else
			render :action => "new"
		end
		
	end
	def show
		@filedetail=Filedetail.find(params[:id])

	end
	def autheticate

		@filedetail=Filedetail.find(params[:id])
		
	end
	def download
		flash.discard(:notice)
		@filedetail=Filedetail.find(params[:id])
		if(@filedetail.fdata_password == params[:pass])
			if(((Time.now.utc-@filedetail.created_at)/86400).to_i<@filedetail.fdata_days)
				send_file(@filedetail.fdata.path, :type => @filedetail.fdata_content_type, :disposition => 'inline')
				
			else
				flash[:notice] = "Link expried"
				render "download"
			end
		else
			flash[:notice] = "Incorrect password"
				render "download"
			
		end
	
	end
end
