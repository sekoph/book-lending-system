# Book Lending System
This is a Ruby on Rails application for managing book lending and user management.

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
  - Default: SQLite (config/database.yml)

## Installation Steps
1. **Clone the repository:**
   ```sh
   git clone https://github.com/sekoph/book-lending-system.git
   cd book-lending-system
   ```

2. **Install dependencies:**
   ```sh
   bundle install
   ```

3. **Set up the database:**
   ```sh
   rails db:migrate
   ```

4. **Run the application:**
   ```sh
   rails s
   ```
   The application should now be running at **http://localhost:3000**.
   To login as user, Credentials:
   - Email: user@gmail.com
   - Password: user
  Or you can register as a new user.

  To Add a new book, click on the "Admin Dashboard" button on the login or signup page.



### Running Tests For models
To run tests:
```sh
rspec  spec/models
```

## Troubleshooting
If you encounter issues, try:
```sh
bundle update
rails tmp:cache:clear
rails restart
```

## License
This project is licensed under the MIT License.
