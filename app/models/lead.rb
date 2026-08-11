# frozen_string_literal: true

# App-level lead captured from the Beacon Peak landing page. Deliberately
# independent of the optional CRM module: the marketing site's core feature
# must work whether or not the CRM ships, and app code stays free of
# module-specific constants so the module can be omitted cleanly.
class Lead < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { maximum: 254 }
  validates :name, length: { maximum: 200 }
  validates :source, length: { maximum: 120 }

  before_validation :normalize

  scope :ordered, -> { order(created_at: :desc, id: :desc) }

  def display_name
    name.presence || email
  end

  private

  def normalize
    self.email = email.to_s.strip.downcase.presence
    self.name = name.to_s.strip.presence
    self.source = source.to_s.strip.presence
  end
end
