/// https://platform.openai.com/docs/introduction
/// https://github.com/anasfik/openai

import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:openai_demo/env.dart';

import 'home_screen.dart';

void main() {
  OpenAI.apiKey = kOpenaiApiKey;
  OpenAI.organization = kOpenaiOrgID;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: HomeScreen(),
    );
  }
}
