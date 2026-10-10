import 'package:flutter/material.dart';
import '../services/audio_recording_service.dart';

class AudioFeatureScreen extends StatefulWidget {
  const AudioFeatureScreen({super.key});

  @override
  State<AudioFeatureScreen> createState() => _AudioFeatureScreenState();
}

class _AudioFeatureScreenState extends State<AudioFeatureScreen> {
  final AudioRecordingService _audioService = AudioRecordingService();

  bool _isRecording = false;
  bool _isPlaying = false;
  String? _recordedFilePath;

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  Future<void> _handleRecord() async {
    if (_isRecording) {
      final path = await _audioService.stopRecording();
      setState(() {
        _isRecording = false;
        _recordedFilePath = path;
      });
    } else {
      if (await _audioService.hasPermission()) {
        await _audioService.startRecording();
        setState(() {
          _isRecording = true;
          _recordedFilePath = null; // Clear old recording
        });
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Microphone permission denied.')),
          );
        }
      }
    }
  }

  Future<void> _handlePlay() async {
    if (_isPlaying) {
      await _audioService.stopAudio();
      setState(() => _isPlaying = false);
    } else {
      setState(() => _isPlaying = true);
      await _audioService.playAudio(_recordedFilePath);
      // Simulating stop after some time is complex without listening to player stream,
      // For simplicity in this demo, user must manually stop, or it will stop naturally at EOF
      // but UI won't update until tapped again. We will just leave it simple as requested.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio Recorder')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Status Icon
            Icon(
              _isRecording
                  ? Icons.mic
                  : (_recordedFilePath != null
                      ? Icons.check_circle
                      : Icons.mic_none),
              size: 80,
              color: _isRecording ? Colors.red : Colors.blueGrey,
            ),
            const SizedBox(height: 24),

            // Record Button
            ElevatedButton.icon(
              onPressed: _handleRecord,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _isRecording ? Colors.red : Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              icon: Icon(_isRecording ? Icons.stop : Icons.mic),
              label: Text(_isRecording ? 'Stop Recording' : 'Record Audio'),
            ),

            const SizedBox(height: 24),

            // Play Button (Visible only if recording exists)
            if (_recordedFilePath != null && !_isRecording)
              ElevatedButton.icon(
                onPressed: _handlePlay,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                icon: Icon(_isPlaying ? Icons.stop : Icons.play_arrow),
                label: Text(_isPlaying ? 'Stop Audio' : 'Play Audio'),
              ),
          ],
        ),
      ),
    );
  }
}
