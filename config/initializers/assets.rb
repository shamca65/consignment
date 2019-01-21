# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Add Yarn node_modules folder to the asset load path.
#Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
# Rails.application.config.assets.precompile += %w( jquery.js )
#
#Rails.application.config.assets.precompile += %w( jquery.js )
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
Rails.application.config.assets.paths << Rails.root.join('app','assets','images')
Rails.application.config.assets.precompile += %w(.svg .eot .woff .ttf)

# material bootstrap
Rails.application.config.assets.precompile += %w( js/mdb.js )
Rails.application.config.assets.precompile += %w( css/mdb.css )
Rails.application.config.assets.precompile += %w( js/datatables.js )
Rails.application.config.assets.precompile += %w( css/datatables.css )
# gritter
Rails.application.config.assets.precompile += %w( js/jquery.gritter.js )
Rails.application.config.assets.precompile += %w( css/jquery.gritter.css )
# dual select
Rails.application.config.assets.precompile += %w( js/picklist.js )
Rails.application.config.assets.precompile += %w( css/picklist.css )



