import 'dart:async';
import 'dart:convert';
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

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cuppertino/drawer.dart';
import '../widgets/go_premium.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';



class FamilyHomePage extends StatelessWidget {
  const FamilyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FamilyPage();
  }
}

class FamilyPage extends StatefulWidget {
  const FamilyPage({Key? key}) : super(key: key);

  @override
  State<FamilyPage> createState() => _FamilyPageState();
}

class _FamilyPageState extends State<FamilyPage> {

  DateTime selectedDate = DateTime.now();
  final _formkey =GlobalKey<FormState>();



  Timer? _timer;
  @override
  void initState() {
    readJson();
    readJson2();
    readJson3();
    super.initState();
    getEmail();




  }


  final Genderitems= ['Male','Female','Prefer not to say'];
  final yesORno = ['Yes','No'];
  final CivilStatusitems = ['Single','Married','Divorced','Separated','Widowed'];
  final Classification = ['Student','Teacher','School Personnel'];
  final items2 = ['ANY',"any"];
  List list = []; //for province
  List list2 = []; //for municipality
  List list3 = [];
  List tempList = [];
  List tempList2 = [];
  List Provincevalue=[];
  List Provincevalue2=[];


  Future<void> readJson() async {
    final String Region = await rootBundle.loadString('json/refprovince.json');
    // final data = await json.decode(Region);
    Map _mapRegion = jsonDecode(Region);
    list = _mapRegion["Province"];




    //ang list
    // ...
    /*
    final String Municipality = await rootBundle.loadString('json/refcitymun.json');
    Map _MapCitymun = jsonDecode(Municipality);
    list2 = _MapCitymun["Municipality"];

*/


  }

  Future<void> readJson2() async {

    //ang list
    // ...


    final String Municipality = await rootBundle.loadString('json/refcitymun.json');
    Map _MapCitymun = jsonDecode(Municipality);
    list3 = _MapCitymun["Municipality"];

    splitProv = newValue!.split("@");
    tempList= list3.where((o) => o['provCode'] == splitProv[1]).toList();
    finalProv = splitProv[1];
    print(finalProv);

    //Provincevalue = tempList.where((o) => o['provCode'] == newValue).toList();
  }

  Future<void> readJson3() async {

    //ang list
    // ...


    final String Brgy = await rootBundle.loadString('json/refbrgy.json');
    Map _MapBrgy = jsonDecode(Brgy);
    list2 = _MapBrgy["Brgy"];

    splitCitymun = newValue2!.split("@");
    tempList2= list2.where((o) => o['citymunCode'] == splitCitymun[1]).toList();
    finalCitymun =splitCitymun[1];
    print(finalCitymun);
    //Provincevalue = tempList.where((o) => o['provCode'] == newValue).toList();
  }
  Future<void> splitBarangay() async {
    //for

    splitBarangaydescode = newValue3!.split("@");

    finalBarangay =splitBarangaydescode[1];
    print(finalBarangay);

  }
  var _ageControllerFinal;











/*
  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('users')
      .snapshots();


*/




  //inal user = FirebaseAuth.instance.currentUser!;








  String? Gendervalue; //for gender value
  String? Civilvalue;// for civil status value
  String? ClassificationValue; // for classification value

  var splitProv;
  var splitCitymun;
  var splitBarangaydescode;

  var finalProv;
  var finalCitymun;
  var finalBarangay;

  String? ProvinceValue; //Province value
  String? newValue ; //for provCodeDesc value
  String? newValue2;//for citymun value
  String? newValue3;

  String? FamilyIllnessHistoryDiabetes;
  String? FamilyIllnessHistoryHeartDisease;
  String? FamilyIllnessHistoryMental;
  String? FamilyIllnessHistoryCancer;
  String? FamilyIllnessHistoryHypertension;
  String? FamilyIllnessHistoryKidneyDisease;
  String? FamilyIllnessHistoryEpilepsy;






  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  //Father
  final _firstNameFather = TextEditingController();
  final _middleNameFather = TextEditingController();
  final _lastNameFather = TextEditingController();
  final _suffixNameFather = TextEditingController();
  final _occupationFather = TextEditingController();
  //Mother
  final _firstNameMother = TextEditingController();
  final _middleNameMother = TextEditingController();
  final _lastNameMother = TextEditingController();
  final _suffixNameMother = TextEditingController();
  final _occupationMother = TextEditingController();

  final _parentMaritalstatus = TextEditingController();


  final _Landline = TextEditingController();
  final _personalEmail = TextEditingController();
  final _personalContact = TextEditingController();
  final _relationtotheuser = TextEditingController();



  final _dateinput = TextEditingController();


  var data;
  bool textEnable = false;
  Text? txt;

  getValueFromtxt() {

    var value = txt!.data;

    print(value);

  }
  bool proccessing = false;
  Future updateData() async{

    setState(() {
      proccessing = true;
    });



    var url = "https://bsu-aims.000webhostapp.com/login_flutter/update_profile.php";


    var res = await http.post(
        Uri.parse(url),
        body: {
          "gsuite": gsuite_email,
          "firstname" : _firstNameFather.text,
          "middlename" : _middleNameFather.text,
          "lastname" : _lastNameFather.text,
          "gender": Gendervalue,
          "provinceCode": finalProv,
          "citymunCode": finalCitymun,
          "barangayCode": finalBarangay,
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
    if (data == 'Something went wrong') {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.TOPSLIDE,

        body: Center(child: Column(
          children: [
            Text(

              'Something went wrong!',
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
    else {
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





    setState(() {
      proccessing = false;
    });

  }

/*

  Future updateData() async {

    var collection = FirebaseFirestore.instance.collection('users');
    collection
        .doc(user.uid) // <-- Doc ID where data should be updated.
        .update({
      'first_name': _firstName.text.trim(),
      'middle_name': _middleName.text.trim(),
      'last_name': _lastName.text.trim(),
      'gender': Gendervalue,
      'civil_status': Civilvalue,
      'personal_contact': _personalContact.text.trim(),
      'birth_province':newValue,
      'birth_municipality': newValue2,
      'birth_barangay' :newValue3,
      'religion' : _religion

    })
        .then((_) =>
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.SCALE,
      title: "Successfully updated!",
      btnOkOnPress: () {},

    )..show()
    )
        .catchError((error) => print('Failed: $error'));

  }
*/

  bool showPassword = false;
  @override
  void dispose() {
    //father
    _firstNameFather.dispose();
    _middleNameFather.dispose();
    _lastNameFather.dispose();
    _suffixNameFather.dispose();
    _occupationFather.dispose();
    //mother
    _firstNameMother.dispose();
    _middleNameMother.dispose();
    _lastNameMother.dispose();
    _suffixNameMother.dispose();
    _occupationMother.dispose();
    //--
    _parentMaritalstatus.dispose();


    _Landline.dispose();
    _nameController.dispose();
    _personalContact.dispose();
    _ageController.dispose();
    _relationtotheuser.dispose();


    super.dispose();







  }
  String? validateNumber(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

    RegExp regex = RegExp(pattern);


    if (value == null || value.isEmpty  ){
      return 'This field is required!';
    }
    else if(!regex.hasMatch(value)  == true ){
      return 'Please enter valid mobile number';
    }
    else
      return null;
  }
  String? validateLandline(String? value) {
    String pattern = r'^(\+\d{1,2}\s)?\(?\d{2}\)?[\s.-]\d{3}[\s.-]\d{4}$';

    RegExp regex = RegExp(pattern);


    if (value == null || value.isEmpty  ){
      return 'This field is required!';
    }
    else if(!regex.hasMatch(value)  == true ){
      return 'Please enter a valid Landline';

    }
    else
      return null;
  }


  String? validateBday(String? value) {
    String pattern =
        r"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$";

    RegExp regex = RegExp(pattern);



    if (value == null || value.isEmpty  ){
      return 'This field is required!';
    }
    else if(!regex.hasMatch(value)  == true ){
      return 'Enter a valid birtdate!';
    }
    else
      return null;
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";

    RegExp regex = RegExp(pattern);



    if (value == null || value.isEmpty  ){
      return 'This field is required!';
    }
    else if(!regex.hasMatch(value)  == true ){
      return 'Enter a valid email address!';
    }
    else
      return null;
  }



  String? gsuite_email = "";
  StreamController _streamController = StreamController();

  Future getEmail()async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState((){
      gsuite_email = preferences.getString('gsuite_email');

    });


  }




  Future getData() async {
    var url = 'placeholder muna';
    http.Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);

    //Add your data to stream
    _streamController.add(data);
  }



  FocusNode inputNode = FocusNode();
// to open keyboard call this function;
  void openKeyboard(){
    FocusScope.of(context).requestFocus(inputNode);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {


    //dito

    return Scaffold(
      key: _scaffoldKey,
      drawer: NavigationDrawerWidget(),
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Container(

          padding: EdgeInsets.only(left: 16, top: 25, right: 17),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Center(

                  child: Text(
                    "Family History",
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      letterSpacing: 4,
                      fontWeight: FontWeight.w500,


                    ),
                  ),


                ),
                SizedBox(
                  height: 15,
                ),
                /*
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 5,
                                color: Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://i.pinimg.com/550x/62/5e/6a/625e6a1f7dd8c2218a78c3c7217cd524.jpg",
                                )
                            )
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: Theme
                                    .of(context)
                                    .scaffoldBackgroundColor,
                              ),
                              color: Colors.green,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),


                */
                /*
                StreamBuilder(

                    stream: _streamController.stream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        */

                RawScrollbar(
                  thickness: 5,
                  thumbColor: Colors.grey,

                  radius: const Radius.circular(20),


                  child: Container(

                    decoration: BoxDecoration(color: Colors.white70,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10.0,
                            color: Colors.black12,
                            spreadRadius: (10.10) //(x,y)

                        ),
                      ],

                    ),
                    height: 490,

                    child: DrawerHeader(
                      decoration: BoxDecoration(color: Colors.white,
                        boxShadow: [
                          BoxShadow(

                              color: Colors.white,
                              spreadRadius: (8.8) //(x,y)

                          ),
                        ],

                      ),


                      child: SingleChildScrollView(

                          child: Form(
                            key: _formkey,
                            child: Column(

                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text("Father's Detail",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Fullname",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                //Text("\n"),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction ,
                                        controller: _firstNameFather,

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
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          labelText: "First",
                                          hintText: '',

                                        ),
                                        validator: (validate){
                                          if (validate!.isNotEmpty && validate.length >=2){
                                            return null;
                                          }else if(validate.length <= 2 && validate.isNotEmpty){
                                            return 'Firstname should be at least 2 characters long';
                                          }else{
                                            return 'This field is required!';
                                          }


                                        },
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),

                                //Text("\n"),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction ,
                                        controller: _middleNameFather,

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
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          labelText: "Middlename",
                                          hintText: '',

                                        ),
                                        validator: (validate){
                                          if (validate!.isNotEmpty ){
                                            return null;
                                          }else{
                                            return 'This field is required!';
                                          }


                                        },
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),

                                //Text("\n"),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction ,
                                        controller: _lastNameFather,

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
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          labelText: "Lastname",
                                          hintText: '',

                                        ),
                                        validator: (validate){
                                          if (validate!.isNotEmpty && validate.length >=2){
                                            return null;
                                          }else if(validate.length <= 2 && validate.isNotEmpty){
                                            return 'Lastname should be at least 2 characters long';
                                          }else{
                                            return 'This field is required!';
                                          }


                                        },
                                      ),
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Suffix Name: (Sr,Jr,I,II,..)",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction ,
                                        controller: _suffixNameFather,

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
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          labelText: "Suffix",
                                          hintText: '',

                                        ),

                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Occupation",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction ,
                                        controller: _occupationFather,

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
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          labelText: "",
                                          hintText: '',

                                        ),

                                      ),
                                    ),
                                  ),
                                ),



                                SizedBox(height: 10),

                                Align(
                                  alignment: Alignment.center,
                                  child: Text("Mother's Detail",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Fullname",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                //Text("\n"),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction ,
                                        controller: _firstNameMother,

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
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          labelText: "First",
                                          hintText: '',

                                        ),
                                        validator: (validate){
                                          if (validate!.isNotEmpty && validate.length >=2){
                                            return null;
                                          }else if(validate.length <= 2 && validate.isNotEmpty){
                                            return 'Firstname should be at least 2 characters long';
                                          }else{
                                            return 'This field is required!';
                                          }


                                        },
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),

                                //Text("\n"),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction ,
                                        controller: _middleNameMother,

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
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          labelText: "Middlename",
                                          hintText: '',

                                        ),
                                        validator: (validate){
                                          if (validate!.isNotEmpty ){
                                            return null;
                                          }else{
                                            return 'This field is required!';
                                          }


                                        },
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),

                                //Text("\n"),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction ,
                                        controller: _lastNameMother,

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
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          labelText: "Lastname",
                                          hintText: '',

                                        ),
                                        validator: (validate){
                                          if (validate!.isNotEmpty && validate.length >=2){
                                            return null;
                                          }else if(validate.length <= 2 && validate.isNotEmpty){
                                            return 'Lastname should be at least 2 characters long';
                                          }else{
                                            return 'This field is required!';
                                          }


                                        },
                                      ),
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Suffix Name: (Sr,Jr,I,II,..)",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction ,
                                        controller: _suffixNameMother,

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
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          labelText: "Suffix",
                                          hintText: '',

                                        ),

                                      ),
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Occupation",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction ,
                                        controller: _occupationMother,

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
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          labelText: "",
                                          hintText: '',

                                        ),

                                      ),
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Parent's marital status",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),

                                Padding(

                                  padding: const EdgeInsets.fromLTRB(5, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction ,
                                        controller: _parentMaritalstatus,

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
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 2.0),

                                          ),
                                          labelText: "",
                                          hintText: '',

                                        ),

                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text("Family Illness History",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                //Text("\n"),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Diabetes",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.fromBorderSide(
                                          BorderSide(color: Colors.grey, width: 2.0)
                                      ),
                                      borderRadius: BorderRadius.circular(5),

                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButton<String>(
                                            value: FamilyIllnessHistoryDiabetes,

                                            hint: Align(
                                              alignment: Alignment
                                                  .centerLeft,
                                              child: Text(
                                                  "--- Choose Yes or No ---",
                                                  style: GoogleFonts
                                                      .montserrat(
                                                      fontWeight: FontWeight
                                                          .normal,
                                                      fontSize: 13)
                                              ),

                                            ),


                                            icon: Icon(
                                              Icons.arrow_drop_down,

                                              size: 30,
                                            ),
                                            isExpanded: true,
                                            items: yesORno.map(
                                                buildMenuItem)
                                                .toList(),


                                            onChanged: (value) =>
                                                setState(() =>
                                                this.FamilyIllnessHistoryDiabetes =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),


                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Heart Disease",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.fromBorderSide(
                                          BorderSide(color: Colors.grey, width: 2.0)
                                      ),
                                      borderRadius: BorderRadius.circular(5),

                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButton<String>(
                                            value: FamilyIllnessHistoryHeartDisease,

                                            hint: Align(
                                              alignment: Alignment
                                                  .centerLeft,
                                              child: Text(
                                                  "--- Choose Yes or No ---",
                                                  style: GoogleFonts
                                                      .montserrat(
                                                      fontWeight: FontWeight
                                                          .normal,
                                                      fontSize: 13)
                                              ),

                                            ),


                                            icon: Icon(
                                              Icons.arrow_drop_down,

                                              size: 30,
                                            ),
                                            isExpanded: true,
                                            items: yesORno.map(
                                                buildMenuItem)
                                                .toList(),


                                            onChanged: (value) =>
                                                setState(() =>
                                                this.FamilyIllnessHistoryHeartDisease =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),


                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Mental",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.fromBorderSide(
                                          BorderSide(color: Colors.grey, width: 2.0)
                                      ),
                                      borderRadius: BorderRadius.circular(5),

                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButton<String>(
                                            value: FamilyIllnessHistoryMental,

                                            hint: Align(
                                              alignment: Alignment
                                                  .centerLeft,
                                              child: Text(
                                                  "--- Choose Yes or No ---",
                                                  style: GoogleFonts
                                                      .montserrat(
                                                      fontWeight: FontWeight
                                                          .normal,
                                                      fontSize: 13)
                                              ),

                                            ),


                                            icon: Icon(
                                              Icons.arrow_drop_down,

                                              size: 30,
                                            ),
                                            isExpanded: true,
                                            items: yesORno.map(
                                                buildMenuItem)
                                                .toList(),


                                            onChanged: (value) =>
                                                setState(() =>
                                                this.FamilyIllnessHistoryMental =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Cancer",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.fromBorderSide(
                                          BorderSide(color: Colors.grey, width: 2.0)
                                      ),
                                      borderRadius: BorderRadius.circular(5),

                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButton<String>(
                                            value: FamilyIllnessHistoryCancer,

                                            hint: Align(
                                              alignment: Alignment
                                                  .centerLeft,
                                              child: Text(
                                                  "--- Choose Yes or No ---",
                                                  style: GoogleFonts
                                                      .montserrat(
                                                      fontWeight: FontWeight
                                                          .normal,
                                                      fontSize: 13)
                                              ),

                                            ),


                                            icon: Icon(
                                              Icons.arrow_drop_down,

                                              size: 30,
                                            ),
                                            isExpanded: true,
                                            items: yesORno.map(
                                                buildMenuItem)
                                                .toList(),


                                            onChanged: (value) =>
                                                setState(() =>
                                                this.FamilyIllnessHistoryCancer =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Hypertension",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.fromBorderSide(
                                          BorderSide(color: Colors.grey, width: 2.0)
                                      ),
                                      borderRadius: BorderRadius.circular(5),

                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButton<String>(
                                            value: FamilyIllnessHistoryHypertension,

                                            hint: Align(
                                              alignment: Alignment
                                                  .centerLeft,
                                              child: Text(
                                                  "--- Choose Yes or No ---",
                                                  style: GoogleFonts
                                                      .montserrat(
                                                      fontWeight: FontWeight
                                                          .normal,
                                                      fontSize: 13)
                                              ),

                                            ),


                                            icon: Icon(
                                              Icons.arrow_drop_down,

                                              size: 30,
                                            ),
                                            isExpanded: true,
                                            items: yesORno.map(
                                                buildMenuItem)
                                                .toList(),


                                            onChanged: (value) =>
                                                setState(() =>
                                                this.FamilyIllnessHistoryHypertension =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Kidney Disease",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.fromBorderSide(
                                          BorderSide(color: Colors.grey, width: 2.0)
                                      ),
                                      borderRadius: BorderRadius.circular(5),

                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButton<String>(
                                            value: FamilyIllnessHistoryKidneyDisease,

                                            hint: Align(
                                              alignment: Alignment
                                                  .centerLeft,
                                              child: Text(
                                                  "--- Choose Yes or No ---",
                                                  style: GoogleFonts
                                                      .montserrat(
                                                      fontWeight: FontWeight
                                                          .normal,
                                                      fontSize: 13)
                                              ),

                                            ),


                                            icon: Icon(
                                              Icons.arrow_drop_down,

                                              size: 30,
                                            ),
                                            isExpanded: true,
                                            items: yesORno.map(
                                                buildMenuItem)
                                                .toList(),


                                            onChanged: (value) =>
                                                setState(() =>
                                                this.FamilyIllnessHistoryKidneyDisease =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Epilepsy",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 2, 8, 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.fromBorderSide(
                                          BorderSide(color: Colors.grey, width: 2.0)
                                      ),
                                      borderRadius: BorderRadius.circular(5),

                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButton<String>(
                                            value: FamilyIllnessHistoryEpilepsy,

                                            hint: Align(
                                              alignment: Alignment
                                                  .centerLeft,
                                              child: Text(
                                                  "--- Choose Yes or No ---",
                                                  style: GoogleFonts
                                                      .montserrat(
                                                      fontWeight: FontWeight
                                                          .normal,
                                                      fontSize: 13)
                                              ),

                                            ),


                                            icon: Icon(
                                              Icons.arrow_drop_down,

                                              size: 30,
                                            ),
                                            isExpanded: true,
                                            items: yesORno.map(
                                                buildMenuItem)
                                                .toList(),


                                            onChanged: (value) =>
                                                setState(() =>
                                                this.FamilyIllnessHistoryEpilepsy =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),


                              ],

                            ),
                          )

                      ),


                    ),


                  ),
                ),

                SizedBox(
                  height: 35,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          //readJson();
                          // print(list);
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.INFO,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Edit Profile',
                            desc: 'Do you want to edit your profile?',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              //for enabling and setter of data
                              /*
                      _firstName.text = data["first_name"];
                      _middleName.text = data["middle_name"];
                      _lastName.text = data["last_name"];

                      setState(() => Gendervalue = data['gender']);
                        */

                              setState(() {
                                textEnable = !textEnable;

                              });
                              openKeyboard();
                            },
                          )..show();


                        },
                        child: Text("EDIT",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.black)),
                      ),
                      RaisedButton(
                          onPressed: (){

                            if(!_formkey.currentState!.validate()){
                              return;
                            }


                            if(newValue==null || newValue2 == null || newValue3 ==null || Gendervalue == null || Civilvalue ==null ){

                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.ERROR,
                                animType: AnimType.SCALE,
                                title: "Please Complete the details!",
                                btnOkOnPress: () {},

                              )..show();


                            }else{

                              updateData();
                            }


                          },

                          color:Color(0xffe04556),
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: proccessing == false ? Text("SAVE",
                            style: GoogleFonts.montserrat(

                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),




                          ):  LoadingAnimationWidget.staggeredDotsWave(
                            color: Colors.white,
                            size: 25.0,


                          )


                      )
                    ]
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
  DropdownMenuItem <String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: GoogleFonts.montserrat(fontWeight: FontWeight.normal, fontSize: 15),
    ),
  );
  AppBar _buildAppBar() {
    return AppBar(

      toolbarHeight: 70,
      backgroundColor: Colors.transparent,

      elevation: 0.0,
      title: Row(
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
        IconButton(
          icon: Icon(
            Icons.edit_note,
            color:Colors.black,
            size: 40,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();

            /* readJson();
              print(list);

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));

              */

          },
        ),
      */


/*
        Icon(
          Icons.more_vert,
        color: Colors.black,
          size: 40,

        )
        */


      ],

    );
  }




}


