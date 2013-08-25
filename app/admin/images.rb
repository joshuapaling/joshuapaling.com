ActiveAdmin.register Image do
  index do
    selectable_column
    column :alt
    column :image do |image|
      image_tag image.image_url(:thumb).to_s
    end
    column :created_at
    column :updated_at
    default_actions
  end

  show do |image|
    attributes_table do
      row :alt
      row :image do
        output = image.image_url().to_s + '<br /><br />'
        output << image_tag(image.image_url(:thumb).to_s)
        simple_format output
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

end
