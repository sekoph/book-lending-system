# Rails 8 Application Setup

## Prerequisites
Before running the application, ensure you have the following installed:

- **Ruby** (Recommended: 3.2 or later) – Check version:
  ```sh
  ruby -v
  ```
- **Rails 8** – Check version:
  ```sh
  rails -v
  ```
- **Bundler** – Install or check version:
  ```sh
  gem install bundler
  bundler -v
  ```
- **Node.js & Yarn** (For JavaScript dependencies)
  ```sh
  node -v  # Check Node.js version
  yarn -v  # Check Yarn version
  ```
- **Database** (PostgreSQL, MySQL, or SQLite depending on your app setup)
  ```sh
  psql --version  # PostgreSQL
  mysql --version # MySQL
  ```

## Installation Steps
1. **Clone the repository:**
   ```sh
   git clone <your-repository-url>
   cd <your-project-name>
   ```

2. **Install dependencies:**
   ```sh
   bundle install
   yarn install  # If using Yarn for JS dependencies
   ```

3. **Set up the database:**
   ```sh
   rails db:create
   rails db:migrate
   rails db:seed # (Optional: If you have seed data)
   ```

4. **Run the application:**
   ```sh
   rails s
   ```
   The application should now be running at **http://localhost:3000**.

## Additional Setup
### TailwindCSS (If Installed)
If using TailwindCSS, ensure it’s correctly installed:
```sh
rails tailwindcss:build
```

### Running Background Jobs (If Using Sidekiq)
```sh
bundle exec sidekiq
```

### Running Tests
To run tests:
```sh
rails test  # For Minitest
rspec      # For RSpec
```

### Linting & Code Quality
```sh
rubocop
```

## Deployment
For production deployment:
```sh
RAILS_ENV=production rails assets:precompile
RAILS_ENV=production rails db:migrate
```

## Troubleshooting
If you encounter issues, try:
```sh
bundle update
rails tmp:cache:clear
rails restart
```

For logs:
```sh
tail -f log/development.log
```

## Contributing
- Fork the repo
- Create a new branch (`git checkout -b feature-branch`)
- Make changes and commit (`git commit -m "Your message"`)
- Push changes (`git push origin feature-branch`)
- Open a pull request

## License
This project is licensed under the MIT License.
