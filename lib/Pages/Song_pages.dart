import 'package:flutter/material.dart';
import 'package:music_player/models/Playlist_Provider.dart';
import 'package:provider/provider.dart';

import '../components/neu_box.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: ((context, value, child) {

// get playlist
final playlist = value.playlist;

// get the current song index
final currentSong = playlist[value.currentSongIndex ?? 0];

      // return Scaffolfd UI
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // app bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            // back button
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back),
          
          ),
          
          
         const  Text("P L A Y L I S T"),
          
            // menu button
          
               IconButton(onPressed: (){}, 
          icon: const Icon(Icons.menu),)
          
          ],
          ),
          const SizedBox(height: 25,),
          
          
              // album artwork
              NeuBox(
                child: Column(
                  children: [
                    // IMAGE
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(currentSong.albumArtImagePath,
                      width: 400,
                      height: 400,),
                      ),

                      // song and artist name
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // song and artist name
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentSong.songName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),),
                                Text(currentSong.artistName),
                              
                            ],
                           ),
                          const Icon(
                            Icons.favorite, 
                            color: Colors.red,
                           )
                        
                            // heart Icons
                          ],
                        ),
                      )
                  ],
                ),
              ),
                 
               const SizedBox(
                height: 25,
               ),
              // song duration progress
          
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child:   Column(
            children: [
            const  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // start time
                  Text("0.00"),
              
                    // shuffle icon
                  Icon(Icons.shuffle),
              
                    // repeat icon
                  Icon(Icons.repeat),
              
                    // end time
              Text("0.00"),
              
                  ],
                ),
                // Song duration progress
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: 
                   const RoundSliderThumbShape(
                      enabledThumbRadius: 0,
                    ),
                  ),
                  child: Slider(
                    min: 0,
                    max: value.totalDuration.inSeconds.toDouble(),
                    value: value.currentSongDuration.inSeconds.toDouble(),
                    activeColor: Colors.green,
                   onChanged: (double double) {

                   },
                   onChangeEnd: (double double) {
                     value.seek(Duration(seconds: double.toInt()));
                   },
                   ),
                ),
            ],
          ),
          
        ),
          
         const SizedBox(height: 10,),
          
              // playback control
          
          Row(
            children: [
                // skip previous

            Expanded(
              child: GestureDetector(
                onTap: (){
                  value.playPreviousSong();
                },
                child: NeuBox(
                  child: Icon(Icons.skip_previous),
                ),
              ),
            ),

            const SizedBox(width: 20,),

                // play pause

            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: (){
                  value.pauseOrResume();
                },
                child: NeuBox(
                  child: Icon(Icons.play_arrow),
                ),
              ),
            ),
            // skip forward
            Expanded(
              child: GestureDetector(
                onTap: (){
                  value.playNextSong();
                },
                child: NeuBox(
                  child: Icon(Icons.skip_next),
                ),
              ),
            ),
            ],
          )
          
          
            ],
                
            
          ),
        ),
        
            ),
            
      );
      }
    )
    );
  }
}
