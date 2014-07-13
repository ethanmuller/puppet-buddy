module.exports = function(gulp, paths) {
  gulp.task('assets', ['clean'], function() {
    gulp.src(paths.assets + '**/*', { base: './' })
    .pipe(gulp.dest('build/'));
  });
};


