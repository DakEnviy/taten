browserUserMedia = navigator.getUserMedia ||
										navigator.webkitGetUserMedia ||
										navigator.mozGetUserMedia ||
										navigator.msGetUserMedia
if not browserUserMedia
	throw "Your browser doesn`t support WebRTC"

getUserMedia = browserUserMedia.bind navigator

getUserMedia
	"audio": true
	"video": true,
	(stream) ->
		console.log stream

		document.getElementById("test").src = URL.createObjectURL stream
	(err) ->
		console.log err
