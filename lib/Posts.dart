import 'package:flutter/material.dart';
import 'package:group_local/job_listings.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> with SingleTickerProviderStateMixin {
  String? _selectedType = 'Post';
  late TextEditingController _titleController;
  late TextEditingController _bodyController;
  late TextEditingController _imageUrlController;
  late TextEditingController _isJobController;
  late TextEditingController _companyController;
  late TextEditingController _locationController;
  late TextEditingController _userIdController;
  late TextEditingController _userNameController;
  late TextEditingController _userImageController;
  late TextEditingController _userBioController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
    _imageUrlController = TextEditingController();
    _isJobController = TextEditingController();
    _companyController = TextEditingController();
    _locationController = TextEditingController();
    _userIdController = TextEditingController();
    _userNameController = TextEditingController();
    _userImageController = TextEditingController();
    _userBioController = TextEditingController();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post or Job'),
      ),
      body: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 1),
          end: Offset.zero,
        ).animate(_animationController),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select type:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Radio<String>(
                                value: 'Post',
                                groupValue: _selectedType,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedType = value;
                                  });
                                },
                              ),
                              Text('Post'),
                              Radio<String>(
                                value: 'Job',
                                groupValue: _selectedType,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedType = value;
                                  });
                                },
                              ),
                              Text('Job'),
                            ],
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              labelText: 'Title',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: _bodyController,
                            decoration: InputDecoration(
                              labelText: 'Body',
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 3,
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: _imageUrlController,
                            decoration: InputDecoration(
                              labelText: 'Image URL',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: _isJobController,
                            decoration: InputDecoration(
                              labelText: 'Is Job',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: _companyController,
                            decoration: InputDecoration(
                              labelText: 'Company',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: _locationController,
                            decoration: InputDecoration(
                              labelText: 'Location',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: _userIdController,
                            decoration: InputDecoration(
                              labelText: 'User ID',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: _userNameController,
                            decoration: InputDecoration(
                              labelText: 'User Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: _userImageController,
                            decoration: InputDecoration(
                              labelText: 'User Image URL',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: _userBioController,
                            decoration: InputDecoration(
                              labelText: 'User Bio',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(

                            onPressed: () {
                              String title = _titleController.text;
                              String body = _bodyController.text;
                              String imageUrl = _imageUrlController.text;
                              bool isJob =
                                  _isJobController.text.toLowerCase() == 'true';
                              String company = _companyController.text;
                              String location = _locationController.text;
                              int userId =
                                  int.tryParse(_userIdController.text) ?? 0;
                              String userName = _userNameController.text;
                              String userImage =
                                  _userImageController.text;
                              String userBio = _userBioController.text;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => JobListening(
                                    title: title,
                                    body: body,
                                    imageUrl: imageUrl,
                                    isJob: isJob,
                                    company: company,
                                    location: location,
                                    userId: userId,
                                    userName: userName,
                                    userImage: userImage,
                                    userBio: userBio,
                                  ),
                                ),
                              );
                            },
                            child: Text('Post'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Go Back'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

