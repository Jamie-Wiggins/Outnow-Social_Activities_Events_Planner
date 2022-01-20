ActiveAdmin.register User do

  permit_params :username, :first_name, :last_name, :email, :avatar, :admin, :password, :password_confirmation, :current_password
  
end
