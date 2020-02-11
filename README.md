# OODD Project 2

# Store Management System

## Steps to test the project on heroku instance:

* Login to your Heroku account and create an instance
```
heroku login
heroku create
```

* Push changes to heroku instance
```
git push heroku master

// for specific branch
git push heroku [branch]:master
```

* Migrate the database
```
heroku run rake db:migrate
```

## Steps to run the project locally:

* Install and start postgres
```
brew services start postgresql
```

* Run the following commands to download all the dependencies
```
bundle install
bundle update
yarn install --check-files
rake db:create:all
rake db:migrate
rake db:seed
```

