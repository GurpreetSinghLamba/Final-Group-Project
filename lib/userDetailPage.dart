import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'candidate.dart';
import 'dart:convert';
import 'dart:io';

class UserDetailPage extends StatefulWidget {
  final Candidate user;

  UserDetailPage({required this.user});

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  bool isConnected = false;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }


  void _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();

    setState(() {
      isConnected = _prefs.getBool('${widget.user.id}') ?? false;
    });
  }


  void _savePreferences(bool value) async {
    await _prefs.setBool('${widget.user.id}', value);
  }

  Future<String> _loadLocalData() async {
    return await rootBundle.loadString('assets/posts.json');
  }

  Future<void> saveToJsonFile() async {
    try {
      String data = await _loadLocalData();
      List<dynamic> jsonPosts = json.decode(data);
      jsonPosts[0]['isConnected'] = true;
      String jsonData = json.encode(jsonPosts);
      final file = File("assets/posts.json");
      await file.writeAsString(jsonData);
      print('File updated successfully.');
    } catch (e) {
      print('Error updating file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: Duration(seconds: 1),
              builder: (BuildContext context, double value, Widget? child) {
                return Transform.scale(
                  scale: value,
                  child: child,
                );
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(widget.user.imageUrl),
              ),
            ),
            SizedBox(height: 20),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: Duration(seconds: 1),
              builder: (BuildContext context, double value, Widget? child) {
                return Opacity(
                  opacity: value,
                  child: child,
                );
              },
              child: Text(
                widget.user.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: Duration(seconds: 1),
              builder: (BuildContext context, double value, Widget? child) {
                return Opacity(
                  opacity: value,
                  child: child,
                );
              },
              child: Text(
                widget.user.bio,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            isConnected
                ? Text('Connected')
                : ElevatedButton(
              onPressed: () async {
                await saveToJsonFile();
                _savePreferences(true);
                setState(() {
                  isConnected = true;
                });
              },
              child: Text('Connect'),
            ),
          ],
        ),
      ),
    );
  }
}
