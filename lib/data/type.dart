import 'package:demo6/models/detail.dart';
import 'package:demo6/models/product.dart';
import 'package:demo6/models/type.dart';

import 'data.dart';

List<Type1> type1 = type.map((type) {
  return Type1(
      name: type['name'] as String,
      status: type['status'] as String,
      iconPath: type['iconPath'] as String,
      menu: (type['menu'] as List)
          .map((e) => Product(
                name: e['name'],
                iconPath: e['iconPath'],
                tag: e['tag'],
                // list: (e['list'] as List)
                //     .map((k) => Detail(
                //           name: k['name'],
                //           iconPath: k['iconPath'],
                //         ))
                //     .toList(),
              ))
          .toList());
}).toList();



// Future<List<Object>> check_list(int ID) async {
//   if (idD == idP) {
//     return sneaker;
//   }
//   if (ID == 2) {
//     return sneaker;
//   }

//   return [];
// }
