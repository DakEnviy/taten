"use strict";

var gulp = require('gulp'),
		concat = require('gulp-concat'),
		sass = require('gulp-sass'),
		autoprefixer = require('gulp-autoprefixer'),
		cleanCSS = require('gulp-clean-css'),
		coffee = require('gulp-coffee'),
		uglify = require('gulp-uglify'),
		spritesmith = require('gulp.spritesmith');

gulp.task('styles', function() {
	gulp.src('src/sass/*.sass')
			.pipe(sass({includePaths: require('node-bourbon').includePaths}).on('error', sass.logError))
			.pipe(concat('styles.min.css'))
			.pipe(autoprefixer({browsers: ['last 15 versions'], cascade: false}))
			.pipe(cleanCSS())
			.pipe(gulp.dest('app/'));
});

gulp.task('scripts', function() {
	gulp.src('src/coffee/*.coffee')
			.pipe(coffee())
			.pipe(concat('app.min.js'))
			.pipe(uglify())
			.pipe(gulp.dest('app/'));
	gulp.src('src/main.coffee')
			.pipe(coffee({bare: true}))
			.pipe(gulp.dest('app/'));
});

gulp.task('libs', function() {
	gulp.src([
		'bower_components/peerjs/peer.min.js' // Insert libs in this array
	])
	.pipe(concat('libs.js')).pipe(gulp.dest('app/resources/'));
});

gulp.task('sprites', function() {
	var spriteData = gulp.src('src/sprites/*.png').pipe(spritesmith({
		imgName: 'sprites.png',
		imgPath: 'resources/images/sprites.png',
		cssName: 'sprites.sass'
	}));
	spriteData.img.pipe(gulp.dest('app/resources/images/'));
	spriteData.css.pipe(gulp.dest('src/sass/'));
});

gulp.task('default', ['styles', 'scripts', 'libs', 'sprites']);
