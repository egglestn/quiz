Ckeditor.setup do |config|
  config.assets_languages = ['en']
  config.assets_plugins = []
  Rails.application.config.assets.paths += %w( ckeditor/config.js )
  Rails.application.config.assets.precompile += %w( ckeditor/* )
end
