module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    src:
      file: 'arrayext'

    resources:
      src: ['src/<%= src.file %>.coffee']
      test: ['test/*.coffee']
      banner: '/* <%= pkg.name %> v<%= pkg.version %> - <%= grunt.template.today("yyyy/mm/dd") %>\n' +
              '<%= pkg.description %> - <%= pkg.homepage %>\n' +
              'Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>(<%= pkg.author.nickname %>)' +
              ' - Under <%= pkg.license %> License */\n'

    coffee:
      src:
        files:
          'src/<%= src.file %>.js': '<%= resources.src %>'
          'test/<%= src.file %>.js': '<%= resources.test %>'

    uglify:
      options:
        compress: false
        banner: '<%= resources.banner %>'
      package:
        files: 'package/<%=src.file%>.js': 'src/<%= src.file %>.js'

    jasmine:
        pivotal:
          src: 'package/<%= src.file %>.js'
          options:
            specs: 'test/<%= src.file %>.js',

    watch:
      src:
        files: ['<%= resources.src %>', '<%= resources.test %>']
        tasks: ['coffee', 'uglify', 'jasmine']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'

  grunt.registerTask 'default', ['coffee', 'uglify', 'jasmine']
