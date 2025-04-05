import 'package:first_project/widgets/models.dart';
import 'package:flutter/material.dart';
import 'package:first_project/pages/account_screen.dart';
import 'package:first_project/pages/drawer_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No new notifications')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountScreen()),
              );
            },
          ),
        ],
      ),
      drawer: MyDrawer(
        user: UserModel(
          name: 'Ananya',
          email: 'ananya@gmail.com',
          profileImageUrl:
              'https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8',
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _GreetingSection(userName: "Ananya"),
            SizedBox(height: 20),
            _AddBanner(),
            _LastPurchasedSection(),
            SizedBox(height: 8),
            _UpcomingClasses(),
            _PromotionalItems(),
            _Transactions(),
            _SellingCourses(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() => _selectedIndex = value),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.book), label: 'Browse courses'),
          BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books), label: 'My Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class _GreetingSection extends StatelessWidget {
  final String userName;
  const _GreetingSection({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi $userName!",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const Text("What do you want to learn today?"),
            ],
          ),
          const CircleAvatar(
            radius: 31.5,
            backgroundImage: AssetImage("assets/images/Ananya.jpg"),
          ),
        ],
      ),
    );
  }
}

class _AddBanner extends StatelessWidget {
  const _AddBanner();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://media.licdn.com/dms/image/v2/D5612AQGdRZ94KiT1WQ/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1674491764471?e=2147483647&v=beta&t=S-r5AKObUXjUFcscLYVbMAXJdszCaKFASy0PWrpHMcg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
            ),
          ),
        ),
      ),
    );
  }
}

class _LastPurchasedSection extends StatelessWidget {
  const _LastPurchasedSection();

  @override
  Widget build(BuildContext context) {
    String courseName = "Flutter Basics";
    String purchaseDate = "11th Mar 2025";
    String progress = "89%";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            "Last Purchased",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 150, 146, 146),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Purchased on $purchaseDate",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      progress,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _UpcomingClasses extends StatelessWidget {
  const _UpcomingClasses();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLargeCard(),
          const SizedBox(width: 10),
          _buildSmallCards(),
        ],
      ),
    );
  }

  Widget _buildLargeCard() {
    return Expanded(
      flex: 6,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 160,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
          ),
          child: Stack(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Upcoming & Live Classes",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Schedule Class title",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Today at 5PM to 7PM",
                    style: TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.network(
                  "https://www.globalcareercounsellor.com/blog/wp-content/uploads/2018/05/Online-Career-Counselling-course.jpg",
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSmallCards() {
    return const Expanded(
      flex: 4,
      child: Column(
        children: [
          _SmallCard(
            title: "Pending Quizzes",
            subtitle: "Quiz Name",
            bottomText: "Total No.of quizzes",
          ),
          SizedBox(height: 10),
          _SmallCard(
            title: "Test & Quiz",
            subtitle: "150 Total Questions | 2hrs",
          ),
        ],
      ),
    );
  }
}

class _SmallCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? bottomText;

  const _SmallCard({
    required this.title,
    required this.subtitle,
    this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 75,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 1),
                Text(subtitle,
                    style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54)),
                if (bottomText != null)
                  Text(bottomText!,
                      style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          color: Colors.black45)),
              ],
            ),
            const Positioned(
              bottom: 0,
              right: 0,
              child: Icon(Icons.bookmark_border),
            ),
          ],
        ),
      ),
    );
  }
}

class _Transactions extends StatelessWidget {
  const _Transactions();

  @override
  Widget build(BuildContext context) {
    return const _UpcomingClasses().build(context);
  }
}

class _PromotionalItems extends StatelessWidget {
  const _PromotionalItems();

  @override
  Widget build(BuildContext context) {
    return const _Card(
      title: "Promotional Items",
      icon: Icons.arrow_forward_ios,
    );
  }
}

class _SellingCourses extends StatelessWidget {
  const _SellingCourses();

  @override
  Widget build(BuildContext context) {
    return const _Card(
      title: "Selling Courses",
      subtitle: "Till Now",
      icon: Icons.arrow_forward_ios,
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;

  const _Card({required this.title, this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  if (subtitle != null)
                    Text(subtitle!,
                        style:
                            const TextStyle(fontSize: 10, color: Colors.white)),
                ],
              ),
              Icon(icon, color: Colors.white.withOpacity(0.5), size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
