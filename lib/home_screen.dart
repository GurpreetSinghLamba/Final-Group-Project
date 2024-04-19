import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_local/job_detail.dart';
import 'package:group_local/post.dart';
import 'package:group_local/Posts.dart';
import 'package:group_local/userDetailPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    try {
      String data = await _loadLocalData();
      List<dynamic> jsonPosts = json.decode(data);
      List<Post> loadedPosts = [];
      jsonPosts.forEach((post) {
        loadedPosts.add(Post.fromJson(post));
      });
      setState(() {
        posts = loadedPosts;
      });
    } catch (e) {
      print("Error loading posts: $e");
    }
  }

  Future<String> _loadLocalData() async {
    print("inside load local data --------------000");
    return await rootBundle.loadString('assets/posts.json');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Posts'),
              Tab(text: 'Users'),
              Tab(text: 'Jobs'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // View Users Tab
            Container(
              color: Colors.grey[200],
              child: ListView.builder(
                itemCount: posts.where((post) => !post.isJob).length,
                itemBuilder: (context, index) {
                  final jobPosts = posts.where((post) => !post.isJob).toList();
                  final user = jobPosts[index].user;
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(user.imageUrl),
                            ),
                            title: Text(
                              jobPosts[index].title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Company: ${jobPosts[index].company}'),
                                Text('Location: ${jobPosts[index].location}'),
                                Text('Posted by: ${user.name}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final user = posts[index].user;
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserDetailPage(user: user)),
                      );
                    },
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(user.imageUrl),
                          ),
                          title: Text(
                            user.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('View details'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            Container(
              color: Colors.grey[200],
              child: ListView.builder(
                itemCount: posts.where((post) => post.isJob).length,
                itemBuilder: (context, index) {
                  final jobPosts = posts.where((post) => post.isJob).toList();
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobDetailScreen(jobPost: jobPosts[index])),
                        );
                      },
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(jobPosts[index].user.imageUrl),

                            ),
                            title: Text(
                              jobPosts[index].title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Company: ${jobPosts[index].company}'),
                                Text('Location: ${jobPosts[index].location}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Posts()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
