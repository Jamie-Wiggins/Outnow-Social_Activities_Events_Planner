ActiveAdmin.register Post do

  permit_params :title, :content, :image

  form do |f|
    f.inputs do
      f.input :title
      f.input :content
      f.input :image, as: :file
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :title
    column :content
    column :image
    actions
  end
  
end
