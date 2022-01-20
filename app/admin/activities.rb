ActiveAdmin.register Activity do

  permit_params :title, :description, :attendee_max, :start_time, :finish_time, :longitude, :latitude, :image
  
end
