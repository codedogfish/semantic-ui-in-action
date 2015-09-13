gulp = require 'gulp'
browserSync = require 'browser-sync'
$ = require 'gulp-load-plugins'
y = {
    j:->
        console.log 'yj'
}

gulp.task 'default',->
    target = gulp.src './src/index.html'
    sources = gulp.src ['./dist/**/*.js','./dist/**/*.css'],{read:false}
    target.pipe gulp.dest './dist'
        #.pipe $.inject sources,{relative:true}
        #.pipe gulp.dest './dist'

gulp.task 'serve',['default'],->
    browserSync
        server:
            baseDir:'./dist'
            routes:
                '/bower_components':'bower_components'
    gulp.watch './src/**/*.*',['watch']
    # gulp.watch './src/**/*.*',['build']
    #gulp.watch './dist/**/*.*'
    #.on 'change',browserSync.reload

gulp.task 'build',->
    target = gulp.src './src/index.html'
    sources = gulp.src ['./dist/**/*.js','./dist/**/*.css'],{read:false}
    target.pipe gulp.dest './dist'
    #browserSync.reload

gulp.task 'watch',['build'],browserSync.reload

    
