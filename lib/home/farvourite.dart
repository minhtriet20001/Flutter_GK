import 'package:demo6/data/announcent.dart';
import 'package:demo6/data/data.dart';
import 'package:demo6/data/type.dart';
import 'package:demo6/home/farvourite.dart';
import 'package:demo6/models/product.dart';
import 'package:flutter/material.dart';
import 'package:demo6/detail_category/detail.dart';
import 'package:demo6/home/dialog_list.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Image.asset(
            'assets/icon/angle_left_icon.png',
            color: Colors.white,
            width: 30,
            height: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Favourite"),
        actions: <Widget>[
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Image.asset(
                'assets/icon/notification_bell.png',
                width: 25,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 59, 59, 59),
          border: Border.all(width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: note1.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Color.fromARGB(255, 59, 59, 59),
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 10.0, color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Image.asset(
                            note1[index].image as String,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Row(
                          children: [
                            Text(
                              'RESTOCKS',
                              style: TextStyle(color: Colors.white),
                            ),
                            Image.asset(
                              'assets/icon/storm.png',
                              height: 18,
                              width: 24,
                            )
                          ],
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              note1[index].name as String,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              note1[index].time as String,
                              style: TextStyle(
                                  color: Colors.white38,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                        trailing: Container(
                          padding: EdgeInsets.only(top: 18),
                          child: ImageIcon(
                            AssetImage("assets/icon/angle-right.png"),
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        isThreeLine: true,
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
