
import 'package:flutter/material.dart';
import 'package:music_player/Pages/homePages.dart';
import 'package:music_player/models/Playlist_Provider.dart';
import 'package:music_player/theme/theme_provider.dart';
import 'package:provider/provider.dart';


void main(){
  runApp(

    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider(),),
      ChangeNotifierProvider(create: (context) => PlaylistProvider(),)
    ],
    child: const MyApp(),
     )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}