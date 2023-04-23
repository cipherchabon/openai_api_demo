import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';

class CreateImageFutureBuilder extends StatelessWidget {
  const CreateImageFutureBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<OpenAIImageModel>(
      future: OpenAI.instance.image.create(
        prompt: 'The last bitcoin is mined',
        n: 1,
        size: OpenAIImageSize.size1024,
        responseFormat: OpenAIImageResponseFormat.url,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data?.data;
          final url = data?.first.url;
          if (url != null) {
            return Image.network(url);
          }

          return Text(data.toString());
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
