import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogDetailsScreen extends StatefulWidget {
  final String title;
  final String coverPhoto;
  final String description;
  final String name;
  final String profession;
  final String avatar;
  final String business;
  final String lifestyle;

  BlogDetailsScreen(
      {this.title,
      this.coverPhoto,
      this.description,
      this.name,
      this.profession,
      this.avatar,
      this.business,
      this.lifestyle});

  @override
  _BlogDetailsScreenState createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10.0),
            Container(
              height: 250.0,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  widget.coverPhoto,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 6.0),
            Text(widget.description,
                style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w400),
                textAlign: TextAlign.justify),
            SizedBox(height: 6.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.business,
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    Text(widget.lifestyle,
                        style: TextStyle(fontWeight: FontWeight.w600))
                  ],
                ),
                SizedBox(width: 20.0),
                Row(
                  children: [
                    CircleAvatar(
                        radius: 15.0,
                        backgroundImage: NetworkImage(widget.avatar)),
                    SizedBox(width: 4.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name,
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        Text(widget.profession,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12.0)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
