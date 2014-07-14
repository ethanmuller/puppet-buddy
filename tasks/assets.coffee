module.exports = (gulp, cfg, env) ->
  gulp.task 'assets', ['clean'], ->
    gulp.src(cfg.paths.assets + "**/*", base: './')
    .pipe gulp.dest(cfg.paths.dest)
