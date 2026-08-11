# frozen_string_literal: true

module Foundation
  # Marketing landing page for Beacon. This replaces the template's minimal
  # home with the requested hero, features, pricing tiers, FAQ, and lead
  # capture.
  class HomeController < ApplicationController
    PLANS = [
      {
        name: "Free",
        price: 0,
        description: "For individuals and small experiments.",
        bullets: ["One workspace", "Up to 3 team members", "Community support"],
        highlighted: false,
        cta_text: "Start free",
        cta: -> { helpers.new_user_registration_path }
      },
      {
        name: "Pro",
        price: 29,
        description: "For teams shipping a growing product.",
        bullets: ["Unlimited workspaces", "Up to 25 team members", "API access", "Priority support"],
        highlighted: true,
        cta_text: "Choose Pro",
        cta: -> { helpers.pricing_path }
      },
      {
        name: "Enterprise",
        price: 99,
        description: "For organizations that need advanced controls.",
        bullets: ["Unlimited team members", "API access", "Single sign-on", "Dedicated support"],
        highlighted: false,
        cta_text: "Contact sales",
        cta: -> { "mailto:#{helpers.current_controller? ? nil : Rails.configuration.x.foundation[:support_email]}" }
      }
    ].freeze

    def show
      @plans = PLANS
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
