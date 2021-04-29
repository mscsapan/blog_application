import 'package:blog_app/model/blog_model.dart';
import 'package:blog_app/screen/blog_details_screen.dart';
import 'package:blog_app/service/blog_network_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogHomeScreen extends StatefulWidget {
  @override
  _BlogHomeScreenState createState() => _BlogHomeScreenState();
}

class _BlogHomeScreenState extends State<BlogHomeScreen> {
  List<Blog> _data = [];
  bool _isLoading = false;

  void loadData() {
    BlogNetWorkService().getBlogApi().then((value) {
      if (value != null) {
        setState(() {
          _isLoading = true;
        });
        if (value.blogs.isNotEmpty) {
          for (int i = 0; i < value.blogs.length; i++) {
            setState(() {
              _data.add(value.blogs[i]);
              _isLoading = false;
            });
          }
        } else {
          print('No data found');
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLoading ? 'Loading...' : 'Blog Application'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: _data.isNotEmpty
                  ? ListView.builder(
                      itemCount: _data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.only(bottom: 25.0),
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BlogDetailsScreen(
                                                    title: _data[index].title,
                                                    coverPhoto:
                                                        _data[index].coverPhoto,
                                                    description: _data[index]
                                                        .description,
                                                    name: _data[index]
                                                        .author
                                                        .name,
                                                    profession: _data[index]
                                                        .author
                                                        .profession,
                                                    avatar: _data[index]
                                                        .author
                                                        .avatar,
                                                    business:
                                                        _data[index].categories[
                                                            0],
                                                    lifestyle: _data[index]
                                                        .categories[1])));
                                  },
                                  child: Container(
                                      height: 250.0,
                                      width: double.infinity,
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image.network(
                                            _data[index].coverPhoto,
                                            fit: BoxFit.cover,
                                          )))),
                              Text(_data[index].title,
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.justify)
                            ]));
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    )),
    );
  }
}
