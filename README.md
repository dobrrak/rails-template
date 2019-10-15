# Sjabloon LITE (for Rails 6)

_Sjabloon LITE_ is a basic and slimmed-down version of Sjabloon. A Rails 6 SaaS starter kit to focus on your core product right from the start.

_Sjabloon LITE_ provides you with a great starting point for your new Rails app with modern front-end tools:

- [Webpack](https://github.com/webpack/webpack)
- [PostCss](https://github.com/postcss/postcss)
- [Tailwind](https://github.com/tailwindcss/tailwindcss)
- [StimulusJS](https://github.com/stimulusjs/stimulus)

It adds and configures these tools (eg. Tailwind + [PurgeCss](https://github.com/FullHuman/purgecss)) for you. By removing Sprockets (`--skip-sprockets`), including the `app/assets` directory, your new app is well organised and ready for the future. ✨

## What is [Sjabloon](https://www.getsjabloon.com)?
Sjabloon is a commercially available SaaS kit to focus on your core product right from the start. It comes with many features seen in almost every modern SaaS and web app.
**You can customise Sjabloon to create a template that perfectly fits the needs for your new product**. In addition to the modern front-end tooling provided by _Sjabloon LITE_, it comes with:

- Authentication with Devise, inc. setup, configuration, emails and design
- Billing with Stripe
- Beautiful UI components built with Tailwind
- Multiple (homepage) design
- GDPR best practices
- Fully designed user dashboard and set up
- Generator to quickly create and publish your SEO content pages
- Great looking transactional emails
- Custom error pages
- Integrations with SMTP providers (Mailgun, Postmark etc.), analytic tools (Google Analytics, Clicky etc.), customer support (Intercom, Drift etc.) and error monitoring set up (Bugsnag, Sentry etc.)
- Email drip campaign set up

Learn more at [www.getsjabloon.com](https://www.getsjabloon.com)

## How to create a new app?

```bash
rails _6.0.0_ new something-amazing -d postgresql --skip-sprockets -m https://raw.githubusercontent.com/eelcoj/sjabloon-lite/master/template.rb
```

## How to run your new app

```bash
cd into the new created directory and run `foreman start` (be sure to have foreman installed: `gem install foreman`).
```
