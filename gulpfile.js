var gulp = require('gulp');
var gutil = require('gulp-util');

var changed = require('gulp-changed');
var uglify = require('gulp-uglify');
var coffee = require('gulp-coffee');
var concat = require('gulp-concat');
var bower = require('gulp-bower');
var sourcemaps = require('gulp-sourcemaps');
var del = require('del');

var paths = {
  dest: 'build/',
  scripts: ['src/coffee/**/*.coffee']
};

var assets = [
  'assets/**/*'
];

gulp.task('clean', function(callback) {
  del(paths.dest, callback);
});

gulp.task('bower', function() {
  return bower('./my_bower_components')
    .pipe(gulp.dest('lib/'));
});

gulp.task('assets', function() {
  gulp.src(assets, { base: './' })
  .pipe(gulp.dest(paths.dest));
});

gulp.task('scripts', function() {
  // Minify and copy all JavaScript (except vendor scripts)
  // with sourcemaps all the way down
  return gulp.src(paths.scripts)
    .pipe(sourcemaps.init())
      .pipe(coffee())
      .pipe(uglify())
      .pipe(concat('all.min.js'))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(paths.dest + 'js'));
});

gulp.task('watch', function(){
  // gulp.watch(paths.scripts, ['scripts']);
  var scriptWatcher = gulp.watch(paths.scripts, ['scripts']);

});

gulp.task('default', ['clean', 'scripts']);
