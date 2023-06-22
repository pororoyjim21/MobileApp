import 'dart:async';
import 'dart:convert';
import 'package:bsu_aims/pages/personal_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:bsu_aims/buttons/my_buttons.dart';
import 'package:age_calculator/age_calculator.dart';
import 'package:bsu_aims/library/age.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cuppertino/drawer.dart';


class Edit_Profile extends StatelessWidget {
  const Edit_Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Profile(),

   );
  }
}

class Profile extends StatefulWidget {


  @override
  State<Profile> createState() => _ProfileState();
}






class _ProfileState extends State<Profile> {




    late bool isKeyboardVisible;



  @override




    var Screens = [/*Chats(),Calls()*/myProfile()];
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
        child: CupertinoTabScaffold(

      resizeToAvoidBottomInset: true,
      tabBar:    CupertinoTabBar(
        items: [
          /*
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.chat_bubble_2_fill),
                      label: "Chat"

                    ),

                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.phone),
                        label: "Calls"

                    ),
                    */
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_circle),
              label: "Profile"

          ),


          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings_solid),
              label: "Settings"

          ),

        ],

      ), tabBuilder: (BuildContext context, int index) {
      return Screens[index];
    },
    ));
  }
}







