import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


/*
class GoPremium extends StatelessWidget {

  String? gsuite_email = "";



  @override





}
*/



class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    String? gsuite_email = "";


    Future getEmail()async{

      SharedPreferences preferences = await SharedPreferences.getInstance();
      setState((){
        gsuite_email = preferences.getString('gsuite_email');
      });


    }

      return Container(

      );



  }
}

