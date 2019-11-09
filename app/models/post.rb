class Post < ApplicationRecord
  belongs_to :category
  has_many :tag
  has_many :comment, dependent: :destroy

  validates :title, :content, presence: true

  attribute :release, default: false

  def permalink
    "#{title.strip.downcase.gsub " ", "_"}"
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

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end
end
