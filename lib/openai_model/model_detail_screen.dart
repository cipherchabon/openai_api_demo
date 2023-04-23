import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';

class ModelDetailScreen extends StatelessWidget {
  final String modelId;

  const ModelDetailScreen(
    this.modelId, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Model Detail'),
      ),
      body: Center(
        child: FutureBuilder(
          future: OpenAI.instance.model.retrieve(modelId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final model = snapshot.data as OpenAIModelModel;
              return Text(model.toString());
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
