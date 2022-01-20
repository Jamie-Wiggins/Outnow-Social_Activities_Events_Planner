ActiveAdmin.register Report do
  permit_params :title, :content, :created_at, :updated_at
end
