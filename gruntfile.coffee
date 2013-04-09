module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    src:
      file: 'arrayExt'

    resources:
      src: ['src/<%= src.file %>.coffee']
      test: ['test/*.coffee']

    coffee:
      src:
        files:
          'src/<%= src.file %>.js': '<%= resources.src %>'
          'test/<%= src.file %>.js': '<%= resources.test %>'

    jasmine:
        pivotal:
          src: 'src/<%= src.file %>.js'
          options:
            specs: 'test/<%= src.file %>.js',

    watch:
      src:
        files: ['<%= resources.src %>', '<%= resources.test %>']
        tasks: ['coffee', 'jasmine']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'

  grunt.registerTask 'default', ['coffee', 'jasmine']
