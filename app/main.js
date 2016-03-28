var BrowserWindow, app, electron;

electron = require('electron');

app = electron.app;

BrowserWindow = electron.BrowserWindow;

app.on("ready", function() {
  var mainWindow;
  mainWindow = new BrowserWindow({
    "width": 800,
    "height": 600
  });
  return mainWindow.loadURL("file://" + __dirname + "/index.html");
});
