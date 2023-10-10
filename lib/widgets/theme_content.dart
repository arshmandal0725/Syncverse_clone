import 'package:flutter/material.dart';

class ContentShowModel extends StatelessWidget {
  const ContentShowModel(
      {super.key,
      required this.color,
      required this.theme,
      required this.value});
  final Color color;
  final String theme;
  final int value;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0), // Adjus
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
            color: color.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30)),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.45 * 0.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: color),
            ),
            Positioned(
                child: Container(
              height: MediaQuery.of(context).size.height * 0.1 * 0.1,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white60,
                    Colors.white54,
                    Colors.white10,
                    Colors.transparent
                  ],
                  stops: [0.2, 0.4, 0.99, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            )),
            Positioned(
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white60,
                        Colors.white12,
                        Colors.transparent
                      ],
                      stops: [0.1, 0.44, 1],
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter,
                    ),
                  ),
                )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.45 * 0.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.transparent),
              child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        theme,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        '|',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.45,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      value.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
