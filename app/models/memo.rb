class Memo < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidate, use: :slugged

  include AASM

  acts_as_paranoid

  belongs_to :user
  has_one_attached :cover_image
  has_many :comments

  validates :title, presence: true

  scope :published_memos, -> {published.with_attached_cover_image.order(created_at: :desc).includes(:user)}

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :serbian).to_s
  end

  aasm(column: 'status', no_direct_assignment: true) do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published
    end

    event :unpublish do
      transitions from: :published, to: :draft
    end
  end

  private
  def slug_candidate
    [
      :title,
      [:title, SecureRandom.hex[0, 8]]
    ]
  end

end
