module.exports = (gulp, cfg, env) ->

  gulp.task 'watch', ->
    gulp.watch(cfg.paths.assets + '**/*', ['build'])
    gulp.watch(cfg.paths.scriptsIn + '**/*.coffee', ['scripts'])
    gulp.watch(cfg.paths.vendorIn + '**/*', ['bower-files'])
