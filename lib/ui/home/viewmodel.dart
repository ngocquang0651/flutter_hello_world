import 'dart:async';

import 'package:hello_world/data/repository/repository.dart';

import '../../data/model/song.dart';

class MusicAppViewModel {
  StreamController<List<Song>> songStream = StreamController();

  void loadSong() {
    final repository = DefaultRepository();
    repository.loadData().then((value) => songStream.add(value!));
  }
}
