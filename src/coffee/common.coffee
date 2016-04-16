initUserMedia = (callback) ->
	browserUserMedia = navigator.getUserMedia ||
											navigator.webkitGetUserMedia ||
											navigator.mozGetUserMedia ||
											navigator.msGetUserMedia
	if not browserUserMedia
		callback "Your browser doesn`t support WebRTC"

	getUserMedia = browserUserMedia.bind navigator
	getUserMedia
		"audio": true
		"video": true
		(stream) ->
			callback null, stream
		(err) ->
			callback err

initUserMedia (err, stream) ->
	
