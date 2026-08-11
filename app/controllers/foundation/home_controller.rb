# frozen_string_literal: true

module Foundation
  # Marketing landing page for Beacon. This replaces the template's minimal
  # home with the requested hero, features, pricing tiers, FAQ, and lead
  # capture. The public pricing section mirrors PricingPlans (the foundation's
  # single source of truth for tiers) so the page never drifts from billing.
  class HomeController < ApplicationController
    def show
      @plans = PricingPlans.all
      @faqs = [
        {
          q: "Do I need to install anything to use Beacon?",
          a: "No. Beacon runs entirely in your browser — you sign in and your dashboards are live in seconds. Nothing to install, nothing to maintain."
        },
        {
          q: "Which analytics sources does Beacon connect to?",
          a: "Beacon starts with web analytics, product events, and revenue data, and its pipeline is built to add new sources without rework. Connect what you use today and plug in more as you grow."
        },
        {
          q: "How is my data kept secure?",
          a: "Data is encrypted in transit and at rest, access is scoped to your workspace, and you stay in control of what Beacon sees. We never sell your data."
        },
        {
          q: "Can I change or cancel my plan later?",
          a: "Yes — upgrade, downgrade, or cancel from your billing settings at any time. Changes apply from your next billing period."
        }
      ]
    end
  end
end
