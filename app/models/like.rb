class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  validates :user_id, uniqueness: { scope: [:likeable_id, :likeable_type] }
  validate :valid_class

  private

  def valid_class
    if !["Post", "Comment"].include?(:likeable_type)
      errors.add(:likeable_type, :invalid_class)
    end
  end
end
