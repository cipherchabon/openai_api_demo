import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OpenAI Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: () {},
                child: Text('Completion'),
              ),
              const SizedBox(height: 16.0),
              FilledButton(
                onPressed: () {},
                child: Text('ChatGPT'),
              ),
              const SizedBox(height: 16.0),
              FilledButton(
                onPressed: () {},
                child: Text('Images with DALL-E'),
              ),
              const SizedBox(height: 16.0),
              FilledButton(
                onPressed: () {},
                child: Text('Edits'),
              ),
              const SizedBox(height: 16.0),
              FilledButton(
                onPressed: () {},
                child: Text('Audio Transcription'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
