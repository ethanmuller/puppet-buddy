module.exports = (gulp, cfg, env) ->

  gulp.task "watch", ->
    # gulp.watch(paths.scripts, ['scripts']);
    scriptWatcher = gulp.watch(cfg.paths.scripts, ["scripts"])
