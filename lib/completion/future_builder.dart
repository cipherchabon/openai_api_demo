import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';

class CompletionFutureBuilder extends StatelessWidget {
  const CompletionFutureBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<OpenAICompletionModel>(
      future: OpenAI.instance.completion.create(
        model: "text-davinci-001",
        prompt: "Bitcoin is ",
        maxTokens: 64,
        temperature: 0.4,
        topP: 1,
        frequencyPenalty: 0,
        presencePenalty: 0,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final model = snapshot.data;
          final data = model.toString();
          return Text(data);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
