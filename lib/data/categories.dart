import 'package:demo6/models/categories.dart';

import 'data.dart';

List<Catagories> catagories1 = categories
    .map((categories) => Catagories(
          name: categories['name'],
          iconPath: categories['iconPath'],
          icon: categories['icon'],
          tag: categories['tag'],
        ))
    .toList();
