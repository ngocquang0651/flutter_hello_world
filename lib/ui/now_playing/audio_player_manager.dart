import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class AudioPlayerManager {
  AudioPlayerManager({required this.songUrl});

  final player = AudioPlayer();
  Stream<DurationState>? durationState;
  String songUrl;

  void init() {
    durationState = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
        player.positionStream,
        player.playbackEventStream,
        (position, playBackEvent) => DurationState(
            buffered: playBackEvent.bufferedPosition,
            progress: position,
            total: playBackEvent.duration));
    player.setUrl(songUrl);
  }
}

class DurationState {
  DurationState({required this.buffered, required this.progress, this.total});

  final Duration progress;
  final Duration buffered;
  final Duration? total;
}
