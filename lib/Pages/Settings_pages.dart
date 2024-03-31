import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Center(
          child: const Text("S E T T I N G S")),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(16),
        margin: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // DARK MODE
           const Text("Dark mode",
           style: TextStyle(fontWeight: FontWeight.bold),),


            // SWITCH

            CupertinoSwitch(value: Provider.of<ThemeProvider>(context, listen:false).isDarkMode,
             onChanged: (value)=>
              Provider.of<ThemeProvider>(context, listen:false).toogleTheme(),
            )
          ],
        ),
      ),
    );
  }
}