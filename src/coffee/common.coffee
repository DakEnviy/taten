# Requires
PeerServer = require('peer').PeerServer

# Classes
server = PeerServer({port: 9000, path: '/taten'})

# Methods
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



# Main Code
peer = new Peer "2",
	"host": "localhost"
	"port": 9000
	"path": "/taten"
	"config":
		"iceServers": [
			{url:'stun:stun01.sipphone.com'},
			{url:'stun:stun.ekiga.net'},
			{url:'stun:stun.fwdnet.net'},
			{url:'stun:stun.ideasip.com'},
			{url:'stun:stun.iptel.org'},
			{url:'stun:stun.rixtelecom.se'},
			{url:'stun:stun.schlund.de'},
			{url:'stun:stun.l.google.com:19302'},
			{url:'stun:stun1.l.google.com:19302'},
			{url:'stun:stun2.l.google.com:19302'},
			{url:'stun:stun3.l.google.com:19302'},
			{url:'stun:stun4.l.google.com:19302'},
			{url:'stun:stunserver.org'},
			{url:'stun:stun.softjoys.com'},
			{url:'stun:stun.voiparound.com'},
			{url:'stun:stun.voipbuster.com'},
			{url:'stun:stun.voipstunt.com'},
			{url:'stun:stun.voxgratia.org'},
			{url:'stun:stun.xten.com'},
			{
				url: 'turn:numb.viagenie.ca',
				credential: 'muazkh',
				username: 'webrtc@live.com'
			},
			{
				url: 'turn:192.158.29.39:3478?transport=udp',
				credential: 'JZEOEt2V3Qb0y27GRntt2u2PAYA=',
				username: '28224511:1379330808'
			},
			{
				url: 'turn:192.158.29.39:3478?transport=tcp',
				credential: 'JZEOEt2V3Qb0y27GRntt2u2PAYA=',
				username: '28224511:1379330808'
			}
		]

peer.on "open", (id) ->
	console.log "Connecting to the server with id: #{id}"

	if id != 1
		getUserMedia (err, stream) ->
			return console.log err if err

			call = peer.call "1", stream

			call.on "stream", (cStream) ->
				console.log "test"
				$("video").attr "src", URL.createObjectURL cStream
			call.on "error", (err) ->
				console.log err

peer.on "call", (call) ->
	console.log "connect"

	getUserMedia (err, stream) ->
		return console.log err if err
		call.answer stream
	call.on "stream", (cStream) ->
		$("video").attr "src", URL.createObjectURL cStream
	call.on "error", (err) ->
		console.log err

peer.on "error", (err) ->
	console.log err
