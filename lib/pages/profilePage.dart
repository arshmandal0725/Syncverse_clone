import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(231, 238, 250, 1),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [Color(0xFF152D5E), Color(0x00152D5E)],
                  ),
                ),
                child: const Center(
                    child: CircleAvatar(
                  radius: 80,
                  child: Icon(
                    Icons.account_circle,
                    size: 160,
                  ),
                )),
              ),
              Card(
                elevation: 15,
                child: Container(
                  width: 327,
                  height: 370,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          onTap: () {},
                          leading: Image.asset(
                            'assets/personalIcons/profile.png',
                            height: 23,
                          ),
                          title: const Text('Name'),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Image.asset(
                            'assets/personalIcons/mail.png',
                            height: 23,
                          ),
                          title: const Text('Phone'),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Image.asset(
                            'assets/personalIcons/mail.png',
                            height: 23,
                          ),
                          title: const Text('E-mail Address'),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Image.asset(
                            'assets/personalIcons/location.png',
                            height: 23,
                          ),
                          title: const Text('Location'),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Image.asset(
                            'assets/personalIcons/hotel.png',
                            height: 23,
                          ),
                          title: const Text('Place of use'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
