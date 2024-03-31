import 'package:flutter/material.dart';
import 'package:music_player/Pages/Settings_pages.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,

      child: Column(
        children: [
          // logo
        DrawerHeader(child: Icon(Icons.music_note,
        size:40 ,
        color: Theme.of(context).colorScheme.inversePrimary,),
        ),
        

          // home title
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25),
          child: ListTile(
            title: Text("H O M E"),
            leading:  Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),
        ),





          // settings title

           Padding(
          padding:  EdgeInsets.only(left: 25.0, top: 0),
          child: ListTile(
            title: Text("S E T T I N G S"),
            leading:  Icon(Icons.settings),
            // pop drawer
            onTap: () { Navigator.pop(context);

            // navigate to settings page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage(),)
            );
            }

          ),
        )
        ],
      ),
    );
  }
}