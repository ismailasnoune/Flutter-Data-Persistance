import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int favcolor = Colors.white.value;
  savedata(int c) async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt("favcolor", c);
  }

  getdata() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      favcolor = pref.get("favcolor") as int ?? Colors.white.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    getdata();
    return Scaffold(
      backgroundColor: Color(favcolor),
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RadioListTile(
                title: Text("Red"),
                value: Colors.red.value,
                groupValue: favcolor,
                onChanged: (newval) {
                  setState(() {
                    favcolor = newval!;
                  });
                  savedata(favcolor);
                }),
            RadioListTile(
                title: Text("Blue"),
                value: Colors.blue.value,
                groupValue: favcolor,
                onChanged: (newval) {
                  setState(() {
                    favcolor = newval!;
                  });
                  savedata(favcolor);
                }),
            RadioListTile(
                title: Text("Orange"),
                value: Colors.orange.value,
                groupValue: favcolor,
                onChanged: (newval) {
                  setState(() {
                    favcolor = newval!;
                  });
                  savedata(favcolor);
                })
          ],
        ),
      ),
    );
  }
}
