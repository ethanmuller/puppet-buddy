module.exports = (gulp, paths, env) ->
  coffee = require "gulp-coffee"
  concat = require "gulp-concat"
  uglify = require "gulp-uglify"
  sourcemaps = require "gulp-sourcemaps"
  gulpif = require "gulp-if"

  gulp.task "scripts", ["clean"], ->
    # Minify and copy all JavaScript (except vendor scripts)
    # with sourcemaps all the way down
    out = paths.dest + "js"
    gulp.src(paths.scripts)
      .pipe(sourcemaps.init())
      .pipe(coffee())
      .pipe(gulpif(env is "production", uglify()))
      .pipe(concat("all.js"))
      .pipe(sourcemaps.write())
      .pipe(gulp.dest(out))
