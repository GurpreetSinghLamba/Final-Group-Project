
import 'candidate.dart';

class Post {
  final String id;
  final String title;
  final String body;
  final String imageUrl;
  final bool isJob;
  final String company;
  final String location;
  final Candidate user;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.imageUrl,
    required this.isJob,
    required this.company,
    required this.location,
    required this.user,
  });


  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'],
        imageUrl = json['imageUrl'],
        isJob = json['isJob'],
        company = json['company'],
        location = json['location'],
        user = Candidate.fromJson(json['user']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'imageUrl': imageUrl,
      'isJob': isJob,
      'company': company,
      'location': location,
      'user': user.toJson(),
    };
  }
}
