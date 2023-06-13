import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Image.network('https://buddy.works/blog/thumbnails/flutter/flutter-cover.png'),
                      const SizedBox(height: 16.0),
                      Text(
                          'Sudip Shrestha',
                          style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                          '@fr1day',
                          style: GoogleFonts.aboreto()
                      ),
                      const SizedBox(height: 16.0),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          StatItem(title: 'Posts', count: '100'),
                          StatItem(title: 'Followers', count: '500'),
                          StatItem(title: 'Following', count: '200'),
                        ],
                      ),
                    ],
                  ),
                  const Positioned(
                    left: 20,
                    top: 90,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'), // User's profile image URL
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              leading: const Icon(Icons.description),
              title: Text('Bio',style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)),
              subtitle: Text('Flutter enthusiast | Open-source lover',style: GoogleFonts.aboreto()),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: Text('Location',style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)),
              subtitle: Text('Kathmandu, Nepal',style: GoogleFonts.aboreto()),
            ),
            ListTile(
              leading: const Icon(Icons.link),
              title: Text('Website',style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)),
              subtitle: Text('example.com',style: GoogleFonts.aboreto()),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text('Joined',style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)),
              subtitle: Text('June 2021',style: GoogleFonts.aboreto()),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Perform edit profile action
              },
              child: Text('Edit Profile',style: GoogleFonts.aboreto()),
            ),
          ],
        ),
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String title;
  final String count;

  const StatItem({super.key,
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
        const SizedBox(height: 4.0),
        Text(
          title,
            style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)
        ),
      ],
    );
  }
}
