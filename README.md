<!-- foundation:identity -->
# Beacon Peak

Marketing landing page for Beacon, a SaaS analytics product: hero, features, pricing tiers, FAQ, and an email signup that stores leads for the sales pipeline.

- Site: https://beacon-peak.api.holode.xyz
- Support: support@beacon-peak.api.holode.xyz
<!-- /foundation:identity -->

## What this is

Marketing landing page for Beacon, a SaaS analytics product: hero, features, pricing tiers, FAQ, and an email signup that stores leads for the sales pipeline.

## Who it is for

- Visitor
- Admin

## Main features

- **View landing page** — Public root shows hero, features, pricing tiers, FAQ
- **Sign up for updates** — Visitor submits email + name, stored as a Lead
- **Manage leads** — Admin views and manages captured leads

## Core entities

- Lead

## Included foundation modules

- crm

## Run locally

```bash
bundle install
bin/rails db:prepare
bin/dev
```

Requires Ruby, PostgreSQL, and the usual Rails toolchain. See `bin/setup` if present.

## Demo

Marketing content (features, pricing tiers, FAQ) seeded via the app; a couple of sample leads to show the admin view.

## Deploy notes

Production `config.hosts` is derived from `domain` in `config/foundation.yml`. Keep that value aligned with the real host or every request will 403.
