import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wingman/screens/home/notification.dart';
import 'package:wingman/utils/colors.dart';
import 'package:wingman/utils/responsive.dart';
import 'package:wingman/utils/textstyle.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorWhite,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              title: Text(
                "DashBoard",
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
                        icon: const FaIcon(
                          FontAwesomeIcons.bell,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const NotificationsPage()));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: Container(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Text('EXPLORE'),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                'Discover',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(width: screenSize.width / 20),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                'Contact Us',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width / 50,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "List Of Account",
                      style: header2Style,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Card(
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: const LinearGradient(
                                    end: FractionalOffset.centerLeft,
                                    begin: FractionalOffset.centerRight,
                                    colors: [
                                      Colors.purpleAccent,
                                      Colors.deepPurple
                                    ])),
                            width: MediaQuery.of(context).size.width * .45,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Bank Account",
                                    style: cardStyle,
                                  ),
                                ),
                                Text(
                                  "\$2500.00",
                                  style: textSmallBold14,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: const LinearGradient(
                                    end: FractionalOffset.centerLeft,
                                    begin: FractionalOffset.centerRight,
                                    colors: [
                                      Color(0xffFBD8C6),
                                      Color(0xffFF978D),
                                    ])),
                            width: MediaQuery.of(context).size.width * .45,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Credit Card",
                                    style: cardStyle,
                                  ),
                                ),
                                Text(
                                  "\$1500.00",
                                  style: textSmallBold14,
                                ),

                                // Icons.audiotrack,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: const LinearGradient(
                                    end: FractionalOffset.centerLeft,
                                    begin: FractionalOffset.centerRight,
                                    colors: [
                                      // ignore: use_full_hex_values_for_flutter_colors
                                      Color(0xffffebfdfc),
                                      Color(0xff51eddb),
                                    ])),
                            width: MediaQuery.of(context).size.width * .45,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Cash",
                                    style: cardStyle,
                                  ),
                                ),
                                Text(
                                  "\$800.00",
                                  style: textSmallBold14,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              Stack(
                children: [
                  Center(
                    child: Card(
                      elevation: 4,
                      color: colorGrey,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 100,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    child: Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {},
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '\$48000.00',
                                style: card1Style,
                              ),
                              const Text('Total Balance'),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Text(
                      "Last Record OverView",
                      style: header2Style,
                    ),
                  ],
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {},
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: const LinearGradient(
                                    end: FractionalOffset.centerLeft,
                                    begin: FractionalOffset.centerRight,
                                    colors: [
                                      Color(0xffFBD8C6),
                                      Color(0xffFF978D),
                                    ])),
                            height: 85,
                            width: 100,
                            child: const Center(
                              child: Icon(
                                Icons.shopping_cart,
                                size: 50,
                                color: colorWhite,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 100,
                          top: 5,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            width: MediaQuery.of(context).size.width - 140,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Groceries',
                                        style: header2Style,
                                      ),
                                      Text(
                                        'Today',
                                        style: card3Style,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 30.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Credit Card',
                                          style: card3Style,
                                        ),
                                        const Text(
                                          '\$250.00',
                                          style: TextStyle(color: colorOrange),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {},
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: const LinearGradient(
                                    end: FractionalOffset.centerLeft,
                                    begin: FractionalOffset.centerRight,
                                    colors: [
                                      Colors.purpleAccent,
                                      Colors.deepPurple
                                    ])),
                            height: 85,
                            width: 100,
                            child: const Center(
                              child: FaIcon(
                                // ignore: deprecated_member_use
                                FontAwesomeIcons.tshirt,

                                size: 50,
                                color: colorWhite,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 100,
                          top: 5,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            width: MediaQuery.of(context).size.width - 140,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Clothes',
                                        style: header2Style,
                                      ),
                                      Text(
                                        'Today',
                                        style: card3Style,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 30.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Credit Card',
                                          style: card3Style,
                                        ),
                                        const Text(
                                          '\$800.00',
                                          style: TextStyle(color: colorPurple),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {},
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: const LinearGradient(
                                    end: FractionalOffset.centerLeft,
                                    begin: FractionalOffset.centerRight,
                                    colors: [
                                      // ignore: use_full_hex_values_for_flutter_colors
                                      Color(0xffffebfdfc),
                                      Color(0xff51eddb),
                                    ])),
                            height: 85,
                            width: 100,
                            child: const Center(
                              child: Icon(
                                Icons.home,
                                size: 50,
                                color: colorWhite,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 100,
                          top: 5,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            width: MediaQuery.of(context).size.width - 140,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Rental',
                                        style: header2Style,
                                      ),
                                      Text(
                                        'Today',
                                        style: card3Style,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 30.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Cash',
                                          style: card3Style,
                                        ),
                                        const Text(
                                          '\$48000.00',
                                          style: TextStyle(
                                            color: colorGreen,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
