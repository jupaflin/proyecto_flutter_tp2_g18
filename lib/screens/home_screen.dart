import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_base/widgets/drawer_menu.dart';
import 'package:flutter_application_base/helpers/preferences.dart';
import 'package:flutter_application_base/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        leadingWidth: 40,
        toolbarHeight: 80,
      ),
      drawer: DrawerMenu(),
      body: const Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: DarkModeSwitchButton(),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text("TP2",
                style: TextStyle(
                    fontSize: 24,                   
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                "GRUPO 18",
                style: TextStyle(
                    fontSize: 24,      
                  ),
                ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {
          log('click button');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class DarkModeSwitchButton extends StatefulWidget {
  const DarkModeSwitchButton({Key? key}) : super(key: key);

  @override
  State<DarkModeSwitchButton> createState() => _BodyProfileState();
} 

class _BodyProfileState extends State<DarkModeSwitchButton> {
  @override
  Widget build(BuildContext context) {
    final temaProvider = Provider.of<ThemeProvider>(context, listen: false);
    print(Preferences.darkmode);
    return Column(
      children: [
        SwitchListTile.adaptive(
          title: const Text('Dark Mode'),
          value: Preferences.darkmode,
          onChanged: (bool value) {
            setState(() {
              Preferences.darkmode = value; 
              value ? temaProvider.setDark() : temaProvider.setLight();
            });
          },
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
  
}