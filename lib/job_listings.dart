import 'package:flutter/material.dart';
import 'Posts.dart';

class JobListening extends StatefulWidget {
  final String title;
  final String body;
  final String imageUrl;
  final bool isJob;
  final String company;
  final String location;
  final int userId;
  final String userName;
  final String userImage;
  final String userBio;

  JobListening({
    required this.title,
    required this.body,
    required this.imageUrl,
    required this.isJob,
    required this.company,
    required this.location,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.userBio,
  });

  @override
  _JobListeningState createState() => _JobListeningState();
}

class _JobListeningState extends State<JobListening> {
  List<Map<String, dynamic>> _jobs = [];

  @override
  void initState() {
    super.initState();
    _jobs.add({
      'title': widget.title,
      'body': widget.body,
      'imageUrl': widget.imageUrl,
      'isJob': widget.isJob,
      'company': widget.company,
      'location': widget.location,
      'userId': widget.userId,
      'userName': widget.userName,
      'userImage': widget.userImage,
      'userBio': widget.userBio
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listening'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _jobs.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Title: ${_jobs[index]['title']}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Body: ${_jobs[index]['body']}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Company: ${_jobs[index]['company']}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Location: ${_jobs[index]['location']}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'UserId: ${_jobs[index]['userId']}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'UserName: ${_jobs[index]['userName']}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'userImage: ${_jobs[index]['userImage']}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'userBio: ${_jobs[index]['userBio']}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Posts()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
