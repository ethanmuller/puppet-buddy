module.exports = (gulp, paths, env) ->

  gulp.task "watch", ->
    # gulp.watch(paths.scripts, ['scripts']);
    scriptWatcher = gulp.watch(paths.scripts, ["scripts"])
