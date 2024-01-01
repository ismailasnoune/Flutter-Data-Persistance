import 'package:flutter/material.dart';
import 'package:flutter_storage_app/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  int color = Colors.white.value;
  getdata() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      color = pref.get("favcolor") as int ?? Colors.white.value;
      print(color);
    });
  }

  @override
  Widget build(BuildContext context) {
    getdata();
    return Scaffold(
      backgroundColor: Color(color),
      appBar: AppBar(
        title: const Text("Shared Prefrences"),
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              },
              icon: const Icon(Icons.settings),
              label: const Text("Settings"))
        ],
      ),
      body: null,
    );
  }
}
