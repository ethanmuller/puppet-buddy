module.exports = (gulp, paths, env) ->
  del = require "del"

  gulp.task "clean", (callback) ->
    del paths.dest, callback
