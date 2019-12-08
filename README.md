# Sjabloon LITE (for Rails 6)

_Sjabloon LITE_ is a basic and slimmed-down version of Sjabloon: a Rails 6 SaaS starter kit to focus on your core product right from the start.

_Sjabloon LITE_ provides you with a starting point for your new Rails app with modern front-end tools:

- [Webpack](https://github.com/webpack/webpack)
- [PostCss](https://github.com/postcss/postcss)
- [Tailwind](https://github.com/tailwindcss/tailwindcss)
- [StimulusJS](https://github.com/stimulusjs/stimulus)

It adds and configures these tools (eg. Tailwind + [PurgeCss](https://github.com/FullHuman/purgecss)) for you. By removing Sprockets (`--skip-sprockets`), including the `app/assets` directory, your new app is well organised and ready for the future. ✨

## What is [Sjabloon](https://www.getsjabloon.com)?
Sjabloon is a commercially available Rails SaaS starter kit to focus on your core product right away. It comes with many features seen in modern SaaS and web apps.
**You can customise Sjabloon to create a template that perfectly fits the needs for your new product**. In addition to the modern front end tooling as provided by _Sjabloon LITE_, it comes with:

- Customisation for your next app with the features you need
- Multiple themes and homepage designs
- Vast UI components library built with Tailwind CSS
- Billing with Stripe
- Authentication with Devise (setup, configuration, emails and design)
- GDPR foundation
- Custom-designed admin dashboard
- Email marketing by integrating with Mailchimp, Mailerlite and Button-down.email
- Generator to spin up content pages (key for SEO/marketing purposes)
- Great looking transactional emails and custom error pages
- Integrations with SMTP providers (Mailgun, Postmark etc.), analytic tools (Google Analytics, Clicky etc.), customer support (Intercom, Drift etc.) and error monitoring set up (Bugsnag, Sentry etc.)

Learn more at [www.getsjabloon.com](https://www.getsjabloon.com)

## How to create a new app?

```bash
rails _6.0.0_ new something-amazing -d postgresql --skip-sprockets -m https://raw.githubusercontent.com/eelcoj/sjabloon-lite/master/template.rb
`````

## How to run your new app
cd into the new created directory and run `foreman start` (be sure to have foreman installed: `gem install foreman`).
