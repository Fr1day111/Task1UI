import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskui/Texts.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Home Page',style: GoogleFonts.aboreto(fontWeight: FontWeight.bold))),
      ),
      body: ListView.builder(
        itemCount: 10, // Number of posts
        itemBuilder: (context, index) {
          return PostCard(
            username: 'Sudip Shrestha',
            handle: '@Fr1dayy',
            text: 'This is a sample post!',
            imageUrl: 'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png',
          );
        },
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String username;
  final String handle;
  final String text;
  final String imageUrl;

  final LikeBloc likeBloc = LikeBloc();

  PostCard({super.key,
    required this.username,
    required this.handle,
    required this.text,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'), // User's profile image URL
                ),
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)
                    ),
                    Text(
                      handle,
                        style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(text,style: GoogleFonts.aboreto()),
            SizedBox(height: 8.0),
            Image.network(imageUrl), // Post image URL
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StreamBuilder<bool>(
                  stream: likeBloc.likeStream,
                  initialData: likeBloc.isLiked,
                  builder: (context, snapshot) {
                    return IconButton(
                      icon: Icon(
                        snapshot.data == true ? Icons.favorite : Icons.favorite_border,
                      ),
                      onPressed: () {
                        likeBloc.likePost();
                      },
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.comment),
                  onPressed: () {
                    // Navigate to post details screen or comment section
                  },
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    // Perform share action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class LikeBloc {
  bool _isLiked = false;
  bool get isLiked => _isLiked;

  final _likeController = StreamController<bool>();
  Stream<bool> get likeStream => _likeController.stream;

  void likePost() {
    _isLiked = !_isLiked;
    _likeController.sink.add(_isLiked);
  }

  void dispose() {
    _likeController.close();
  }
}

