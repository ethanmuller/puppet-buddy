module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    coffee:
      build:
        src: 'src/app.coffee'
        dest: 'build/<%= pkg.name %>.js'

  grunt.loadNpmTasks('grunt-contrib-coffee')

  grunt.registerTask('default', ['coffee'])
