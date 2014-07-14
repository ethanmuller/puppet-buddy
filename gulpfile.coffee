gulp = require "gulp"
_ = require "lodash"
requireDir = require "require-dir"

config = require "./config.coffee"

# Load all tasks
tasks = requireDir "tasks/"

# Get environment, for environment-specific activities
env = process.env.NODE_ENV or "development"

# Loop through all tasks and create them
_.each tasks, (task) ->
  task(gulp, config, env)

# Here's the default task.
# All other tasks are in 'tasks/'
gulp.task "default", [
  "clean"
  "assets"
  "scripts"
  "bower-files"
]
