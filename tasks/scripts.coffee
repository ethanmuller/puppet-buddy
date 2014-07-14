module.exports = (gulp, cfg, env) ->
  coffee = require "gulp-coffee"
  concat = require "gulp-concat"
  uglify = require "gulp-uglify"
  sourcemaps = require "gulp-sourcemaps"
  gulpif = require "gulp-if"

  gulp.task "scripts", ->
    # Minify and copy all JavaScript (except vendor scripts)
    # with sourcemaps all the way down
    gulp.src(cfg.paths.scriptsIn + '**/*.coffee')
      .pipe(coffee())
      .pipe(concat("all.js"))
      .pipe(gulp.dest(cfg.paths.scriptsOut))
