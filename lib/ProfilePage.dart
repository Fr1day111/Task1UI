import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskui/Texts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Profile',style: GoogleFonts.aboreto(fontWeight: FontWeight.bold))),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.green,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'), // User's profile image URL
                ),
                SizedBox(height: 16.0),
                Text(
                  'Sudip Shrestha',
                    style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)
                ),
                SizedBox(height: 8.0),
                Text(
                  '@fr1day',
                    style: GoogleFonts.aboreto()
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatItem(title: 'Posts', count: '100'),
                    StatItem(title: 'Followers', count: '500'),
                    StatItem(title: 'Following', count: '200'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Bio',style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)),
            subtitle: Text('Flutter enthusiast | Open-source lover',style: GoogleFonts.aboreto()),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Location',style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)),
            subtitle: Text('Kathmandu, Nepal',style: GoogleFonts.aboreto()),
          ),
          ListTile(
            leading: Icon(Icons.link),
            title: Text('Website',style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)),
            subtitle: Text('example.com',style: GoogleFonts.aboreto()),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Joined',style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)),
            subtitle: Text('June 2021',style: GoogleFonts.aboreto()),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Perform edit profile action
            },
            child: Text('Edit Profile',style: GoogleFonts.aboreto()),
          ),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String title;
  final String count;

  const StatItem({
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
            style: GoogleFonts.aboreto()
        ),
        SizedBox(height: 4.0),
        Text(
          title,
            style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)
        ),
      ],
    );
  }
}
