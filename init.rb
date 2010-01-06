ActionView::Base.send :include, FacebookDistanceOfTimeInWords::FacebookDistanceOfTimeInWordsHelpers
I18n.load_path += Dir[File.join(File.dirname(__FILE__), 'locales', '*.{rb,yml}')]
I18n.reload!