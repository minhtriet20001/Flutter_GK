import 'package:demo6/models/Note.dart';
import 'package:demo6/models/categories.dart';

import 'data.dart';

List<Note> note1 = note
    .map((note) => Note(
          name: note['name'] as String,
          image: note['image'] as String,
          time: note['time'] as String,
        ))
    .toList();
