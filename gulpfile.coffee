gulp = require "gulp"
_ = require "lodash"
requireDir = require "require-dir"

# Load all tasks
tasks = requireDir "./tasks"

# Get environmet
env = process.env.NODE_ENV or "development"

# Set up commonly-used paths
paths =
  dest: "build/"
  lib: "build/lib/"
  scripts: ["src/coffee/**/*.coffee"]
  assets: "assets/"

# Initialize tall task files
_.each tasks, (task) ->
  task(gulp, paths, env)

gulp.task "default", [
  "clean"
  "assets"
  "scripts"
  "bower-files"
]
