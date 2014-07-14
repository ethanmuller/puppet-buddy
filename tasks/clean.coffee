module.exports = (gulp, cfg, env) ->
  del = require "del"

  gulp.task "clean", (callback) ->
    del cfg.paths.dest, callback
