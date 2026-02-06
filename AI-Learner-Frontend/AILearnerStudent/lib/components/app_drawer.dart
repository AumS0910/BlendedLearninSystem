import 'package:ailearner/pages/login_page.dart';
import 'package:ailearner/services/auth_services.dart';
import 'package:ailearner/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/profile_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: veryListGrey,
      child: Column(
        children: [
          const DrawerHeader(
            child: Text(
              "AI Learner",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const ProfileBody(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text(
                  "About US",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const ProfileBody(),
                    ),
                  );
                },
              ),
            ],
          ),
          const Spacer(
            flex: 9,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () async {
              AuthService auth = AuthService();
              auth.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ));
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
