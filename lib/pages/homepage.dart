import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncverse_clone/providers/parametersProvider.dart';
import 'package:syncverse_clone/widgets/theme_content.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      ref.read(parameterProvider.notifier).parameterValue();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(231, 238, 250, 1),
      ),
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(top: 42, left: 15, right: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ContentShowModel(
                          color: const Color.fromARGB(255, 56, 57, 157),
                          theme: 'Temprature',
                          value: ref.watch(parameterProvider)["Temprature"]!,
                        ),
                        const Spacer(),
                        ContentShowModel(
                          color: const Color.fromARGB(255, 99, 131, 241),
                          theme: 'Gas',
                          value: ref.watch(parameterProvider)["Gas"]!,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        ContentShowModel(
                          color: const Color.fromARGB(255, 82, 82, 82),
                          theme: 'Humidity',
                          value: ref.watch(parameterProvider)["Humidity"]!,
                        ),
                        const Spacer(),
                        const ContentShowModel(
                          color: Color.fromARGB(255, 255, 159, 83),
                          theme: 'Temprature',
                          value: 50,
                        )
                      ],
                    )
                  ],
                ),
              )),
          Expanded(flex: 6, child: Container())
        ],
      ),
    );
  }
}
