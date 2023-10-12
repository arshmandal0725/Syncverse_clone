import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncverse_clone/modules/home_screen/views/drawer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:syncverse_clone/modules/login_screen/views/login_screen_view.dart';
import 'package:syncverse_clone/pages/addDevices_page.dart';
import 'package:syncverse_clone/pages/homepage.dart';
import 'package:get/get.dart';
import 'package:syncverse_clone/pages/profilePage.dart';
import 'package:syncverse_clone/wifi_connection.dart/wifi_list_1.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const AddDevices(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(231, 238, 250, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(231, 238, 250, 1),
        foregroundColor: Colors.black,
        title: Image.asset(
          'assets/SV.png',
          height: 20,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const WifiList());
              },
              icon: const Icon(Icons.wifi)),
        ],
      ),
      extendBody: true,
      drawer: MyDrawer(),
      body: _pages[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: SalomonBottomBar(
              unselectedItemColor: Colors.white,
              backgroundColor: const Color(0xfff1D3557),
              // backgroundColor: Colors.white,
              // margin: EdgeInsets.only(left: 10, right: 10),
              duration: const Duration(milliseconds: 3500),

              items: [
                SalomonBottomBarItem(
                    icon: Image.asset(
                      'assets/home.png',
                      height: 22,
                    ),
                    title: Text(''),
                    selectedColor: Colors.white
                    // selectedColor: Color(0xfff1D3557),
                    ),
                SalomonBottomBarItem(
                    icon: Image.asset(
                      'assets/devices.png',
                      height: 22,
                    ),
                    title: Text(''),
                    selectedColor: Colors.white
                    // selectedColor: Color(0xfff1D3557),
                    ),
                SalomonBottomBarItem(
                    icon: const Icon(
                      Icons.account_circle,
                      size: 30,
                    ),
                    title: Text(''),
                    selectedColor: Colors.white),
              ],
              currentIndex: _currentIndex,
              onTap: _onTabTapped,
            ),
          ),
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Image.asset('assets/sync.png'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active_outlined,
                size: 30,
              )),
          IconButton(
              onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const ProfilePage();
                  })),
              icon: const Icon(
                Icons.account_circle,
                size: 30,
              )),
        ],
      ),
      body: Container(
        color: Colors.green,
        child: const Center(
          child: Text(
            "Profile",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
