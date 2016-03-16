source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# Mysql
gem "mysql2", "~> 0.3.18"

# SSO
gem 'rack-cas', :git => "https://github.com/moshegood/rack-cas"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Way better exception screen for debugging
  gem "better_errors"

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :staging, :production do
  gem "unicorn", "~> 4.1.0"
end
