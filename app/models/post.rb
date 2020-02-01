require 'markdown_helper'

class Post < ApplicationRecord

  include MarkdownHelper

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

  def self.all_release
    release_post = Post.where(release: true).order('release_date DESC')
    posts = release_post.map do |p|
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
end
