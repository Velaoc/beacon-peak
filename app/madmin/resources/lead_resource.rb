# frozen_string_literal: true

# Operator view of every lead captured from the Beacon Peak landing page.
class LeadResource < Madmin::Resource
  model Lead

  attribute :id, form: false
  attribute :name, form: false
  attribute :email, form: false
  attribute :source, form: false
  attribute :created_at, form: false

  menu label: "Leads", position: 15

  def self.display_name(record)
    record.display_name
  end
end
