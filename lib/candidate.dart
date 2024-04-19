import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

class Candidate {
  final String id;
  final String name;
  final String imageUrl;
  final String bio;
  late bool isConnected;

  Candidate({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.bio,
    required this.isConnected,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      bio: json['bio'],
      isConnected: json['isConnected'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'bio': bio,
      'isConnected': isConnected,
    };
  }
  Future<String> _loadLocalData() async {
    return await rootBundle.loadString('assets/posts.json');
  }

  void saveToJsonFile() async {

    final File file = File("assets/posts.json");
    String content = await file.readAsString();
    String data = await _loadLocalData();
    Map<String,dynamic> jsonPosts = json.decode(content);
    print("we are here --------------------------------------------");
    jsonPosts[0]["isConnected"] = "true";
    String jsonCandidate = json.encode(jsonPosts);
    await file.writeAsString(jsonCandidate);
  }
}