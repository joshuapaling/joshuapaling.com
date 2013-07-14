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
end
