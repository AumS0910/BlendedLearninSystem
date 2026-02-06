import 'package:ai_learner_teacher/services/AuthServices.dart';
import 'package:ai_learner_teacher/utils/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  String name = "";

  String email = "";

  String prn = "";

  void getDataFromFirebase() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot<Map<String, dynamic>> data =
        await firestore.collection("Users").doc(auth.currentUser!.uid).get();

    setState(() {
      name = data['name'];
      email = data['email'];
      prn = data['PRN'];
    });
  }

  @override
  void initState() {
    super.initState();
    getDataFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.purple, Colors.deepPurple],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            child: const Center(
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: NetworkImage(
                    "https://i0.wp.com/vssmn.org/wp-content/uploads/2018/12/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png?fit=860%2C681&ssl=1&w=640"), // Replace with actual image path
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
            ),
          ),
          const SizedBox(height: 20.0),
          Column(
            children: [
              ProfileItem(icon: Icons.person, text: 'Name', value: name),
              const Divider(),
              ProfileItem(
                  icon: Icons.assignment_ind_sharp, text: 'PRN', value: prn),
              const Divider(),
              ProfileItem(icon: Icons.email, text: 'Email', value: email),
              const Divider(),
            ],
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 100.0), // Adjust the horizontal padding
            child: ElevatedButton(
              onPressed: () async {
                await AuthService().signOut();
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(lightPurpleColor),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the value for roundness
                  ),
                ),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 17.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String value;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      subtitle: Text(value),
    );
  }
}
