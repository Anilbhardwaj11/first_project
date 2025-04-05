import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CourseDashboard extends StatefulWidget {
  const CourseDashboard({super.key});

  @override
  _CourseDashboardState createState() => _CourseDashboardState();
}

class _CourseDashboardState extends State<CourseDashboard> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<String> imageUrls = [
    "https://img.freepik.com/free-psd/online-study-banner-template_23-2148813629.jpg",
    "https://img.freepik.com/free-psd/e-learning-course-banner-template_23-2148909983.jpg",
    "https://img.freepik.com/free-vector/online-courses-concept_52683-37480.jpg",
    "https://aclm.in/wp-content/uploads/2021/09/Ads.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                BannerSlider(
                  pageController: _pageController,
                  imageUrls: imageUrls,
                ),
                const SizedBox(height: 10),
                const Progress(),
                const SizedBox(height: 15),
                const GoodJob(),
                const SizedBox(height: 10),
                const NewCourses(),
                const SizedBox(height: 10),
                const MyLearningBanner(),
                const SizedBox(height: 10),
                const Freecoourses(),
                const SizedBox(
                  height: 10,
                ),
                const CourseProgressScreen(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() => _selectedIndex = value),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Browse courses'),
          BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books), label: 'My Courses'),
          BottomNavigationBarItem(
              icon: Icon(Icons.download), label: 'Downloads'),
        ],
      ),
    );
  }
}

class CourseProgressScreen extends StatefulWidget {
  const CourseProgressScreen({super.key});

  @override
  _CourseProgressScreenState createState() => _CourseProgressScreenState();
}

class _CourseProgressScreenState extends State<CourseProgressScreen> {
  int completedCount = 42;
  int favoriteCount = 42;
  int totalCourses = 98;

  void markAsCompleted() {
    if (completedCount < totalCourses) {
      setState(() {
        completedCount++;
      });
    }
  }

  void markAsFavorite() {
    if (favoriteCount < totalCourses) {
      setState(() {
        favoriteCount++;
      });
    }
  }

  Widget buildCounterCard(String title, int count, VoidCallback onPressed,
      IconData icon, double width) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: width,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "$count/$totalCourses",
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCounterCard("COMPLETED", completedCount, markAsCompleted,
                Icons.check_circle, 160),
            buildCounterCard("MY FAVOURITE", favoriteCount, markAsFavorite,
                Icons.favorite, 180),
          ],
        ),
      ],
    );
  }
}

class MyLearningBanner extends StatelessWidget {
  const MyLearningBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 204, 197, 197),
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: NetworkImage(
            "https://static.vecteezy.com/system/resources/previews/002/294/874/non_2x/e-learning-web-banner-design-students-take-online-tests-during-online-classes-online-education-digital-classroom-e-learning-concept-header-or-footer-banner-free-vector.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Freecoourses extends StatefulWidget {
  const Freecoourses({super.key});

  @override
  State<Freecoourses> createState() => _FreecooursesState();
}

class _FreecooursesState extends State<Freecoourses> {
  String selected = 'new';
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> freecourses = [
    {
      "name": "Flutter Basics",
      "price": "499",
      "imageUrl":
          "https://img.freepik.com/free-psd/online-study-banner-template_23-2148813629.jpg",
    },
    {
      "name": "Advanced Dart",
      "price": "699",
      "imageUrl":
          "https://img.freepik.com/free-psd/online-study-banner-template_23-2148813629.jpg",
    },
    {
      "name": "UI/UX Design",
      "price": "399",
      "imageUrl":
          "https://img.freepik.com/free-psd/online-study-banner-template_23-2148813629.jpg",
    },
    {
      "name": "Full-Stack Dev",
      "price": "999",
      "imageUrl":
          "https://img.freepik.com/free-psd/online-study-banner-template_23-2148813629.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {
                if (_scrollController.hasClients) {
                  _scrollController.jumpTo(0);
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: selected == 'new'
                    ? const Color.fromARGB(255, 40, 37, 37)
                    : Colors.grey[700],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              child: const Text(
                "Free Courses",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: freecourses.length,
            itemBuilder: (context, index) {
              return CourseCard(
                name: freecourses[index]["name"]!,
                price: freecourses[index]["price"]!,
                imageUrl: freecourses[index]["imageUrl"]!,
              );
            },
          ),
        ),
      ],
    );
  }
}

class NewCourses extends StatefulWidget {
  const NewCourses({super.key});

  @override
  State<NewCourses> createState() => _NewCoursesState();
}

class _NewCoursesState extends State<NewCourses> {
  String selected = 'new';
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> newcourses = [
    {
      "name": "Flutter Basics",
      "price": "499",
      "imageUrl":
          "https://img.freepik.com/free-psd/online-study-banner-template_23-2148813629.jpg",
    },
    {
      "name": "Advanced Dart",
      "price": "699",
      "imageUrl":
          "https://img.freepik.com/free-psd/online-study-banner-template_23-2148813629.jpg",
    },
    {
      "name": "UI/UX Design",
      "price": "399",
      "imageUrl":
          "https://img.freepik.com/free-psd/online-study-banner-template_23-2148813629.jpg",
    },
    {
      "name": "Full-Stack Dev",
      "price": "999",
      "imageUrl":
          "https://img.freepik.com/free-psd/online-study-banner-template_23-2148813629.jpg",
    },
  ];
  final List<Map<String, String>> topcourses = [
    {
      "name": "Flutter Basics",
      "price": "499",
      "imageUrl":
          "https://img.freepik.com/free-psd/online-study-banner-template_23-2148813629.jpg",
    },
    {
      "name": "Advanced Dart",
      "price": "699",
      "imageUrl":
          "https://img.freepik.com/free-psd/online-study-banner-template_23-2148813629.jpg",
    },
    {
      "name": "UI/UX Design",
      "price": "399",
      "imageUrl":
          "https://img.freepik.com/free-psd/online-study-banner-template_23-2148813629.jpg",
    },
    {
      "name": "Full-Stack Dev",
      "price": "999",
      "imageUrl":
          "https://img.freepik.com/free-psd/online-study-banner-template_23-2148813629.jpg",
    },
  ];
  void _onTabChanged(String value) {
    setState(() {
      selected = value;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final courses = selected == 'new' ? newcourses : topcourses;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () => _onTabChanged('new'),
              style: TextButton.styleFrom(
                backgroundColor: selected == 'new'
                    ? const Color.fromARGB(255, 40, 37, 37)
                    : Colors.grey[700],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              child: const Text(
                "New Courses",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 15),
            TextButton(
              onPressed: () => _onTabChanged('top'),
              style: TextButton.styleFrom(
                backgroundColor: selected == 'top'
                    ? const Color.fromARGB(255, 40, 37, 37)
                    : Colors.grey[700],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              child: const Text(
                "Top Courses",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return CourseCard(
                name: courses[index]["name"]!,
                price: courses[index]["price"]!,
                imageUrl: courses[index]["imageUrl"]!,
              );
            },
          ),
        ),
      ],
    );
  }
}

class CourseCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

  const CourseCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
          Text("₹$price",
              style: const TextStyle(fontSize: 14, color: Colors.green)),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text("Buy Now", style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

class GoodJob extends StatelessWidget {
  const GoodJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 213, 209, 209),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Job!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                "Your current score",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: const Center(
              child: Text(
                "90%",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 182, 178, 178),
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Your Progress Awaits!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            child: const Text(
              "Start Learning",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BannerSlider extends StatelessWidget {
  final PageController pageController;
  final List<String> imageUrls;

  const BannerSlider({
    super.key,
    required this.pageController,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 135,
          child: PageView.builder(
            controller: pageController,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return BannerCard(imageUrl: imageUrls[index]);
            },
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: pageController,
          count: imageUrls.length,
          effect: const ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: Colors.black,
            dotColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class BannerCard extends StatelessWidget {
  final String imageUrl;

  const BannerCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 205, 197, 197),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Course Dashboard",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 231, 225, 225),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
