class Post < ActiveRecord::Base
  attr_accessible :body, :title, :published, :author, :author_id, :published_at, :blurb

  has_many :comments

  belongs_to :author, :class_name => "AdminUser"

  validates_presence_of :body, :title

  scope :published, where(:published => true)

  scope :unpublished, where(:published => false)

  def content field
    MarkdownService.new.render(field)
  end

  def author_name
    if author
      author.name
    else
      'Nobody'
    end
  end
end


