import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wingman/utils/colors.dart';
import 'package:wingman/utils/textstyle.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, 
        ),
        title: Text(
          "Notifications",
          style: headerStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  color: colorBlack,
                  iconSize: 30.0,
                  padding: const EdgeInsets.only(left: 28.0),
                  icon: const FaIcon(FontAwesomeIcons.bell),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    SizedBox(
                      height: 100,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_1280.png'),
                        ),
                        title: Text(
                            "Neque porro quisquam est qui dolorem ipsum quia dolor "),
                        subtitle: Text('TWICE'),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                      child: ListTile(
                          leading: const CircleAvatar(
                            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_1280.png'),
                          ),
                          title: const Text(
                              "Neque porro quisquam est qui dolorem ipsum quia dolor "),
                          subtitle: const Text('TWICE'),
                          trailing: Container(
                            width: 50,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  end: FractionalOffset.centerLeft,
                                  begin: FractionalOffset.centerRight,
                                  colors: [
                                    Color(0xffFBD8C6),
                                    Color(0xffFF978D),
                                  ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Pay",
                                style: textSmallBold14,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    SizedBox(
                      height: 100,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_1280.png'),
                        ),
                        title: Text(
                            "Neque porro quisquam est qui dolorem ipsum quia dolor "),
                        subtitle: Text('TWICE'),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    SizedBox(
                      height: 100,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_1280.png'),
                        ),
                        title: Text(
                            "Neque porro quisquam est qui dolorem ipsum quia dolor "),
                        subtitle: Text('TWICE'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                          leading: const CircleAvatar(
                            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_1280.png'),
                          ),
                          title: const Text(
                              "Neque porro quisquam est qui dolorem ipsum quia dolor "),
                          subtitle: const Text('TWICE'),
                          trailing: Container(
                            // width: 80,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  end: FractionalOffset.centerLeft,
                                  begin: FractionalOffset.centerRight,
                                  colors: [
                                    // ignore: use_full_hex_values_for_flutter_colors
                                    Color(0xffFFEBFDFC),
                                    Color(0xff51eddb),
                                  ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Paid",
                                style: textSmallBold14,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
