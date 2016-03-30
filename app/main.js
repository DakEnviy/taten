var BrowserWindow, app, electron, mainWindow;

electron = require('electron');

app = electron.app;

BrowserWindow = electron.BrowserWindow;

mainWindow = null;

app.on("ready", function() {
  mainWindow = new BrowserWindow({
    "width": 800,
    "height": 600,
    "icon": "app/resources/icon.png"
  });
  mainWindow.loadURL("file://" + __dirname + "/index.html");
});
