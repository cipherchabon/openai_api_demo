import 'dart:developer';
import 'dart:io';

import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class TranscriptionWidget extends StatefulWidget {
  const TranscriptionWidget({
    super.key,
  });

  @override
  State<TranscriptionWidget> createState() => _TranscriptionWidgetState();
}

class _TranscriptionWidgetState extends State<TranscriptionWidget> {
  late Record record;

  bool _isListening = false;
  bool _isProcessing = false;

  File? _audioFile;

  OpenAIAudioModel? _transcription;

  @override
  void initState() {
    super.initState();
    record = Record();
  }

  Future<void> startRecording() async {
    if (await record.hasPermission()) {
      setState(() {
        _isListening = true;
      });

      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      _audioFile = File('$path/myVoice_$timestamp.m4a');

      await record.start(
        path: _audioFile?.uri.toString(),
      );
    }
  }

  Future<void> stopRecording() async {
    await record.stop();

    setState(() {
      _isListening = false;
    });
  }

  Future<void> createTranscription() async {
    setState(() {
      _isProcessing = true;
    });

    if (_audioFile != null) {
      _transcription = await OpenAI.instance.audio.createTranscription(
        file: _audioFile!,
        model: "whisper-1",
        responseFormat: OpenAIAudioResponseFormat.json,
      );
    }

    setState(() {
      _isProcessing = false;
    });
  }

  onPressed() async {
    try {
      if (!_isListening) {
        await startRecording();
      } else {
        await stopRecording();
        await createTranscription();
      }
    } catch (e) {
      log(e.toString());
    } finally {
      setState(() {});
    }
  }

  @override
  void dispose() {
    record.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            _isListening ? Icons.stop : Icons.mic,
            color: _isListening ? Colors.red : Colors.grey,
          ),
        ),
        Text(_isListening ? 'Listening...' : 'Record'),
        if (_isProcessing && _audioFile != null) Text('Processing...'),
        if (_transcription != null) Text(_transcription!.text),
      ],
    );
  }
}
