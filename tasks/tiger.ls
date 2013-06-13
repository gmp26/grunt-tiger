#
# * grunt-tiger
# * https://github.com/gmp26/grunt-tiger
# *
# * Copyright (c) 2013 Mike Pearson
# * Licensed under the MIT license.
# 
"use strict"
module.exports = (grunt) ->
  
  # Please see the Grunt documentation for more information regarding task
  # creation: http://gruntjs.com/creating-tasks
  grunt.registerMultiTask "tiger", "Your task description goes here.", ->
    
    # Merge task-specific and/or target-specific options with these defaults.
    options = @options(
      punctuation: "."
      separator: ", "
    )
    
    # Iterate over all specified file groups.
    @files.forEach (f) ->
      
      # Concat specified files.
      
      # Warn on and remove invalid source files (if nonull was set).
      
      # Read file source.
      src = f.src.filter((filepath) ->
        unless grunt.file.exists(filepath)
          grunt.log.warn "Source file \"" + filepath + "\" not found."
          false
        else
          true
      ).map((filepath) ->
        grunt.file.read filepath
      ).join(grunt.util.normalizelf(options.separator))
      
      # Handle options.
      src += options.punctuation
      
      # Write the destination file.
      grunt.file.write f.dest, src
      
      # Print a success message.
      grunt.log.writeln "File \"" + f.dest + "\" created."

