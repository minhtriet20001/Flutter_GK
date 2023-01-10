import 'dart:typed_data';

import 'package:demo6/data/categories.dart';
import 'package:demo6/data/data.dart';
import 'package:demo6/data/list_detail.dart';
import 'package:demo6/data/type.dart';
import 'package:demo6/detail_category/detail.dart';
import 'package:demo6/home/homescreen.dart';
import 'package:demo6/models/product.dart';
import 'package:demo6/models/type.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:provider/provider.dart';

import '../api/notification.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({Key? key}) : super(key: key);

  @override
  State<DetailProduct> createState() => _DetailProductState();
  // final List<Product> product;
  // final String name;
  // @override
  // _DetailProductState createState() =>
  //     // ignore: no_logic_in_create_state
  //     _DetailProductState(name: name, product: product);
  // const DetailProduct({Key? key, required this.product, required this.name})
  //     : super(key: key);
}

class _DetailProductState extends State<DetailProduct> {
  @override
  void initState() {
    Provider.of<NotificationService>(context, listen: false).initialize();
    super.initState();
  }

  // final List<Product> product;
  // final String name;
  // _DetailProductState({Key? key, required this.product, required this.name});
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _boxHeight = 150.0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'assets/icon/angle_left_icon.png',
            width: 30,
            height: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'University Blue ',
              // product[0].name as String,
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
            Text(
              'SNEAKERS',
              style: TextStyle(color: Colors.black45, fontSize: 14.0),
            )
          ],
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Consumer<NotificationService>(
            builder: (context, model, _) => InkWell(
              onTap: () {
                model.instantNofitication();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Image.asset(
                  'assets/icon/notification_bell.png',
                  width: 25,
                ),
              ),
            ),
          ),
          // InkWell(
          //   onTap: () {

          //   },
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 10.0),
          //     child: Image.asset(
          //       'assets/icon/bacham.png',
          //       width: 25,
          //     ),
          //   ),
          // ),
          IconButton(
            icon: Image.asset('assets/icon/bacham.png'),
            iconSize: 18.0,
            onPressed: _showDialog,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              Stack(
                children: <Widget>[
                  _buildPageView(),
                  _buildCircleIndicator(),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color.fromRGBO(39, 39, 39, 1),
                  ),
                  height: 260,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 90.0, right: 90.0, top: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'assets/icon/like.png',
                                        color: Colors.white,
                                      ),
                                      iconSize: 12,
                                    ),
                                    Text(
                                      '123',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '456',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'assets/icon/dislike.png',
                                        color: Colors.white,
                                      ),
                                      iconSize: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        indent: 40,
                        endIndent: 40,
                        color: Colors.white10,
                      ),
                      SizedBox(
                        height: 50,
                        child: Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 2),
                                  child: Text(
                                    'P R I C E',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Text(
                                  "100USD/80EU/20L",
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        indent: 40,
                        endIndent: 40,
                        color: Colors.white10,
                      ),
                      SizedBox(
                        height: 50,
                        child: Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 2),
                                  child: Text(
                                    'R E L E A S E  D A T E',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Text(
                                  'MAY 16TH',
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        indent: 40,
                        endIndent: 40,
                        color: Colors.white10,
                      ),
                      SizedBox(
                        height: 50,
                        child: Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 2),
                                  child: Text(
                                    'S T Y L E  C O D E',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Text(
                                  'G23452',
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 12),
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromRGBO(39, 39, 39, 1),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 20, right: 20, bottom: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/icon/stockX.png',
                              height: 50,
                              width: 50,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '100USD',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'LOWEST ASK',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    indent: 40,
                    endIndent: 40,
                  ),
                  SizedBox(height: 2),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: catagories1.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius: BorderRadius.circular(10)),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(catagories1[index].tag as String,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromRGBO(39, 39, 39, 1),
              ),
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
              child: Text(
                'Air Jordan is an American brand of basketball shoes, athletic, casual, and style clothing produced by Nike. Founded in Chicago, Air Jordan was created for Hall of Fame former basketball player Michael Jordan during his time with the Chicago Bulls. The original Air Jordan sneakers were produced exclusively for Michael Jordan in late 1984.',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Myfont'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 75),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromRGBO(39, 39, 39, 1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        {}
                      },
                      icon: Image.asset('assets/icon/share.png')),
                  Text(
                    'Share item',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Container(
          child: Text(
            '                            S H O P                            ',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _showDialog() async {
    await showDialog<String>(
      builder: (context) => _SystemPadding(
        key: null,
        child: AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'Comment', hintText: 'Write something'),
                ),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            TextButton(
                child: const Text('Send'),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
      context: context,
    );
  }

  _buildPageView() {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        color: Colors.white,
      ),
      child: PageView.builder(
          itemCount: list_detail.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Image.asset(
                list_detail[index].image as String,
                // 'assets/product/matsaubape1.jpg',
                // type1[index].iconPath as String,
                width: 160,
                height: 200,
              ),
            );
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          }),
    );
  }

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: list_detail.length,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}
