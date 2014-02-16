source 'https://rubygems.org'

ruby '1.9.3', :engine => 'jruby', :engine_version => '1.7.5'
#gem 'therubyracer'
#gem 'execjs'
gem 'jruby-openssl'
#gem 'libv8', '3.16.14.3'
gem 'rails', '4.0.0'
gem 'activerecord-jdbcpostgresql-adapter', platform: :jruby
#gem 'pg'
#gem 'mysql2'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
                              :github => 'anjlab/bootstrap-rails'
gem 'puma'

gem 'jquery-rails'
gem 'turbolinks'

gem 'jbuilder', '~> 1.2'

gem 'twitter', "~> 5.0.0.rc.1"

gem 'lazy_high_charts'

group :assets do
  gem 'therubyrhino'
end

group :doc do
  gem 'sdoc', require: false
end

group :production do
  gem 'rails_12factor', '0.0.2'
end