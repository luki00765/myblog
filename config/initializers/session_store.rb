# Be sure to restart your server when you modify this file.

#Rails.application.config.session_store :cookie_store, key: '_myblog_session', domain: :all
Rails.application.config.session_store :cookie_store, key: '_myblog_session', :httponly => true
