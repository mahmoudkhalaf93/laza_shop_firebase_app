import 'package:audioplayers/audioplayers.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

class AudioRecordingService {
  final AudioRecorder _audioRecorder = AudioRecorder();
  final AudioPlayer _audioPlayer = AudioPlayer();

  String? _recordedFilePath;

  Future<bool> hasPermission() async {
    return await _audioRecorder.hasPermission();
  }

  Future<void> startRecording() async {
    if (await hasPermission()) {
      final directory = await getApplicationDocumentsDirectory();
      _recordedFilePath = '${directory.path}/recorded_audio.m4a';

      await _audioRecorder.start(
        const RecordConfig(),
        path: _recordedFilePath!,
      );
    }
  }

  Future<String?> stopRecording() async {
    final path = await _audioRecorder.stop();
    _recordedFilePath = path;
    return path;
  }

  Future<void> playAudio(String? path) async {
    final pathToPlay = path ?? _recordedFilePath;
    if (pathToPlay != null) {
      await _audioPlayer.play(DeviceFileSource(pathToPlay));
    }
  }

  Future<void> stopAudio() async {
    await _audioPlayer.stop();
  }

  void dispose() {
    _audioRecorder.dispose();
    _audioPlayer.dispose();
  }
}
