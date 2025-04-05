import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;

  final TextEditingController nameController = TextEditingController(text: "Ananya Pandey");
  final TextEditingController emailController = TextEditingController(text: "ananya@gmail.com");
  final TextEditingController mobileController = TextEditingController(text: "8989874679");
  final TextEditingController courseController = TextEditingController(text: "12th CBSE");
  final TextEditingController regNoController = TextEditingController(text: "kjbdkjhbd");
  final TextEditingController regDateController = TextEditingController(text: "03 April");

  final int attended = 190;
  final int pending = 320;
  final int total = 190;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomDivider(),
              const SizedBox(height: 4),
              const CustomDivider(),
              const SizedBox(height: 15),
              ProfileInfo(name: nameController.text, course: courseController.text),
              const SizedBox(height: 10),
              const CustomDivider(),
              const SizedBox(height: 5),
              Column(
                children: [
                  const Text(
                    "Unlocking potential, embracing challenges, and shaping the future!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AttendanceCard(label: 'Attended', count: attended),
                      AttendanceCard(label: 'Pending', count: pending),
                      AttendanceCard(label: 'Total', count: total),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 35),
              const CustomDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Personal Information",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isEditing = !isEditing;
                            });
                          },
                          child: Text(isEditing ? "Save" : "Edit"),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    buildTextField("Name", nameController),
                    buildTextField("Registration No", regNoController),
                    buildTextField("Registration Date", regDateController),
                    buildTextField("Course", courseController),
                    buildTextField("Email Address", emailController),
                    buildTextField("Mobile No.", mobileController),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "$label:",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: isEditing
                ? TextField(
                    controller: controller,
                    style: const TextStyle(fontSize: 18),
                    decoration: const InputDecoration(isDense: true),
                  )
                : Text(
                    controller.text,
                    style: const TextStyle(fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
        ],
      ),
    );
  }
}

class AttendanceCard extends StatelessWidget {
  final String label;
  final int count;

  const AttendanceCard({super.key, required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ],
    );
  }
}

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Profile",
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: Colors.grey[500],
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String name;
  final String course;

  const ProfileInfo({super.key, required this.name, required this.course});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ProfileAvatar(),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  course,
                  style: TextStyle(fontSize: 17, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                const ProfileProgress(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 47,
      backgroundColor: Colors.grey[300],
      backgroundImage: const AssetImage("assets/images/Ananya.jpg"),
    );
  }
}

class ProfileProgress extends StatelessWidget {
  const ProfileProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: 0.78,
            backgroundColor: Colors.grey[300],
            minHeight: 6,
            valueColor: AlwaysStoppedAnimation<Color?>(Colors.grey[800]),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "78% completed",
          style: TextStyle(fontSize: 15, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
