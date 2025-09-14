class Item < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  after_create_commit -> { broadcast_prepend_to "items" }
  after_update_commit -> { broadcast_replace_to "items" }, if: :name_changed?
  after_destroy_commit -> { broadcast_remove_to "items" }
end
