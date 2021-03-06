class Post < ActiveRecord::Base

  has_many :categorizations
  has_many :categories, :through => :categorizations

  validates_presence_of :blurb, :title, :published_at, :slug
  validates_uniqueness_of :slug

  default_scope { order('published_at DESC') }
  scope :published, -> { where(:published => true) }
  scope :unpublished, -> { where(:published => false) }

  after_initialize :set_defaults

  def content field
    if field
      MarkdownService.new.render(field)
    else
      ''
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


