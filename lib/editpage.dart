import 'package:flutter/material.dart';

class EditBlogPage extends StatefulWidget {
  final String blogTitle;

  EditBlogPage({required this.blogTitle});

  @override
  _EditBlogPageState createState() => _EditBlogPageState();
}

class _EditBlogPageState extends State<EditBlogPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.blogTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Blog'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: 'Content',
                ),
                maxLines: 10,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter content';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save the changes to the database
                  }
                },
                child: Text('Save'),
              ),
              SizedBox(height: 16),
              RaisedButton(
                onPressed: () {
                  // Delete the blog post from the database
                },
                child: Text('Delete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
