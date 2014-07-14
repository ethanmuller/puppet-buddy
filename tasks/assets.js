module.exports = function(gulp, cfg, env) {
  gulp.task('assets', ['clean'], function() {
    gulp.src(cfg.paths.assets + '**/*', { base: './' })
    .pipe(gulp.dest('build/'));
  });
};


