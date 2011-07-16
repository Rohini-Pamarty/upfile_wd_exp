class CreateFiledetails < ActiveRecord::Migration
  def self.up
    create_table :filedetails do |t|
t.string :fdata_file_name 
t.string :fdata_content_type
t.string :fdata_password
t.integer :fdata_days
      t.timestamps
    end
  end

  def self.down
    drop_table :filedetails
  end
end
