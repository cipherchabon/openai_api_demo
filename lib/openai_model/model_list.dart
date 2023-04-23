import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';

import 'model_detail_screen.dart';

class OpenAIModelList extends StatelessWidget {
  const OpenAIModelList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: OpenAI.instance.model.list(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final models = snapshot.data as List<OpenAIModelModel>;
          return Expanded(
            child: ListView.builder(
              itemCount: models.length,
              itemBuilder: (context, index) {
                final model = models[index];
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ModelDetailScreen(model.id),
                      ),
                    );
                  },
                  title: Text(model.id),
                );
              },
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
