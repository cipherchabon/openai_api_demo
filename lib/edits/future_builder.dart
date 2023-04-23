import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';

class EditFutureBuilder extends StatelessWidget {
  const EditFutureBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<OpenAIEditModel>(
      future: OpenAI.instance.edit.create(
        model: "text-davinci-edit-001",
        instruction: "remote all '!' from input text",
        input: "Hello!!, I! need to be ! somethi!ng",
        n: 1,
        temperature: 0.8,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return Text(data?.choices.first.text ?? '');
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
