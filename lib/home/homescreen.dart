import 'package:demo6/data/type.dart';
import 'package:demo6/detail_category/profile.dart';
import 'package:demo6/home/farvourite.dart';
import 'package:demo6/models/product.dart';
import 'package:demo6/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo6/detail_category/detail.dart';
import 'package:demo6/home/dialog_list.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class setAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final SimpleDialog dialog = SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Text('MORE'),
      children: [
        SimpleDialogItem(
          text: 'Currency',
          onPressed: () {
            Navigator.pop(context, 'Currency');
          },
        ),
        SimpleDialogItem(
          text: 'Time Zone',
          onPressed: () {
            Navigator.pop(context, 'Time Zone');
          },
        ),
        SimpleDialogItem(
          text: 'Instagram',
          onPressed: () {
            Navigator.pop(context, 'Instagram');
          },
        ),
        SimpleDialogItem(
          text: 'Leave A Review',
          onPressed: () {
            Navigator.pop(context, 'Leave A Review');
          },
        ),
        SimpleDialogItem(
          text: 'FAQ',
          onPressed: () {
            Navigator.pop(context, 'FAQ');
          },
        ),
        SimpleDialogItem(
          text: 'Terms & Conditions',
          onPressed: () {
            Navigator.pop(context, 'Terms & Conditions');
          },
        ),
        SimpleDialogItem(
          text: 'Privacy Policy',
          onPressed: () {
            Navigator.pop(context, 'Privacy Policy');
          },
        ),
        SimpleDialogItem(
          text: 'Contact',
          onPressed: () {
            Navigator.pop(context, 'Contact');
          },
        ),
        SimpleDialogItem(
          text: 'Change My Advert Preference',
          onPressed: () {
            Navigator.pop(context, 'Change My Advert Preference');
          },
        ),
      ],
    );
    return AppBar(
      title: Text(
        'Droplist',
        style: TextStyle(
          fontFamily: 'MyFont',
        ),
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showDialog<void>(context: context, builder: (context) => dialog);
            },
          );
        },
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Image.asset(
              'assets/icon/user.png',
              width: 30,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Favourite()),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Image.asset(
              'assets/icon/crown.png',
              width: 30,
            ),
          ),
        ),
        InkWell(
          onTap: () => Dialogs.bottomMaterialDialog(
            msg: "Today's promotion",
            title: 'HOT NEWS',
            color: Colors.white,
            // lottieBuilder: Lottie.asset(
            //   'assets/animation.json',
            //   fit: BoxFit.contain,
            // ),
            context: context,
            actions: [
              IconsButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: 'I understand ',
                iconData: Icons.done,
                color: Color.fromARGB(255, 15, 15, 15),
                textStyle: TextStyle(color: Colors.white),
                iconColor: Colors.white,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Image.asset(
              'assets/icon/notification.png',
              width: 30,
            ),
          ),
        ),
      ],
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: setAppbar(),
        body: buildImageCard(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignInScreen()));
          },
          child: Image.asset(
            'assets/icon/logout.png',
            height: 30,
            width: 30,
          ),
          backgroundColor: Colors.white,
        ),
      );

  Widget buildImageCard() => ListView.builder(
      itemCount: type1.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  color: Colors.black54,
                  height: 170,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Ink.image(
                    image: AssetImage(
                      type1[index].iconPath as String,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => detailCategories(
                                  product: type1[index].menu as List<Product>,
                                  name: type1[index].name as String)),
                        );
                      },
                    ),
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 75.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          type1[index].name as String,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          type1[index].status as String,
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
