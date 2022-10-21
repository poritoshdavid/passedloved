import 'package:passedloved/data/data.dart';
import 'package:passedloved/widgets/responsible.dart';
import 'package:flutter/material.dart';

import 'about_author.dart';

class AppAbout extends StatefulWidget {
  const AppAbout({Key? key}) : super(key: key);
  @override
  _AppAboutState createState() => _AppAboutState();
}

class _AppAboutState extends State<AppAbout> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Introduction',
          style: TextStyle(
            fontSize: Responsible.fontSize * 2.2,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
            shadows: const <Shadow>[
              Shadow(
                color: Colors.black,
                offset: Offset(1.5, 2.0),
                blurRadius: 0.5,
              ),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(StaticData.backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black.withOpacity(0.5),
                ),
                margin:
                    EdgeInsets.symmetric(horizontal: Responsible.width * 0.03),
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10.0),
                      description(StaticData.appAbout[0][0]),
                      const SizedBox(height: 15.0),
                      description(StaticData.appAbout[0][1]),
                      const SizedBox(height: 15.0),
                      description(StaticData.appAbout[0][2]),
                      const SizedBox(height: 15.0),
                      description('Kim'),
                      const SizedBox(height: 15.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent.withOpacity(0.0),
        elevation: 0,
        child: SizedBox(
          height: Responsible.height * 0.13,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Route route = MaterialPageRoute(
                      builder: (BuildContext context) => const AboutKim());
                  Navigator.push(context, route);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 15.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text('About Author',
                      style: TextStyle(
                        fontFamily: 'opensans',
                        fontSize: Responsible.fontSize,
                        color: Colors.white,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget description(String description) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        description,
        style: TextStyle(
          fontFamily: 'opensans',
          color: Colors.white,
          fontSize: Responsible.fontSize * 1.1,
        ),
      ),
    );
  }
}
