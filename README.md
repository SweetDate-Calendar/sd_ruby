# SweetDate Ruby Environment

This repository contains two Ruby projects:

1. **`sweet_date/`** – A Ruby gem that communicates with the SweetDate TCP server (`sd_engine`) over a custom protocol.
2. **`paddle/`** – A full-featured Rails app for testing and demonstrating the integration with `sweet_date`.

---

## 📦 Project Structure
```
├── sweet_date/     # Ruby gem
└── paddle/         # Rails app using the sweet_date gem
```
---

## Prerequisites

- Ruby (via [`mise`](https://mise.jdx.dev) recommended)
- Rails 8
- PostgreSQL (Rails app requires a DB)
- A running instance of the Elixir TCP server: [`sd_engine`](https://github.com/SweetDate-Calendar/sd_engine)  
  - Must be running and accessible on `localhost` and the expected TCP port (default: `5050`)

---

## Getting Started 

#### paddle
SweetDate is added to the GEMFILE
```
cd paddle
bundle install
bin/rails db:create 
db:migrate
bin/rails c

SweetDate.ping => "pong"
```

#### SweetDate
1. Restart Rails server after changes
2. sd_engine should be running