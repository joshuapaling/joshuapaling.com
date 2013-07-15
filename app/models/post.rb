class Post < ActiveRecord::Base
  attr_accessible :body, :title, :published, :author, :author_id, :published_at, :blurb, :category_ids

  has_many :comments
  has_many :categorizations
  has_many :categories, :through => :categorizations

  belongs_to :author, :class_name => "AdminUser"

  validates_presence_of :body, :title

  default_scope order('published_at DESC')
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


