playlist-automation
===================
Given the title of a playlist that exists in your iTunes,the script will use iTunes'
built in JXA methods to automatically play that playlist. The script does not specify
shuffling, so it will play with whatever setting you had it set up for last. In other
words, if you aren't a shuffler like I am, you can still make use of this script too,
if it interests you.

When the script is run, the first thing it does is identify the current player state
of iTunes, which will either be “stopped”, “playing”, “paused”, “fast forwarding”, or
“rewinding”. I can't imagine why I would run the script when iTunes is in a state of
fast forwarding or rewinding, so I do not account for these options. Rather, if
iTunes' state is playing, the script will throw up an alert which displays the title
and artist of the current song along with the time remaining, and gives options to
pause the song, restart the playlist (if you have shuffle turned on, this will reshuffle
the entire playlist), or cancel and do nothing. If the state is paused, I get the same
alert except the pause option is swapped for a play button and the message is tweaked
to tell me the song is paused. If the state is stopped, the alert message tells me
nothing is playing and gives only two options: play my playlist or cancel.

For more info regarding the code itself, check out my [post on MacStories](http://www.macstories.net/tutorials/getting-started-with-javascript-for-automation-on-yosemite/).
