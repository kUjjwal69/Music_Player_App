import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/songs.dart';

class PlaylistProvider extends ChangeNotifier{

  // playlist of songs
  final List<Song> _playlist = [
    // song 1
  Song(
    songName: "Happier"
  , artistName: "Marshmello ft. Bastille ", 
  albumArtImagePath: "assets/Images/Happier song Image.jpg", 
  audioPath: "assets/Songs/Happier(PaglaSongs).mp3"
  ),


    // song 2

Song(
    songName: "Infinity - James Young"
  , artistName: "James Young", 
  albumArtImagePath: "assets/Images/images.webp", 
  audioPath: "assets/Songs/Infinity - Jaymes Young-(DJMaza).mp3"
  ),


    // song 3
    Song(
    songName: "Radio"
  , artistName: "Lana Del Ray", 
  albumArtImagePath: "assets/Images/2.webp", 
  audioPath: "assets/Songs/Lana-Del-Rey-Radio-(Gospeljingle.com).mp3"
  ),

  ];

  // Current Song Playing Index

  int? _currentSongIndex;
  /*

  A U D I O P L A Y E R S
  */

// audio players

final AudioPlayer _audioPlayer = AudioPlayer();



// durations

Duration _currentSongDuration = Duration.zero;
Duration _totalDuration = Duration.zero;


// constructor


PlaylistProvider(){
  listenToDuration();
}

// initially not playing
 bool  _isPlaying = false;


// play the song

void play() async{
  final String path = _playlist[_currentSongIndex!].audioPath;
  await _audioPlayer.stop();
  await _audioPlayer.play(AssetSource(path)); // play the new song
  _isPlaying = true;
  notifyListeners();
}

// pause current song
void pause() async{
  await _audioPlayer.pause();
  _isPlaying = false;
  notifyListeners();
}


// resume playing

void resume() async{
  await _audioPlayer.resume();
  _isPlaying = true;
  notifyListeners();
}


// pause or resume
void pauseOrResume() {
  if(_isPlaying){
    pause();
  }
  else{
    resume();
  }
  notifyListeners();
}


// seek to specific position in current song
void seek(Duration position) async{
  await _audioPlayer.seek(position);
}



// play next song
void playNextSong(){
  if(_currentSongIndex != null){
    if(_currentSongIndex! <_playlist.length-1){
      // go to the next song if it's not the last song
  currentSongIndex = _currentSongIndex! + 1;

    }
    else{
      // if it's the last song loop back to the first song
      currentSongIndex = 0;
    }
  }
}


// play previous song

 void playPreviousSong() async{

  // if more than 2 seconds have passed, restart the current song
  if(_currentSongDuration.inSeconds > 2){

  }
  else{
  // if it's within first 2 seconds of the song, go to the previous song
  if(_currentSongIndex!>0){
    currentSongIndex = _currentSongIndex!-1;
  }
  else{
    // if it's the first song, loop back to the last song
    currentSongIndex = _playlist.length-1;
  }
  }
}


// listen to duration

void listenToDuration() {

  // listen for total duration
_audioPlayer.onDurationChanged.listen((newDuration) {
  _totalDuration = newDuration;
  notifyListeners();

});


  // listen for current duration

  _audioPlayer.onPositionChanged.listen((newPosition) {

  _currentSongDuration = newPosition;   
  notifyListeners(); 

   });


  // listen for song completion
  _audioPlayer.onPlayerComplete.listen((event) {
    playNextSong();
  });

}


// dispose auido players


  


  /*
  G E T T E R S
  */

List<Song> get playlist => _playlist;
int? get currentSongIndex => _currentSongIndex;
bool get isPlaying => _isPlaying;
Duration get currentSongDuration => _currentSongDuration;
Duration get totalDuration => _totalDuration;

 /*
  S E T T E R S
  */



set currentSongIndex(int  ?newIndex){


  // update current song index

  _currentSongIndex = newIndex;
  if(newIndex != null){
    play(); // play the song at the new index
  }

  // update UI
  notifyListeners();
}
}