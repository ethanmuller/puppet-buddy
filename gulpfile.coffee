gulp = require "gulp"
_ = require "lodash"
runSequence = require "run-sequence"
requireDir = require "require-dir"

config = require "./config.coffee"

# Load all tasks
tasks = requireDir "tasks/"

# Get environment, for environment-specific activities
env = process.env.NODE_ENV or "development"

# Loop through all tasks and create them
_.each tasks, (task) ->
  task(gulp, config, env)

# "default" and "build" will be your most commonly-run tasks from the CLI.
# All the more granular tasks are in "tasks/"

gulp.task "build", (callback) ->
  runSequence(
    'clean'
    'assets'
    [
      'scripts'
      'bower-files'
    ]
    callback
  )

gulp.task "default", (callback) ->
  runSequence ['watch', 'build']
