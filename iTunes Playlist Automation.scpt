JsOsaDAS1.001.00bplist00�Vscript_�playlist = 'Good Songs'

currentApp = Application.currentApplication()
currentApp.includeStandardAdditions = true

iTunes = Application('iTunes')
state = iTunes.playerState()

if (state == 'playing') {
	track = iTunes.currentTrack.name()
	artist = iTunes.currentTrack.artist()	
	action = currentApp.displayAlert('iTunes Playback Options', {
		buttons: ['Playlist','Pause','Cancel'],
		message: 'There is currently ' + calculatePlayerPosition() + ' left in \'' + track + '\' by ' + artist,
		defaultButton: 1,
		cancelButton: 3
	})
} else if (state == 'paused') {
	track = iTunes.currentTrack.name()
	artist = iTunes.currentTrack.artist()
	action = currentApp.displayAlert('Play music in iTunes?', {
		buttons: ['Playlist','Play','Cancel'],
		message: 'Currently \'' + track + '\' by ' + artist + ' is paused with ' + calculatePlayerPosition() + ' remaining',
		defaultButton: 1,
		cancelButton: 3
	})
} else {
	action = currentApp.displayAlert('Play music in iTunes?', {
		buttons: ['Playlist','Cancel'],
		message: 'Currently nothing is playing.',
		defaultButton: 1,
		cancelButton: 2
	})		
}

if (action.buttonReturned != 'Cancel') {
	if (action.buttonReturned == 'Playlist') {
		iTunes.playlists[playlist].play() // Play the playlist defined on line 1.
	} else {
		iTunes.playpause()
	}
}

function calculatePlayerPosition() {
	playerPosition = iTunes.playerPosition()
	duration = iTunes.currentTrack.duration()
	secRemainder = (duration - playerPosition)
	minRemainder = Math.floor(secRemainder/60)
	secRemainder = Math.round(Math.abs(secRemainder) % 60)
	remainder = minRemainder + ":" + (secRemainder < 10 ? "0" + secRemainder : secRemainder)
	return remainder
}                              � jscr  ��ޭ