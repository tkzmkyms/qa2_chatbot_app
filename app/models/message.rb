class Message < ApplicationRecord
  validates :content, presence: true
  validates :sender, presence: true, inclusion: { in: %w[user bot] }
end
