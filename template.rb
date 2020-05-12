def set_application_name
  environment "config.application_name = Rails.application.class.module_parent_name"
end

def disable_default_generators
file 'config/initializers/generators.rb', <<-CODE
Rails.application.config.generators do |g|
  g.javascripts false
  g.jbuilder false
  g.stylesheets false
  g.assets false
  g.helper false
end
CODE
end

def change_webpacker_config_file
  gsub_file "config/webpacker.yml",

    /source_path: app\/javascript/,
    "source_path: frontend"
end

def move_webpacker_javascript_directory_to_root
  run "mv app/javascript frontend"

  change_webpacker_config_file
end

def setup_tailwindcss
  run "yarn add tailwindcss"
  run "mkdir -p frontend/stylesheets"
  run "mkdir -p frontend/images"

  file "tailwindcss.config.js", <<-CODE
module.exports = {
  theme: {},
  variants: {},
  plugins: [],
}
  CODE

file "frontend/stylesheets/application.scss", <<-CODE
@import "tailwindcss/base";
@import "tailwindcss/components";

/* Example structure/organisation could be as follows:
@import "settings";
@import "base";
@import "objects";
@import components";
*/


@import "tailwindcss/utilities";
CODE
end

def setup_stimulus
  run "bundle exec rails webpacker:install:stimulus"
end

def add_purgecss
  run "yarn add @fullhuman/postcss-purgecss"
end

def setup_postcss_config
  run 'rm -f postcss.config.js'

file "postcss.config.js", <<-CODE
let environment = {
  plugins: [
    require("tailwindcss")('./tailwindcss.config.js'),
    require("postcss-import"),
    require("postcss-flexbugs-fixes"),
    require("postcss-preset-env")({
      autoprefixer: {
        flexbox: "no-2009"
      },
      stage: 3
    }),
  ]
}

if (process.env.RAILS_ENV === "production") {
  environment.plugins.push(
    require("@fullhuman/postcss-purgecss")({
      content: [
        "./app/views/**/*.html.erb",
        "./app/helpers/**/*rb",
        "./frontend/controllers/**/*.js"
      ],
      defaultExtractor: content => content.match(/[\\w-/:]+(?<!:)/g) || []
    })
  )
}

module.exports = environment
CODE
end

def remove_default_assets
  run "rm -rf app/assets/"
end

def add_foreman
file "Procfile.dev", <<-CODE
web: rails server
webpack: ./bin/webpack-dev-server --watch --colors --progress
CODE

file ".foreman", <<-CODE
procfile: Procfile.dev
CODE
end

def setup_application_pack_file
  remove_file "frontend/packs/application.js"

file "frontend/packs/application.js", <<-CODE
/* eslint no-console:0 */

import { Application } from "stimulus"
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()

import { definitionsFromContext } from "stimulus/webpack-helpers"
require("stylesheets/application.scss")

const application = Application.start()
const context = require.context("controllers", true, /.js$/)
application.load(definitionsFromContext(context))

const images = require.context('../images', true)
const imagePath = (name) => images(name, true)
CODE
end

def replace_application_include_tags
  gsub_file "app/views/layouts/application.html.erb", /stylesheet_link_tag/, "stylesheet_pack_tag"
  gsub_file "app/views/layouts/application.html.erb", /javascript_include_tag/, "javascript_pack_tag"
end

def stop_spring
  run "spring stop"
end

after_bundle do
  set_application_name
  disable_default_generators
  stop_spring
  move_webpacker_javascript_directory_to_root
  setup_tailwindcss
  setup_stimulus
  add_purgecss
  setup_postcss_config
  add_foreman
  remove_default_assets
  setup_application_pack_file
  replace_application_include_tags

  rails_command "db:create"

  git :init
  git add: "."
  git commit: %Q{ -m "Initial commit" }

  say "============================================================="
  say ""
  say "💡 Sjabloon LITE (om...) is successfully installed! ✨", :yellow
  say "For more features, designed templates, fully configuration,", :yellow
  say "UI components and billing with Stripe, check out https://www.getsjabloon.com (💡 cmd + click to open).", :yellow
  say ""
  say "============================================================="
end
