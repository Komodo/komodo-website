module.exports = function(grunt) {
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-copy');
  
  var gruntConfig = require('./grunt-config.json');
  grunt.initConfig(gruntConfig);

  grunt.registerTask('static', Object.keys(gruntConfig));
  grunt.registerTask('dev-static', Object.keys(gruntConfig));
  grunt.registerTask('qa', Object.keys(gruntConfig));
  grunt.registerTask('development', 'copy');
};
