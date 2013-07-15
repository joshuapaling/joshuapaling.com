ActiveAdmin.register Post do
  scope :published
  scope :unpublished

  index do
    selectable_column
    column :title
    column :updated_at
    column :published
    column :published_at
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :author
      f.input :published
      f.input :published_at
      f.input :title
      f.input :categories, :as => :check_boxes
      f.input :blurb
      f.input :body
    end
    f.buttons
  end

end
