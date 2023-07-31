import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class SettingScreen extends StatelessWidget {
  final String profilePictureUrl;
  
  SettingScreen({required this.profilePictureUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      drawer: buildDrawer(),
      body: buildProfileDetails(),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to settings page if needed
            },
          ),
          const SizedBox(height: 380),
          ListTile(
            onTap: () {
              var context;
              QuickAlert.show(
                context: context,
                type: QuickAlertType.confirm,
                text: 'Do you want to logout?',
                confirmBtnText: 'Yes',
                cancelBtnText: 'No',
                confirmBtnColor: Colors.lightBlue,
                onConfirmBtnTap: () {
                  Navigator.pushReplacementNamed(context, 'login');
                },
              );
            },
            leading: Container(
              padding: const EdgeInsets.all(10),
              // decoration: BoxDecoration(
              //   color: Colors.redAccent.shade100,
              //   shape: BoxShape.circle,
              // ),
              child: const Icon(
                Icons.info_outline_rounded,
                color: Colors.redAccent,
                size: 35,
              ),
            ),
            title: const Text(
              "Log Out",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileDetails() {
    // Replace the following with your actual profile data
    String profilePictureUrl =
        'https://ss-images.saostar.vn/w800/pc/1655197228101/saostar-mgs496dpbs7wupkq.jpeg';
    String username = 'Doctor Kyo';
    String email = 'johndoe@example.com';
    String age = 'Age 22 Years old';

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            backgroundImage: NetworkImage(profilePictureUrl),
            radius: 50,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          username,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          email,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          age,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: Container(),
        ), // This Expanded widget will take up the remaining space
      ],
    );
  }
}
