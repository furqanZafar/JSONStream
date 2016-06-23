require! \browserify
require! \gulp
require! \gulp-streamify
require! \gulp-uglify
source = require \vinyl-source-stream

gulp.task \dist, ->
    browserify standalone: \JSONStream, debug: false
        .add <[./index.js]>
        .exclude \jsonparse
        .exclude \through
        .bundle!
        .pipe source \index.min.js
        .pipe (gulp-streamify gulp-uglify!)
        .pipe gulp.dest \./dist