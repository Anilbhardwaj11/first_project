import 'package:first_project/pages/profile.dart';
import 'package:first_project/widgets/models.dart';
import 'package:flutter/material.dart';
import '../courses/course_dashboard.dart';

class MyDrawer extends StatelessWidget {
  final UserModel user;

  const MyDrawer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF666666),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                color: const Color(0xFF666666),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 41,
                          backgroundImage: NetworkImage(user.profileImageUrl),
                        ),
                        const SizedBox(width: 17),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              user.email,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfilePage()),
                                );
                              },
                              child: Container(
                                width: 120,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildDrawerItem(Icons.person, 'My Profile', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ProfilePage()));
                    }),
                    _buildDrawerItem(Icons.book, 'My Learnings', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ProfilePage()));
                    }),
                    _buildDrawerItem(Icons.dashboard, 'Course Dashboard', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CourseDashboard()));
                    }),
                    _buildDrawerItem(Icons.quiz, 'Test & Quiz', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ProfilePage()));
                    }),
                    _buildDrawerItem(Icons.language, 'Language', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ProfilePage()));
                    }),
                    _buildDrawerItem(Icons.payment, 'Transactions', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ProfilePage()));
                    }),
                    _buildDrawerItem(Icons.notifications, 'Notice', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ProfilePage()));
                    }),
                    _buildDrawerItem(Icons.star_rate, 'Rate this app', () {
                      // Add rating logic
                    }),
                    _buildDrawerItem(Icons.share, 'Share this app', () {
                      // Add share logic
                    }),
                    _buildDrawerItem(Icons.settings, 'Settings', () {
                      Navigator.pushNamed(context, '/settings');
                    }),
                    _buildDrawerItem(Icons.logout, 'Logout', () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Logout'),
                          content:
                              const Text('Are you sure you want to logout?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Perform logout logic here
                                Navigator.pop(context);
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              },
                              child: const Text('Logout'),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}
