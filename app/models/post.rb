class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :content, presence: true
  validates :slug, presence: true, format: {with: /\A[a-z0-9-]+\z/}

  enum status: { draft: 0, published: 1 }

  def to_param
    slug
  end
end
