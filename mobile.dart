// ignore_for_file: unrelated_type_equality_checks

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> quoteList = [
    'ถ้าเธอชอบเขา.. เชิญไปเฝ้าอุทยาน',
    'ถ้าอยากให้รักยืนนาน คุณก็แค่ไม่ต้องนั่ง',
    'แคปชั่นไม่รู้ แคปหมูไม่แน่',
    'ถ้าไม่อยากเสียผมไป ก็อย่ากินผงชูรสเยอะ',
    'อย่าทำวันนี้ให้ดีที่สุด เดี๋ยวพรุ่งนี้ไม่มีไรทำ',
    'เปิดพัดลมที เหมือนกูวาร์ปไปนรก',

  ];
  static const List<Color> colorList = [
    Colors.green,
    Colors.red,
    Colors.blue,
  ];

  var quote = quoteList[0];
  var checkDup = 0;
  var color = colorList[0];
  var checkColor = 0;

  Color randomGenerator() {
    return colorList[Random().nextInt(colorList.length)];

  }

  void handleClickGo() {
    setState(() {
      var rand = Random();
      var randomIndex = rand.nextInt(quoteList.length);
      if (randomIndex == checkDup) {
        while (true) {
          randomIndex = rand.nextInt(quoteList.length);
          if (randomIndex != checkDup) {
            break;
          }
        }
        quote = quoteList[randomIndex];
        checkDup = randomIndex;
      } else {
        quote = quoteList[randomIndex];
        checkDup = randomIndex;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำคมกวนๆ')),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClickGo,
        child: const Text('GO'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            quote,
            style: TextStyle(
              color: randomGenerator(),
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
