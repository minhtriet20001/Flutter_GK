import 'package:demo6/data/categories.dart';
import 'package:demo6/data/type.dart';
import 'package:demo6/detail_category/detailproduct.dart';
import 'package:demo6/home/homescreen.dart';
import 'package:demo6/models/product.dart';
import 'package:demo6/models/type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class detailCategories extends StatefulWidget {
  final List<Product> product;
  final String name;
  @override
  _detailCategoriesState createState() =>
      // ignore: no_logic_in_create_state
      _detailCategoriesState(name: name, product: product);
  const detailCategories({Key? key, required this.product, required this.name})
      : super(key: key);
}

// ignore: camel_case_types
class _detailCategoriesState extends State<detailCategories> {
  final List<Product> product;
  final String name;
  _detailCategoriesState({Key? key, required this.product, required this.name});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(125),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/icon/angle-left.png',
                        width: 30,
                        height: 20,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                _BuildCategories()
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              if (name == "SNEAKERS") ...[
                _SneakerCategory(),
              ],
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: product.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15, top: 5, bottom: 12),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailProduct()),
                          );
                        },
                        child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(),
                              Image.asset(
                                product[index].iconPath as String,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product[index].name as String,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'INSTOCK',
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(6, 255, 96, 3),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(width: 60),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon:
                                    Image.asset('assets/icon/angle-right.png'),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
            ]),
          )),
    );
  }

  Widget _SneakerCategory() => Container(
        height: 120,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Dialogs.materialDialog(
                                  msg: "Please come back",
                                  title: 'Product is updating',
                                  color: Colors.white,
                                  // lottieBuilder: Lottie.asset(
                                  //   'assets/loading.json',
                                  //   fit: BoxFit.contain,
                                  // ),
                                  context: context,
                                  actions: [
                                    IconsButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      text: 'YES SIR',
                                      iconData: Icons.done,
                                      color: Color.fromARGB(255, 15, 15, 15),
                                      textStyle: TextStyle(color: Colors.white),
                                      iconColor: Colors.white,
                                    ),
                                  ],
                                );
                              },
                              child: Image.asset(
                                catagories1[index].iconPath as String,
                                height: 70,
                                width: 110,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/icon/restocks.png'),
                                const Text(
                                  'INSTOCK',
                                  style: TextStyle(
                                      color: Color.fromRGBO(6, 255, 96, 3),
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 40),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              );
            }),
      );

  Widget _BuildCategories() => Container(
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(44, 44, 44, 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          if (catagories1[index].name == 'Filter') {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SimpleDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0))),
                                    title: const Text('FILTER'),
                                    children: <Widget>[
                                      SimpleDialogOption(
                                        onPressed: () {},
                                        child: Text(
                                          'All',
                                          style: TextStyle(
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ),
                                      SimpleDialogOption(
                                        onPressed: () {
                                          // Navigator.pop(
                                          //     context, Department.state);
                                        },
                                        child: Text(
                                          'Nike',
                                          style: TextStyle(
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ),
                                      SimpleDialogOption(
                                        onPressed: () {
                                          // Navigator.pop(
                                          //     context, Department.state);
                                        },
                                        child: Text(
                                          'Adidas',
                                          style: TextStyle(
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ),
                                      SimpleDialogOption(
                                        onPressed: () {
                                          // Navigator.pop(
                                          //     context, Department.state);
                                        },
                                        child: Text(
                                          'Jordan',
                                          style: TextStyle(
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ),
                                      SimpleDialogOption(
                                        onPressed: () {
                                          // Navigator.pop(
                                          //     context, Department.state);
                                        },
                                        child: Text(
                                          'Yeezy',
                                          style: TextStyle(
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ),
                                      SimpleDialogOption(
                                        onPressed: () {
                                          // Navigator.pop(
                                          //     context, Department.state);
                                        },
                                        child: Text(
                                          'Off-white',
                                          style: TextStyle(
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ),
                                      SimpleDialogOption(
                                        onPressed: () {
                                          // Navigator.pop(
                                          //     context, Department.state);
                                        },
                                        child: Text(
                                          'All',
                                          style: TextStyle(
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          } else if (catagories1[index].name == 'Search') {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 55, vertical: 200),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0) //
                                          ),
                                    ),
                                    child: Stack(children: <Widget>[
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 270, top: 10),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'X',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 30, right: 120),
                                            child: Text(
                                              'S E A R C H',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 60,
                                            ),
                                            child: const Divider(
                                              height: 10,
                                              thickness: 2,
                                              indent: 20,
                                              endIndent: 20,
                                              color: Color.fromARGB(
                                                  255, 104, 101, 101),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 20),
                                            child: SizedBox(
                                              width: 260, // <-- Your width
                                              height: 45, // <-- Your height

                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.white,
                                                ),
                                                child: Text(
                                                  'G O',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ]),
                                  );
                                });
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 55, vertical: 200),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                    child: Stack(children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 50, top: 30),
                                        child: Image.asset(
                                          'assets/icon/monitoring.png',
                                          height: 150,
                                          width: 200,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: 200, left: 50),
                                        child: SizedBox(
                                          width: 200, // <-- Your width
                                          height: 45, // <-- Your height

                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.amber,
                                            ),
                                            child: Text(
                                              'Maintenance',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                                  );
                                });
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(catagories1[index].name as String,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100)),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(catagories1[index].icon as String),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      );
}
