module.exports = (gulp, cfg, env) ->
  coffee = require "gulp-coffee"
  concat = require "gulp-concat"
  uglify = require "gulp-uglify"
  sourcemaps = require "gulp-sourcemaps"
  gulpif = require "gulp-if"

  gulp.task "scripts", ['clean-scripts'], ->
    # Minify and copy all JavaScript (except vendor scripts)
    # with sourcemaps all the way down
    out = cfg.paths.dest + "js"
    gulp.src(cfg.paths.scripts + '**/*.coffee')
      .pipe(sourcemaps.init())
      .pipe(coffee())
      .pipe(gulpif(env is "production", uglify()))
      .pipe(concat("all.js"))
      .pipe(sourcemaps.write())
      .pipe(gulp.dest(out))
