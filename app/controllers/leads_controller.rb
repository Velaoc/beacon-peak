# frozen_string_literal: true

# Public signup capture for the Beacon Peak landing page. Leads are stored
# under the "Beacon Peak" organization so operators can work them from the
# CRM (as members of that organization) or from Admin → Leads.
class LeadsController < ApplicationController
  def create
    name = params.dig(:lead, :name).to_s.strip
    email = params.dig(:lead, :email).to_s.strip.downcase
    name = email.split("@").first.presence || "New lead" if name.blank?

    organization = Organizations::Organization.find_or_create_by!(name: "Beacon Peak")
    lead = Foundation::Crm::Lead.new(
      organization: organization,
      name: name,
      email: email.presence,
      source: "Landing page signup",
      status: "new"
    )

    if lead.save
      redirect_to root_path(anchor: "signup"), notice: "You're on the list — we'll be in touch."
    else
      redirect_to root_path(anchor: "signup"), alert: lead.errors.full_messages.to_sentence
    end
  end
end
