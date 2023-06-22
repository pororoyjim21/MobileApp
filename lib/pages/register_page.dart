

import 'dart:convert';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RegisterPage extends StatefulWidget {


  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  FocusNode focusNode = FocusNode();
  final _formkey =GlobalKey<FormState>();
  bool proccessing = false;

  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController =TextEditingController();
  bool isLoading = false;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool checkBoxvalue = false;
  bool _isObscure = true;

  @override
  void dispose() {

    _emailController.dispose();
  _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }


  Future signUp() async {

    FocusScope.of(context).unfocus();
    setState(() {
      proccessing = true;
    });
    if (passwordConfirmed()) {


      var url = "https://bsu-aims.000webhostapp.com/login_flutter/register.php";
      String gsuite_email = _emailController.text;
      String pass = _passwordController.text;


      var res = await http.post(
          Uri.parse(url),
          body: {
            "gsuite": gsuite_email,
            "password": pass
          }
      );


      // final data = json.decode(res.body);

      var data = json.decode(res.body);

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
      if (data == 'Error') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.TOPSLIDE,

          body: Center(child: Column(
            children: [
              Text(

                'Account already exist!',
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5,),
              Text(

                'Please try again',
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

        )
          ..show();
      }
      else if (data == 'Success') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.TOPSLIDE,

          body: Center(child: Column(
            children: [
              Text(

                'Successfully created!',
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5,)


            ],

          ),
          ),


          btnOkOnPress: () {

          },

        )
          ..show();
      }



    }

    setState(() {
      proccessing = false;
    });

  }


/*
  Future  signUp() async {

    if (passwordConfirmed()){

      try {



        final credentials = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),


        )
            .then((value) =>
        {
          FirebaseFirestore.instance.collection('users')
              .doc(value.user?.uid)
              .set(
              {"acc_classification": "student",
                "acc_type": "patient",
                "barangay": "not identified",
                "birth_barangay": "not identified",
                "birth_municipality": "not identified",
                "birth_province": "not identified",
                "birthdate": "not identified",
                "civil_status" : "not identified",
                "department": "not identified",
                "emerg_contact": "not identified",
                "emerg_fn": "not identified",
                "emerg_ln": "not identified",
                "emerg_relation": "not identified",
                "first_name": "",
                "gender": "Prefer not to say",
                "gsuite_email": "not identified",
                "last_name": "",
                "middle_name": "",
                "municipality": "not identified",
                "personal_contact": "not identified",
                "personal_email": value.user?.email,
                "program": "not identified",
                "province": "not identified",
                "religion" : "not identified",
                "sr_code": "not identified",
                "status": "active",
                "uid": value.user?.uid,


              }),


        }).then((value) =>

        {
          FirebaseAuth.instance.signOut(),

          AwesomeDialog(

            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.TOPSLIDE,
            title: "Registered Succesfully!",
            btnOkOnPress: () {


            },

          )
            ..show(),




        });

      } on FirebaseAuthException catch (e) {

        if (e.code == 'weak-password') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.TOPSLIDE,

            body: Center(child: Column(
              children: [
                Text(

                  'Password is to short!',
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 5,),
                Text(

                  'must have 6 letters or numbers',
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

          )
            ..show();

        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,

            body: Center(child: Column(
              children: [
                Text(

                  'Email already exist!',
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 5,),
                Text(

                  'Please try again',
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                ),

              ],

            ),
            ),



            btnOkOnPress: () {},

          )
            ..show();
        }
      } catch (e) {
        print(e);
      }

      // add user details
    }


  }

*/
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
    else if(!regex.hasMatch(value)  == true ){
      return 'Enter a valid email address!';
    }
    else if(!regex2.hasMatch(value) == true ){
      return 'Email address should be gsuite account';
    }
    else
      return null;
  }
  bool passwordConfirmed() {

    if(_passwordController.text.trim() == _confirmpasswordController.text.trim()

    ){


      return true;


    }
    else{

      AwesomeDialog(
        context: context,
        dialogType: DialogType.INFO_REVERSED,
        animType: AnimType.TOPSLIDE,

        body: Center(child: Column(
          children: [
            Text(

              'Password do not match!',
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 5,)


          ],

        ),
        ),


        btnOkOnPress: () {

        },

      )
        ..show();

      return false;

    }
  }

  @override
  Widget build(BuildContext context) {
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
                        'Register below with your details !!',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 30),



                      //email textfield
                      Padding(
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


                                    labelText: 'Email',
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
                      //Confirm password
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
                              controller: _confirmpasswordController,
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
                                labelText: "Confirm Password",
                                hintText: '',
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(5), // add padding to adjust icon
                                  child: Icon(Icons.lock,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              validator: (validate){
                                if (validate!.isNotEmpty && validate.length >=6 ){
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
                        child: Container(
                            child: Row(
                              children: <Widget> [

                                Container(
                                  child: Checkbox(
                                    value: checkBoxvalue,

                                    onChanged:
                                        (bool? value) {

                                      setState(() {
                                        checkBoxvalue = value!;
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                  ),

                                ),
                                Text("Show password",



                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                  ),
                                )

                              ],
                            )
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
                            signUp();
                          },




                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(color: Colors.black54,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: proccessing == false ? Text('Sign Up',
                              style: GoogleFonts.montserrat(color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,

                              ),

                            ):  LoadingAnimationWidget.staggeredDotsWave(
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
                          Text('I am member!', style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),),
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Text(' Login now', style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),




                          //register button





                        ],
                      )],
                  ),
                ),



          ),
        ),
      ),
    );
  }
}
