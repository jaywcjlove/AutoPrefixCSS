module.exports = (grunt) ->
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-stylus'
    grunt.initConfig(
        pkg: grunt.file.readJSON 'package.json' 
        # uglify:
        #     app_task: 
        #         options: 
        #             beautify: false
        #             mangle: true #不混淆变量名
        #             compress:false #打开或关闭使用默认选项源压缩。
        #         files:
        #             'build/websocket.min.js': [
        #                 'lib/websocket.js'
        #             ]
        stylus:
            build: 
                options: 
                    linenos: false
                    compress: false
                    # banner: '\/** \n * <%= pkg.name %> - <%= pkg.description %>\n * version <%= pkg.version %> \n * author <%= pkg.author %>  \n**/\n'
                    # //<%= grunt.template.today() %>时间
                files:
                    'test/example.css': 'test/example.styl'
        watch: 
            another: 
                files: ['lib/*.styl','test/*.styl']
                tasks: ['stylus']
                options: 
                    livereload: 1244
    )
    grunt.registerTask 'default', ['watch']
