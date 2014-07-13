module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    connect:
      server:
        options:
          base: 'build/'

    watch:
      scripts:
        files: 'src/coffee/*.coffee'
        tasks: 'js'
      assets:
        files: 'assets/**/*'
        tasks: 'assets'

    coffee:
      build:
        src: 'src/coffee/*.coffee'
        dest: 'build/<%= pkg.name %>.js'

    copy:
      assets:
        expand: true
        cwd: 'assets'
        src: '**/*'
        dest: 'build/'

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-connect')

  grunt.registerTask('js', ['coffee'])
  grunt.registerTask('assets', ['copy'])

  grunt.registerTask('server', ['connect', 'watch'])

  grunt.registerTask('default', ['js', 'html'])
