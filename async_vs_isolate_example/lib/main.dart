import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "async vs isolate",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pink.withValues(alpha: 0.7),
      ),
      body: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Lottie.asset(
              "assets/lottie_animations/bouncing_ball.json",
              width: size.width / 1.5,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                backgroundColor: Colors.pink.withValues(alpha: 0.7),
              ),
              onPressed: () async {
                await asyncTask();
              },
              child: Text(
                "Task with await",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                backgroundColor: Colors.pink.withValues(alpha: 0.7),
              ),
              onPressed: () async {
                ReceivePort receivePort = ReceivePort();
                await Isolate.spawn(isolatesTask, receivePort.sendPort);
                receivePort.listen((i) {
                  print("Isolates task completed: $i");
                });
              },
              child: Text(
                "Task with isolates",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  asyncTask() async {
    int i = 0;
    for (int x = i; x < 1000000000; x++) {
      i = x++;
    }
    print("Async task completed: $i");
  }
}

isolatesTask(SendPort sendPort) {
  int i = 0;
  for (int x = i; x < 1000000000; x++) {
    i = x++;
  }
  sendPort.send(i);
}
