class Post < ApplicationRecord
  has_paper_trail
  
  belongs_to :category
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :taggings

  validates :title, :content, presence: true
  validates :title, length: { maximum: 100 }

  attribute :release, default: false

  before_save :permalink

  def permalink
    super || self.permalink = "#{title.strip.downcase.gsub " ", "_"}"
  end

  def content_to_html
    renderer = CodeRayify.new(filter_html: true, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(
      renderer,
      fenced_code_blocks: true,
      autolink: true,
      tables: true,
      strikethrough: true,
      lax_spacing: true,
      space_after_headers: true,
    )
    markdown.render(content).html_safe
  end

  def self.all_release
    release_post = Post.order('release_date DESC').where(release: true)
    release_post.map do |p|
      {
        'title' => p.title,
        'permalink' => p.permalink,
        'release_date' => p.release_date,
        'category' => { "id" => p.category.id, "name" => p.category.name },
        'user' => { "id" => p.user.id, "display_name" => p.user.show_display_name },
        'tags' => p.tags.pluck_h(:id, :name)
      }
    end
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end
end
