# frozen_string_literal: true

# Demo content for the Beacon Peak preview. Nothing here is required in
# production — the app boots, migrates, and serves every page on an empty
# database. This exists so the Holodex demo has a few leads to show in
# Admin → Leads.
#
# Run with: bin/rails db:seed
#
# The first operator account is promoted from the console on purpose; there
# is deliberately no seeded administrator, password, or API key anywhere in
# this repository.
org = Organizations::Organization.find_or_create_by!(name: "Beacon Peak")

leads = [
  { name: "Maya Chen", email: "maya@northwindlabs.io", source: "Landing page signup" },
  { name: "Jonas Weber", email: "jonas@brightloop.co", source: "Landing page signup" },
  { name: "Priya Raman", email: "priya@fieldstone.app", source: "Landing page signup" }
]

leads.each do |attrs|
  Foundation::Crm::Lead.find_or_create_by!(organization: org, email: attrs[:email]) do |lead|
    lead.name = attrs[:name]
    lead.source = attrs[:source]
    lead.status = "new"
  end
end

puts "Seeded #{Foundation::Crm::Lead.where(organization: org).count} leads for Beacon Peak."
