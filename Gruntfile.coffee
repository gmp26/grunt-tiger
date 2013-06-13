#
# * grunt-tiger
# * https://github.com/gmp26/grunt-tiger
# *
# * Copyright (c) 2013 Mike Pearson
# * Licensed under the MIT license.
# 
"use strict"
module.exports = (grunt) ->
  
  # Project configuration.
  grunt.initConfig
    jshint:
      all: ["Gruntfile.js", "tasks/*.js", "<%= nodeunit.tests %>"]
      options:
        jshintrc: ".jshintrc"

    
    # Before generating any new files, remove any previously-created files.
    clean:
      tests: ["tmp"]

    
    # Configuration to be run (and then tested).
    tiger:
      default_options:
        options: {}
        files:
          "tmp/default_options": ["test/fixtures/testing", "test/fixtures/123"]

      custom_options:
        options:
          separator: ": "
          punctuation: " !!!"

        files:
          "tmp/custom_options": ["test/fixtures/testing", "test/fixtures/123"]

    # Compile coffee
    livescript:
      compile:
        options:
          bare: false
          prelude: true
        files:
          'tasks/tiger.js': 'tasks/tiger.ls'
          'test/tiger_test.js': 'test/tiger_test.ls'

    
    # Unit tests.
    nodeunit:
      tests: ["test/*_test.js"]

  
  # Actually load this plugin's task(s).
  grunt.loadTasks "tasks"
  
  # These plugins provide necessary tasks.
  grunt.loadNpmTasks "grunt-contrib-jshint"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-nodeunit"
  grunt.loadNpmTasks "grunt-livescript"
  
  # Whenever the "test" task is run, first clean the "tmp" dir, then run this
  # plugin's task(s), then test the result.
  grunt.registerTask "test", ["clean", "tiger", "nodeunit"]
  
  # By default, lint and run all tests.
  grunt.registerTask "default", ["livescript", "test"]