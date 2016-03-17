# FLIPPBOOK


## INSTALLATION

##### We use ruby 2.2.0, and gemset named flipp_book
##### If you don't have ruby-2.2.0
```
rvm install ruby-2.2.0
```

##### Use .ruby-version to maintain version + gemset
```
echo ruby-2.2.0@flipp_book > .ruby-version
rvm gemset create flipp_book
gem install bundler
bundle install
```

##### If you want to use the default db:config
```
cp config/database.yml.template config/database.yml
mysqladmin -u <username> create flipp_book_development
rake db:migrate
```

##### Setup web assets (npm, webpack, react)
```
cd web/
sudo npm install
```

##### npm scripts
```
npm run release # Compile release assets
npm run dev     # Compile dev assets
npm run watch   # Watch source files and compile on change
```