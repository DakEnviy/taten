getUserMedia = (callback) ->
	browserUserMedia = navigator.getUserMedia ||
											navigator.webkitGetUserMedia ||
											navigator.mozGetUserMedia ||
											navigator.msGetUserMedia
	return callback "Your browser doesn`t support WebRTC" if not browserUserMedia

	browserUserMedia.bind(navigator)
		"audio": true
		"video": true
		(stream) ->
			callback null, stream
		(err) ->
			callback err

getUserMedia (err, stream) ->
	return console.log err if err

	$("video").attr "src", URL.createObjectURL stream
