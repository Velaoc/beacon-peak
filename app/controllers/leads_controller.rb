# frozen_string_literal: true

# Public signup capture for the Beacon Peak landing page. Stores a Lead for
# the sales team; the admin area (Madmin) lists and manages these records.
class LeadsController < ApplicationController
  def create
    name = params.dig(:lead, :name).to_s.strip
    email = params.dig(:lead, :email).to_s.strip.downcase
    name = email.split("@").first.presence || "New lead" if name.blank?

    lead = Lead.new(
      name: name,
      email: email.presence,
      source: "Landing page signup"
    )

    if lead.save
      redirect_to root_path(anchor: "signup"), notice: "You're on the list — we'll be in touch."
    else
      redirect_to root_path(anchor: "signup"), alert: lead.errors.full_messages.to_sentence
    end
  end
end
