import 'dart:async';

import 'package:bsu_aims/pages/home_page.dart';
import 'package:bsu_aims/pages/register_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var gsuite_email = preferences.getString('gsuite_email');
  print(gsuite_email);
  runApp(MaterialApp

    (debugShowCheckedModeBanner: false,
    home: gsuite_email == null ? LoginPage(): HomePage(),

  )

  );


}


class LoginPage extends StatefulWidget{
  //final VoidCallback showRegisterPage;
 // const LoginPage({Key? key, }): super (key: key);


  @override
  State<LoginPage> createState() => _LoginPageState();



}



class _LoginPageState extends State<LoginPage>{

//  Timer? _timer;

  final _formkey =GlobalKey<FormState>();


  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool proccessing = false;
  // show the password or not
  bool _isObscure = true;
  bool _isLoading = true;
/*
  Future signIn() async{
    //loading circle


    try{

      showDialog(context: context,
          builder: (context){
            return Center(child: CircularProgressIndicator()
            );
          });

      final credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(

        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),

      );


      Navigator.of(context).pop();

    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();




      if (e.code == 'user-not-found') {

        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.SCALE,
          body: Center(child: Column(
            children: [
              Text(

                'Login Failed!',
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5,),
              Text(

                'Gmail not found',
                style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
              ),

            ],

          ),
          ),
          btnOkOnPress: () {

          },

        )..show();


      } else if (e.code == 'wrong-password') {




        AwesomeDialog(
          context: context,
          dialogType: DialogType.WARNING,
          animType: AnimType.SCALE,
          body: Center(child: Column(
            children: [
              Text(

                'Try again!',
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5,),
              Text(

                'Wrong password',
                style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
              ),

            ],

          ),
          ),


          btnOkOnPress: () {

          },

        )..show();

      }


    }




  }
  */




  Future signIn() async{

    FocusScope.of(context).unfocus();
    EasyLoading.show(status: 'Loading');

    setState(() {
      proccessing = true;
    });

      var url = "https://bsu-aims.000webhostapp.com/login_flutter/login.php";
      String gsuiteemail = _emailController.text;
      String pass = _passwordController.text;


      var res = await http.post(
          Uri.parse(url),
          body: {
            "gsuite": gsuiteemail,
            "password": pass
          }
      );


      // final data = json.decode(res.body);

      var data =  json.decode(res.body);

      // var data=json.decode(json.encode(res.body));
/*
  if (data == "account already exist") {
    print("account already exist");
  }
  else {
    if (data== 'true') {

      print("account created");
    }
    else {
      print("error2");
    }
  }

  */
      if (data.toString()== 'Success') {
        EasyLoading.dismiss();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('gsuite_email',_emailController.text);
/*
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        */
        //Navigator.of(context).pop();
        Navigator
            .of(context)
            .pushReplacement(
            MaterialPageRoute(
                builder: (BuildContext context) => HomePage(

                )
            ));



      }
      else{
        EasyLoading.dismiss();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.TOPSLIDE,


          body: Center(child: Column(
            children: [
              Text(

                'Login failed!',
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5,),
              Text(

                'Invalid username or password',
                style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
              ),

            ],

          ),
          ),
          btnOkColor:  Color(0xff98c1d9),
          btnOkText: "OK",



          btnOkOnPress: () {

          },

        )
          ..show();
      }










    setState(() {
      proccessing = false;
    });

  }
  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";

    RegExp regex = RegExp(pattern);

    String pattern2 =  "@g.batstate-u.edu.ph";
    RegExp regex2 = RegExp(pattern2);

    if (value == null || value.isEmpty  ){
      return 'This field is required!';
     }

    else
      return null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(

        backgroundColor: Colors.white,

        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset('assets/BatStateU-NEU-Logo.png'),
                        iconSize: 130,
                        onPressed: () {},
                      ),
                      // Hello again
                      SizedBox(height: 18,),
                      Text(
                        'BatStateU - Health',

                        style: GoogleFonts.montserrat(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Portal',

                        style: GoogleFonts.montserrat(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Divider(
                          thickness: 5,
                          indent: 100,
                          endIndent: 100,
                          color: Colors.black
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Please enter your login credentials',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'below.',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 50),



                      //email textfield
                      Container(
                        child: Padding(
                          padding:const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),



                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction ,
                                controller: _emailController,

                                style: GoogleFonts.montserrat(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal
                                ),
                                decoration: InputDecoration(
                                  errorStyle: GoogleFonts.montserrat(
                                      fontSize: 8.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                  ),
                                  focusedBorder: OutlineInputBorder(


                                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                  ),


                                  labelText: 'Email/Sr-Code',
                                  hintText: '',

                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(5), // add padding to adjust icon
                                    child: Icon(Icons.email,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                autofillHints: [AutofillHints.email],
                                validator: (validate) => validateEmail(validate),
                              ),



                            ),
                          ),
                        ),
                      ),
                      //password textfield
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction ,
                              controller: _passwordController,

                              style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal
                              ),
                              obscureText: _isObscure,
                              decoration: InputDecoration(

                                errorStyle: GoogleFonts.montserrat(
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.bold
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                ),
                                labelText: "Password",
                                hintText: '',
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(5), // add padding to adjust icon
                                  child: Icon(Icons.lock,
                                    color: Colors.black,
                                  ),


                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      _isObscure ? Icons.visibility :
                                      Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                  onPressed: (){
                                    setState((){
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                ),

                              ),
                              validator: (validate){
                                if (validate!.isNotEmpty && validate.length >=6){
                                  return null;
                                }else if(validate.length <= 5 && validate.isNotEmpty){
                                  return 'Passwords should be at least 6 characters long';
                                }else{
                                  return 'This field is required!';
                                }


                              },
                            ),
                          ),
                        ),
                      ),


                      SizedBox(height: 10),


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                /*
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context){
                                   return ForgotPasswordPage();
                                  },
                                  ),
                                );
                                */
                              },
                              child: Text(

                                'Forgot password?',
                                style: GoogleFonts.montserrat(
                                  color: Colors.blue,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      //sign in button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 85.0),
                        child: GestureDetector(
                          onTap: (){
                            if(!_formkey.currentState!.validate()){
                              return;
                            }
                            signIn();
                          },//
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(color: Colors.black54,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: proccessing == false ?  Text('Login',
                              style: GoogleFonts.montserrat(color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,

                              ),

                            ): LoadingAnimationWidget.staggeredDotsWave(
                                color: Colors.white,
                                size: 25.0,


                              )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),

                      //not a member ? register now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Not a member?', style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),),
                          GestureDetector(


                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(

                                    builder: (context) =>  RegisterPage()),
                              );

                            },

                            child: Text(' Register now', style: GoogleFonts.montserrat(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              //showdialog
                            ),
                            ),
                          ),




                          //register button





                        ],
                      ),

                    ]),
              ),
            ),
          ),
        ));

  }


}