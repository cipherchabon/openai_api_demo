import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';

class CompletionStreamBuilder extends StatefulWidget {
  final String prompt;

  const CompletionStreamBuilder(
    this.prompt, {
    super.key,
  });

  @override
  State<CompletionStreamBuilder> createState() =>
      _CompletionStreamBuilderState();
}

class _CompletionStreamBuilderState extends State<CompletionStreamBuilder> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OpenAIStreamCompletionModel>(
      stream: OpenAI.instance.completion.createStream(
        model: "text-davinci-003",
        prompt: widget.prompt,
        maxTokens: 100,
        temperature: 0.5,
        topP: 1,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final model = snapshot.data as OpenAIStreamCompletionModel;
          text += model.choices.first.text;
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
