

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bsu_aims/buttons/my_buttons.dart';
import 'package:bsu_aims/cuppertino/navigation_provider.dart';
import 'package:bsu_aims/pages/personal_profile.dart';
import 'package:bsu_aims/pages/login_page.dart';
import 'package:bsu_aims/widgets/go_premium.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../buttons/popupmenuDesign.dart';
import 'Drawerpage.dart';
import 'edit_profile.dart';



enum _MenuValues {
  logout,
  profile,

}

class HomePage extends StatefulWidget {



  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  var split;
  String? gsuite_email = "";
  String? gsuite_email2 = "";

  Future getEmail()async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState((){
      gsuite_email = preferences.getString('gsuite_email');

    });
    split = gsuite_email!.split("@");
  //  print("wow"+split[0]);

  }
  Future sendEmail() async{


  }

  Future logout(BuildContext context)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('gsuite_email');
/*
    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()
    ));

    */

    Navigator
        .of(context)
        .pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => LoginPage(

            )
        ));


  }


  void initState(){
    super.initState();
  getEmail();

  }







 // final user = FirebaseAuth.instance.currentUser!;




  void showAlert(BuildContext context){

  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(

      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body:

      SafeArea(

        child: Container(

          height: 520,
          padding: EdgeInsets.only(left: 30, top: 35, right: 30, bottom: 20),
          child: Container(

            decoration: BoxDecoration(color: Colors.white,


              borderRadius: BorderRadius.circular(55),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10.0,
                    color: Colors.black12,
                    spreadRadius: (15.15) //(x,y)

                ),
              ],

            ),


            child: DrawerHeader(

              decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  width: 0,
                  color: Colors.white,
                ),

                boxShadow: [
                  BoxShadow(

                      color: Colors.white,
                      spreadRadius: (10.10) //(x,y)

                  ),
                ],

              ),
              child: Column(

                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                 /* Container(

                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    shape: BoxShape.circle
                                ),
                                child: Icon(Icons.verified_user,
                                  color: Colors.white,
                                  size: 35,
                                ),

                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(

                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Welcome Back User!',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(gsuite_email!,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        /*
                Positioned(
                  bottom: 15,
                  right: 15,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.mood,
                    color: Colors.white,
                    ),
                  ),
                ),
*/
                      ],
                    ),
                  ),
                  */
              /*
                  Container(

                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Pick to do:',
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  */
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround, //change here don't //worked
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [

                        MyButton(
                          buttontapped: () {
                            setState(() {
                              /*
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context){
                                 // return Schedule();
                                },
                                ),
                              );
                                */
                            });
                          },
                          buttonText:  'Dashboard',
                          iconImagePath: 'assets/dashboard(red).png',



                        ),



                        MyButton(
                          buttontapped: () {
                            setState(() {
                              /*
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context){
                                  return chat();
                                },
                                ),
                              );
                              */
                            });

                          },



                          buttonText: 'Appointment',
                          iconImagePath: 'assets/calendarA.png',

                        ),





                      ],


                    ),


                  ),

                  SizedBox(height: 2),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround, //change here don't //worked
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [

                        MyButton(
                          buttontapped: () {
                            setState(() {
                          /*
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context){
                                 // return Schedule();
                                },
                                ),
                              );
                                */
                            });
                          },
                          buttonText:  'Documents',
                          iconImagePath: 'assets/folder.png',



                        ),



                        MyButton(
                          buttontapped: () {
                            setState(() {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context){
                                  return DrawerPage();


                                },
                                ),
                              );
                            });

                          },



                          buttonText: 'Profile',
                          iconImagePath: 'assets/user(red).png',

                        ),





                      ],


                    ),


                  ),


                  SizedBox(height: 2),

                  Padding(padding:  EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround, //change here don't //worked
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          MyButton(
                            buttontapped: () {
                              setState(() {
                              /*
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context){
                                    return Settings();
                                  },
                                  ),
                                );
                                */

                              });
                            },

                            buttonText: 'Vax. & Ins',
                            iconImagePath: 'assets/file(red).png',



                          ),



                          MyButton(
                            buttontapped: () {
                              setState(() {



                              });
                            },

                            buttonText: 'Password',
                            iconImagePath: 'assets/settings(red).png',



                          ),



                        ]
                    ),


                  ),






/*



                  Padding(
                   padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Row(children: [
                          Container(height: 80,
                          padding: EdgeInsets.all(12),
                          decoration:

                          BoxDecoration(
                              color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),

                          ),
                          child: Image.asset('assets/analytics.png'),
                          ),
                          Column(
                            children: [
                              Text('Statistics',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text('View Statistics',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey
                                    //41:37
                              )
                              )
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios)



                        ],)
                      ],
                    ),
                  )
*/

                ],

              ),
            ),
          ),
        ),
      ),

      //bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      /*
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        elevation: 0,
        backgroundColor: Colors.black,
        onPressed: () {





        },
        child: Icon(Icons.lock_open_outlined,
        size: 35,),
      ),
    */

    );
  }

  Widget _buildBottomNavigationBar() {

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),

          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10
            )
          ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),

        ),
        child: BottomNavigationBar(

          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home_rounded,
                  size: 30,
                )),
            BottomNavigationBarItem(

                label: 'Settings',
                icon: Icon(Icons.person_rounded,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }



  AppBar _buildAppBar() {
    return AppBar(

      toolbarHeight: 70,
      backgroundColor: Colors.transparent,

      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [




          Container(
            height: 40,
            width: 40,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset('assets/BatStateU-NEU-Logo.png',

              ),
            ),
          ),
          SizedBox(width: 10),
          Text('BatStateU - Health Portal',
            style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold
            ),
          ),

        ],
      ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35)),
        gradient: LinearGradient(
          colors: [Color(0xffe04556),Color(0xffe04556)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter
        )
      ),
    ),
      actions: [
/*
        Icon(
          Icons.more_vert,
        color: Colors.black,
          size: 40,

        )
        */
        PopupMenuButton(
            offset: Offset(0, 50),
            shape: const TooltipShape(),
            onSelected: (value){
              if(value == _MenuValues.logout){

                AwesomeDialog(
                  dismissOnBackKeyPress: false,
                  dismissOnTouchOutside: false,
                  context: context,
                  dialogType: DialogType.INFO_REVERSED,
                  animType: AnimType.SCALE,
                  title: 'Logout User',
                  desc: 'Do you want to logout?',
                  body: SafeArea(
                    child: Center(child: Column(
                      children: [

                        SizedBox(height: 5,),
                        Text(

                          'Do you want to log out?',

                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.bold

                          ),
                        ),

                      ],

                    ),
                    ),
                  ),

                  buttonsTextStyle: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.bold

                ),

                  btnOkText: "Yes",
                  btnCancelText: "No",
                  btnCancelColor:  Color(0xffe04556),
                    btnOkColor:  Color(0xff98c1d9),
                  btnCancelOnPress: () {

                  },
                  btnOkOnPress: () {
                  //  FirebaseAuth.instance.signOut();
                    logout(context);
                  },
                )..show();
              }
              else if(value == _MenuValues.profile){

                AwesomeDialog(

                  context: context,
                  dialogType: DialogType.NO_HEADER,
                  animType: AnimType.SCALE,
                  title: 'Logout User',
                  desc: 'Do you want to logout?',
                  body: SafeArea(
                    child: Center(child: Column(
                      children: [

                        SizedBox(height: 5,),
                        Text(

                          'Gsuite email',

                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.bold

                          ),
                        ),
                        SizedBox(height: 10),
                        Text(

                            gsuite_email!,

                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.bold

                          ),
                        ),

                      ],

                    ),
                    ),
                  ),


                )..show();

              }

            },
            icon:  Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,

            ),

            itemBuilder: (context) =>   [


              PopupMenuItem(

                value: _MenuValues.profile,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.perm_contact_cal_outlined,
                          size: 20,
                          color: Colors.black45,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("User",
                          style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                /*
                  child:
                      */

              ),

              PopupMenuItem(

                value: _MenuValues.logout,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.logout,
                          size: 20,
                          color: Colors.black45,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Log out",
                          style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                /*
                  child:
                      */

              ),
            ])

      ],

    );
  }
}
