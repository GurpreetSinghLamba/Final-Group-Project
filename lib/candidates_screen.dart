import 'package:flutter/material.dart';
import 'candidate.dart';
import 'candidate_details.dart';

class CandidatesScreen extends StatelessWidget {
  final List<Candidate> candidates;

  CandidatesScreen({required this.candidates});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidates'),
      ),
      body: ListView.builder(
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(candidates[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CandidateDetailScreen(candidate: candidates[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
