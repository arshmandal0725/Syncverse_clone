import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:syncverse_clone/modules/login_screen/views/login_screen_view.dart';
//import 'package:syncverse/app/modules/faq/views/faq_view.dart';
//import 'package:syncverse/app/modules/help/views/help_view.dart';
//import 'package:syncverse/app/modules/login_screen/views/login_screen_view.dart';

//import '../../setting/views/setting_view.dart';
//import 'package:syncverse/app/modules/settings/seting.dart';
//import 'package:get/get.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            // decoration: BoxDecoration(borderRadius: BorderRadius.only()),
            width: 316,
            height: 250,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                color: Color(0xfff1D3557),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color(0xfff1D3557),
                child: Icon(
                  Icons.account_circle_sharp,
                  size: 80,
                ),
              ),
              accountName: Text('SyncVerse'),
              accountEmail: Text('syncverse@gmail.com'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 260, // Replace 200 with your desired width
              height: 60, // Replace 80 with your desired height
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(
                        4.0,
                        4.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                  color: Color(0xFFE0E1DC),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: ListTile(
                        leading: Image.asset('assets/about.png'),
                        title: const Text(
                          'About',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 260, // Replace 200 with your desired width
              height: 60, // Replace 80 with your desired height
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(
                        4.0,
                        4.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                  color: Color(0xFFE0E1DC),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: ListTile(
                        onTap: () {},
                        leading: Image.asset(
                          'assets/settings.png',
                          scale: 0.8,
                        ),
                        title: const Text(
                          'Settings',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 260, // Replace 200 with your desired width
              height: 60, // Replace 80 with your desired height
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(
                        4.0,
                        4.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                  color: Color(0xFFE0E1DC),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: ListTile(
                        onTap: () {},
                        leading: Image.asset('assets/faq.png'),
                        title: const Text(
                          'FAQ',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 260, // Replace 200 with your desired width
              height: 60, // Replace 80 with your desired height
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(
                        4.0,
                        4.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                  color: Color(0xFFE0E1DC),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: ListTile(
                        onTap: () {},
                        leading: Image.asset('assets/help.png'),
                        title: const Text(
                          'Help',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 3,
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                Get.off(() => const LoginScreenView());
              });
            },
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
