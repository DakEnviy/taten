electron = require('electron')
app = electron.app
BrowserWindow = electron.BrowserWindow

app.on "ready", ->
	mainWindow = new BrowserWindow
		"width": 800
		"height": 600
		"icon": "app/resources/icon.png"
	mainWindow.loadURL "file://#{__dirname}/index.html"
