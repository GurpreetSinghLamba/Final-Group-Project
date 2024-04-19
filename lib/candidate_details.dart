import 'package:flutter/material.dart';
import 'candidate.dart';

class CandidateDetailScreen extends StatelessWidget {
  final Candidate candidate;

  CandidateDetailScreen({required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidate Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              child: Image.asset(candidate.imageUrl),
            ),
            SizedBox(height: 20),
            Text(
              candidate.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              candidate.bio,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
