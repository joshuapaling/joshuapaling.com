class Post < ActiveRecord::Base
  attr_accessible :body, :title, :slug, :published, :author, :author_id, :published_at, :blurb, :category_ids

  has_many :comments
  has_many :categorizations
  has_many :categories, :through => :categorizations

  belongs_to :author, :class_name => "AdminUser"

  validates_presence_of :blurb, :title, :published_at, :slug
  validates_uniqueness_of :slug

  default_scope order('published_at DESC')
  scope :published, where(:published => true)
  scope :unpublished, where(:published => false)

  after_initialize :set_defaults

  def content field
    if field
      MarkdownService.new.render(field)
    else
      ''
    end
  end

  def author_name
    if author
      author.name
    else
      'Nobody'
    end
  end

  # set defaults - taken from http://stackoverflow.com/questions/328525/what-is-the-best-way-to-set-default-values-in-activerecord
  def set_defaults
    self.published_at  ||= Time.now
  end

  def to_param
    slug
  end

end


