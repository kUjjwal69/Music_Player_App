import 'package:flutter/material.dart';
import 'package:music_player/Pages/Song_pages.dart';
import 'package:music_player/components/my_drawers.dart';
import 'package:music_player/models/songs.dart';
import 'package:provider/provider.dart';

import '../models/Playlist_Provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// get the playList provider

late final dynamic playlistProvider;

 @override
void initState() {
  super.initState();
  
  // get playlist provider

  playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);



}

// go to a song

void goToSong( int songIndex){
  // update current song Index
playlistProvider .currentSongIndex = songIndex;


  // navigate to song Page
  Navigator.push(context, MaterialPageRoute(builder: 
  (context) => SongPage(),
  ));


}




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title:  const Center(
        child: Text("P L A Y L I S T"),
        ),
      ),
      drawer: MyDrawer(),

      body: Consumer<PlaylistProvider>
      (builder: (context, value,child){

        //get the PlayList

        final List<Song> playlist = value.playlist;




        // return ListView UI
        return  ListView.builder(
          itemCount: playlist.length,
        itemBuilder: ( context,  index){
          // get the Individual Songs
        final Song song = playlist[index];



        // return the liste Tile UI

        return ListTile(
          title: Text(song.songName),
          subtitle: Text(song.artistName),
          leading: Image.asset(song.albumArtImagePath),
          onTap: () => goToSong(index),
        );
        }
        );
      }

        ),
    );
  }
}