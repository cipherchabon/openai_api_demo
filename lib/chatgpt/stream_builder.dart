import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';

class ChatGPTStreamBuilder extends StatefulWidget {
  const ChatGPTStreamBuilder({
    super.key,
  });

  @override
  State<ChatGPTStreamBuilder> createState() => _ChatGPTStreamBuilderState();
}

class _ChatGPTStreamBuilderState extends State<ChatGPTStreamBuilder> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OpenAIStreamChatCompletionModel>(
      stream: OpenAI.instance.chat.createStream(
        model: "gpt-3.5-turbo",
        messages: [
          OpenAIChatCompletionChoiceMessageModel(
            content: "Qué es bitcoin?",
            role: OpenAIChatMessageRole.user,
          )
        ],
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          text += (data?.choices.first.delta.content ?? '');
          return Text(text);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
