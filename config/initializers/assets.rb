# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( home-page.css )
Rails.application.config.assets.precompile += %w( blog.css )
Rails.application.config.assets.precompile += %w( error-code.css )
Rails.application.config.assets.precompile += %w( bootstrap-loader.css )
Rails.application.config.assets.precompile += %w( dashboard.css )
Rails.application.config.assets.precompile += %w( ckeditor/* )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
