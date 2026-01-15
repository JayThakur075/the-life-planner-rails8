# The Life Planner (Rails 8)

A modern, full-stack task planning application built with **Rails 8**.
This project demonstrates a production-ready Rails 8 setup with built-in features like authentication, asset handling, caching, real-time updates, background jobs, and containerized development using Docker & Kamal.

## Overview

The Life Planner is designed as a simple yet extendable productivity app. Users can manage life tasks and plans in an intuitive interface powered by Rails 8 conventions.

## Key Features

### Rails 8 Core Enhancements
- **Rails 8**: Uses the latest Rails version with improved defaults and performance.
- **In-built Authentication**: Leverages Rails 8 authentication system for managing users.
- **Propshaft for Assets**: Modern asset pipeline replacing Sprockets to handle JS, CSS, images, and other static assets.
- **Solid Cache**: Efficient caching strategy built into Rails 8 to speed up views and queries.
- **Action Cable**: Real-time WebSocket support for live features or notifications.
- **Active Job + Queue**: Asynchronous background jobs for heavier tasks (configured with default queue adapter).

### Development & Deployment
- **Docker Support**: Easily spin up the development environment with Docker.
- **Kamal Gem**: Deployment tool integrated for scalable deployments (includes tasks for legit server setup).

## Getting Started

### Prerequisites
Make sure you have the following installed before running locally:

- Docker & Docker Compose
- Ruby (if not using Docker)
- Node.js & Yarn (if not using Docker)

### Clone the Repo
```bash
git clone https://github.com/JayThakur075/the-life-planner-rails8.git
cd the-life-planner-rails8
````

### Using Docker (Recommended)

Build and start the containers:

```bash
docker compose build
docker compose up
```

This will start the application with the database and Rails server. Visit `http://localhost:3000`.

### Without Docker

1. Install Ruby dependencies:

   ```bash
   bundle install
   ```
2. Setup Database:

   ```bash
   rails db:create db:migrate
   ```
3. Start the Rails server:

   ```bash
   bin/dev
   ```

## Running Tests

This project includes basic test setup. To run the test suite:

```bash
rails test
```

## Environment & Config

Configuration files are located in the `config/` directory. Adjust credentials and environment settings as needed for your local or production setup.

## Deployment

This project includes setup for deployments using **Kamal**. Follow the instructions in the `.kamal` directory to deploy to your preferred hosting provider.