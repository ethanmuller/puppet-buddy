var gulp = require('gulp');

var requireDir = require('require-dir'),
  dir = requireDir('./tasks');

var changed = require('gulp-changed'),
  uglify = require('gulp-uglify'),
  coffee = require('gulp-coffee'),
  concat = require('gulp-concat'),
  sourcemaps = require('gulp-sourcemaps'),
  del = require('del'),
  bowerFiles = require('main-bower-files'),
  gulpif = require('gulp-if');

var env = process.env.NODE_ENV || 'development';

var paths = {
  dest: 'build/',
  lib: 'build/lib',
  scripts: ['src/coffee/**/*.coffee']
};

gulp.task('clean', function(callback) {
  del(paths.dest, callback);
});

gulp.task("bower-files", ['clean'], function(){
  return gulp.src(bowerFiles())
    .pipe(changed(paths.lib))
    .pipe(concat('vendor.js'))
    .pipe(gulpif(env === 'production', uglify()))
    .pipe(gulp.dest(paths.lib));
});

gulp.task('scripts', ['clean'], function() {
  // Minify and copy all JavaScript (except vendor scripts)
  // with sourcemaps all the way down

  var out = paths.dest + 'js';

  return gulp.src(paths.scripts)
    .pipe(changed(out))
    .pipe(sourcemaps.init())
      .pipe(coffee())
      .pipe(gulpif(env === 'production', uglify()))
      .pipe(concat('all.min.js'))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(out));
});

gulp.task('watch', function(){
  // gulp.watch(paths.scripts, ['scripts']);
  var scriptWatcher = gulp.watch(paths.scripts, ['scripts']);

});

gulp.task('assets', ['clean'], function() {
  gulp.src('assets/**/*', { base: './' })
  .pipe(gulp.dest('build/'));
});

gulp.task('default', ['clean', 'assets', 'scripts', 'bower-files']);
