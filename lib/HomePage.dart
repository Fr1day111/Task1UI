import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:taskui/AddPost.dart';
import 'package:taskui/FeedPage.dart';
import 'package:taskui/ProfilePage.dart';
class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var _currentIndex = 0;
  var _screens=[FeedPage(),AddPostPage(),ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        margin: EdgeInsets.all(20),
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home",style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)),
            selectedColor: Colors.purple,
          ),

          /// Posts
          SalomonBottomBarItem(
            icon: Icon(Icons.post_add),
            title: Text("Post",style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)),
            selectedColor: Colors.pink,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile",style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}


