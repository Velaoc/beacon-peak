# frozen_string_literal: true

# Operator-level view of every lead captured from the Beacon Peak landing
# page, across organizations. The org-scoped CRM remains the day-to-day
# workspace; this resource exists so a promoted operator can see the whole
# pipeline at a glance.
class LeadResource < Madmin::Resource
  model Foundation::Crm::Lead

  attribute :id, form: false
  attribute :name, form: false
  attribute :email, form: false
  attribute :source, form: false
  attribute :status, form: false
  attribute :owner, form: false
  attribute :organization, form: false
  attribute :created_at, form: false

  menu label: "Leads", position: 15

  def self.display_name(record)
    record.name
  end
end
