import 'package:passedloved/data/data.dart';
import 'package:passedloved/widgets/responsible.dart';
import 'package:passedloved/widgets/routes.dart';
import 'package:passedloved/widgets/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home/home_page.dart';

class AboutKim extends StatefulWidget {
  const AboutKim({Key? key}) : super(key: key);
  @override
  _AboutKimState createState() => _AboutKimState();
}

class _AboutKimState extends State<AboutKim> {
  final globalkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: globalkey,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'About Author',
          softWrap: true,
          style: TextStyles().biggerTitle(),
        ),
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Responsible.fontSize*1.5,
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
                margin:
                    EdgeInsets.only(left: Responsible.width* 0.03,right: Responsible.width* 0.03, top: Responsible.height* 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black.withOpacity(0.5),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height:  Responsible.height *0.02),
                      Row(
                        children: [
                          Text(
                            'E-mail :',
                            style: TextStyles().normalReading(),
                          ),
                          SizedBox(width:  Responsible.height *0.02),
                          InkWell(
                            onTap: () =>
                                emailCopy(StaticData.email),
                            child: Text(
                              StaticData.email,
                              style: TextStyles().normalReading(),
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: Responsible.height *0.02),
                      Row(
                        children: [
                          Text(
                            'Website :',
                            style: TextStyles().normalReading(),
                          ),
                          SizedBox(width:  Responsible.height *0.02),
                          InkWell(
                            onTap: () =>
                                _launchInBrowser("${StaticData.websiteTwo}/subscribe"),
                            child: Text(
                              StaticData.websiteTwo,
                              style: TextStyles().normalReading(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Responsible.height*0.02),
                      Row(
                        children: [
                          Text(
                            'Facebook Page :',
                            style: TextStyles().normalReading(),
                          ),
                           SizedBox(width: Responsible.height*0.01),
                          InkWell(
                            onTap: () =>
                                _launchInBrowser(StaticData.facebookUrl),
                            child: SizedBox(
                              width: height * 0.22,
                              child: Text(
                                StaticData.facebookTitle,
                                style: TextStyles().normalReading(),
                              ),
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height:Responsible.height*0.03),
                      description(
                          'Kimberley Ann Doucette, otherwise known as, Kimspirational, is a born psychic medium, and certified Angel Therapy Practitioner Ⓡ, She has also been certified in Sound Light Healing and Peruvian Shamanism.'),
                       SizedBox(height: Responsible.height*0.01),
                      description(
                          'Her extensive travel has brought her knowledge from healers and shamans from around the world. Canadian born, she currently works between offices in Slovenia and Canada, doing in person and online psychic/mediumship consultations. She offers a variety of spiritual subjects both in person and through online courses.'),
                       SizedBox(height: Responsible.height*0.01),
                      description('Copyright 2022 By Kimberley Ann Doucette'),
                       SizedBox(height: Responsible.height*0.01),
                      description('Copyright 2022 Kimspirational'),
                       SizedBox(height:Responsible.height*0.01),
                      description(
                          'All rights reserved. No part of this may be reproduced by any mechanical, photographic, or electronic process, or in the form of a phonographic recording; nor may it be stored in a retrieval system, transmitted, or otherwise copied for public or private use - other than as brief quotations embodied in articles and reviews referencing author - and/or without prior written permission of the publisher. The intent of the author is only to offer information of a general nature to assist you in your journey of healing, self-discovery, spiritual growth and expansion. In the event you use any of the information given in the app, which is your free will right, the author and publisher assume no responsibility for your actions in any way, for yourself, or others you may read the cards for.'),
                       SizedBox(height:Responsible.height*0.01),
                      description(
                          'All artwork is copyright by the artist, Gorazd Roznik, and may not be reproduced by any means, electronic or otherwise, without first obtaining the permission of the artist.'),
                       SizedBox(height:Responsible.height*0.01),
                      description('Animal Underworld Wisdom'),
                      const SizedBox(height: 5.0),
                      description('Written by Kimberley Ann Doucette'),
                      const SizedBox(height: 5.0),
                      description('Artwork by Gorazd Roznik'),
                      const SizedBox(height: 5.0),
                      description(
                          'Photography by Patricia Bourque, Gorazd Rožnik, Kimberley A. Doucette and Pixabay.com'),
                       SizedBox(height: Responsible.height*0.01),
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
          height: Responsible.height * 0.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Routes(context: context).routePush( const passedloved());
                },
                child: SizedBox(
                height: Responsible.height*0.06,
                  child: Image.asset(StaticData.homeButton),
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
        style: TextStyles().normalReading(),
      ),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    Uri uri = Uri.parse("https://${url.toString().toLowerCase()}");
    try{
      await canLaunchUrl(uri);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 3),content: Text(url+e.toString()),));
    }
    // if (await canLaunchUrl(uri)) {
    //   await launchUrl(uri);
    // } else {
    //
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$url can't open. please try again!"),));
    // }
  }

  emailCopy(String email) {
    Clipboard.setData(ClipboardData(text: email)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text("Email address copied successfully", style: TextStyles().normalReading())));
    });
  }
}
