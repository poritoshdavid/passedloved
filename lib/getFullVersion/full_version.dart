import 'package:passedloved/data/data.dart';
import 'package:passedloved/widgets/responsible.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GetFullVersn extends StatefulWidget {
  const GetFullVersn({Key? key}) : super(key: key);

  @override
  _GetFullVersnState createState() => _GetFullVersnState();
}

class _GetFullVersnState extends State<GetFullVersn> {
  final GlobalKey<ScaffoldState> globalkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: globalkey,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Responsible.height * 0.60),
        child: Container(
          margin: EdgeInsets.only(top: Responsible.height * 0.03),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 10.0,
                  left: 10.0,
                  right: 10.0,
                ),
                child: IconButton(
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
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Animal Underworld Wisdom',
                    softWrap: true,
                    maxLines: 4,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Responsible.fontSize * 1.5,
                      fontWeight: FontWeight.w500,
                      // letterSpacing: 1.5,
                      shadows: const <Shadow>[
                        Shadow(
                          color: Colors.black,
                          offset: Offset(1.8, 1.5),
                          blurRadius: 2.0,
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
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            height: height,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(StaticData.backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'When you unlock this app, you will be able to browse all the 77 cards, and use the full deck.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Responsible.fontSize * 1.13,
                            fontFamily: "opensans",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Press the "Buy Full Version" button to get the full version.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Responsible.fontSize * 1.13,
                            fontFamily: "opensans",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Responsible.height * 0.018,
                      ),
                      InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Wait for url")));
                          // lounchUrl(
                          //     'https://play.google.com/store/apps/details?id=com.crystalmedicinewisdom.full');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Text(
                            'Buy Full Verision',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Responsible.fontSize,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  lounchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
