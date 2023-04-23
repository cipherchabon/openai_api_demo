import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';

class ChatGPTFutureBuilder extends StatelessWidget {
  const ChatGPTFutureBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<OpenAIChatCompletionModel>(
      future: OpenAI.instance.chat.create(
        model: "gpt-3.5-turbo",
        messages: [
          OpenAIChatCompletionChoiceMessageModel(
            content: "hello, what is Flutter and Dart ?",
            role: OpenAIChatMessageRole.user,
          ),
        ],
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final model = snapshot.data;
          final data = model?.choices.first.message.content ?? '';
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
