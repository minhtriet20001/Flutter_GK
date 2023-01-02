import 'package:demo6/models/ListDetail.dart';

import 'data.dart';

List<ListDetail> list_detail = List_detail.map((list_detail) => ListDetail(
      image: list_detail['image'] as String,
    )).toList();
