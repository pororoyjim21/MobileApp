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


class medicalHistory extends StatelessWidget {
  const medicalHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: medicalHome(),
    );
  }
}

class medicalHome extends StatefulWidget {
  const medicalHome({Key? key}) : super(key: key);

  @override
  State<medicalHome> createState() => _medicalHomeState();
}

class _medicalHomeState extends State<medicalHome> {

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
  String? Hospitalization;
  String? Operation;
  String? Accident;
  String? Disability;
  String? Asthma;
  String? Diabetes;
  String? Epilepsy;
  String? HeartDisease;
  String? Hypertension;
  String? Measles;
  String? Mumps;
  String? ThyroidProblem;
  String? Varicella;
  String? AllergyFood;
  String? AllergyMedicine;
  String? AllergyOthers;
  String? ImmuneBCGmedical;
  String? ImmuneMMRmedical;
  String? ImmuneHepa_A;
  String? ImmuneTyphoid;
  String? ImmuneVaricella;
  String? ImmuneHeppa_B;
  String? ImmuneDPT;
  String? ImmuneOPV;
  String? ImmuneHIB;



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
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _asthmaController = TextEditingController();



  final _firstName = TextEditingController();

  final _middleName = TextEditingController();
  final _lastName = TextEditingController();
  final _suffixName = TextEditingController();
  final hospitalizationSpecify = TextEditingController();
  final operationSpecify = TextEditingController();
  final accidentSpecify = TextEditingController();
  final disabilitySpecify = TextEditingController();
  final foodSpecify = TextEditingController();
  final medicineSpecify =TextEditingController();
  final othersSpecify = TextEditingController();
  final dosesHepaB =TextEditingController();
  final dosesDPT = TextEditingController();
  final dosesOPV = TextEditingController();
  final dosesHIB = TextEditingController();
  final pubertalHistoryAge = TextEditingController();


  final _Landline = TextEditingController();
  final _personalEmail = TextEditingController();
  final _personalContact = TextEditingController();
  final _relationtotheuser = TextEditingController();

  final _dateinput = TextEditingController();



  bool hospitalSpecifyBool =false;
  bool operationSpecifyBool = false;
  bool accidentSpecifyBool = false;
  bool disabilitySpecifyBool = false;
  bool asthmaSpecifyBool = false;
  bool foodSpecifyBool = false;
  bool medicineSpecifyBool = false;
  bool otherSpecifyBool = false;
  bool heppaB_DosesBool =false;
  bool dpt_DosesBool = false;
  bool opv_DosesBool = false;
  bool hib_DosesBool = false;




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
          "firstname" : _firstName.text,
          "middlename" : _middleName.text,
          "lastname" : _lastName.text,
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
    _firstName.dispose();
    _middleName.dispose();
    _lastName.dispose();
    _suffixName.dispose();
    hospitalizationSpecify.dispose();
    operationSpecify.dispose();
    accidentSpecify.dispose();
    disabilitySpecify.dispose();
    foodSpecify.dispose();
    medicineSpecify.dispose();
    othersSpecify.dispose();

    _Landline.dispose();
    _nameController.dispose();
    _personalContact.dispose();
    _ageController.dispose();
    _asthmaController.dispose();
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
  Future functionYesorNo() async {



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
                    "Medical history",
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
                    height: 520,

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
                                  child: Text("Past illness",


                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Hospitalization",
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

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),


                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,

                                            value: Hospitalization,

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


                                            onChanged: (value) => setState(() {

                                              this.Hospitalization = value;
                                              if(Hospitalization=="Yes"){
                                                hospitalizationSpecify.text = "";


                                                setState(() {
                                                  hospitalSpecifyBool = false;
                                                });




                                                print(hospitalizationSpecify.text);
                                              }
                                              else{
                                                hospitalizationSpecify.text = " ";

                                                setState(() {
                                                  hospitalSpecifyBool = !hospitalSpecifyBool;
                                                });




                                                print(hospitalizationSpecify.text);
                                              }
                                            }),


                                          ),

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Hospitalization (Specify)",
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
                                        readOnly: hospitalSpecifyBool,
                                        autovalidateMode: AutovalidateMode.onUserInteraction ,
                                        controller: hospitalizationSpecify,

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


                                //Text("\n"),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Operation",
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

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),

                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,
                                            


                                            
                                            value: Operation,

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


                                                setState(() {
                                                  this.Operation = value;
                                                  if(Operation=="Yes"){
                                                    operationSpecify.text = "";


                                                    setState(() {
                                                      hospitalSpecifyBool = false;
                                                    });





                                                  }
                                                  else{
                                                    operationSpecify.text = " ";

                                                    setState(() {
                                                      hospitalSpecifyBool = !hospitalSpecifyBool;
                                                    });




                                                    print(hospitalizationSpecify.text);
                                                  }




                                                 // print(hospitalizationSpecify.text);

                                                }),


                                          ),

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Operation (Specify)",
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
                                        controller: operationSpecify,

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
                                        validator: (validate) => validateEmail(validate),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Accident",
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

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),


                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,

                                            value: Accident,

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
                                                this.Accident =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Accident (Specify)",
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
                                        controller: accidentSpecify,

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
                                        validator: (validate) => validateEmail(validate),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Disability",
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

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),


                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,






                                            value: Disability,

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
                                                this.Disability =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Disability (Specify)",
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
                                        controller: disabilitySpecify,

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
                                        validator: (validate) => validateEmail(validate),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Asthma",
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

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(


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
                                            ),


                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,



                                            value: Asthma,

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
                                                this.Asthma =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Asthma (Last attack)",


                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                //birthdate
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
                                        readOnly: true,
                                        controller: _asthmaController,
                                        style: GoogleFonts.montserrat(

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


                                          suffixIcon: IconButton(
                                            icon: Icon(
                                                Icons.calendar_month),
                                            onPressed: () async{

                                              DateTime? pickdate = await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1950),
                                                  lastDate: DateTime(2101));
                                              if(pickdate !=null) {
                                                setState(() {
                                                  _asthmaController.text = DateFormat(
                                                      'MMMM dd, yyyy')
                                                      .format(
                                                      pickdate);
                                                  // lintik na age

                                                  //print(DateTime.now().year-pickdate.year);

                                                 print(_asthmaController.text);

                                                });
                                              }
                                            },
                                          ),


                                        ),

                                      ),
                                    ),
                                  ),
                                ),
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
                                  padding: const EdgeInsets.fromLTRB(5, 2, 8, 2),
                                  child: Container(

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),


                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,



                                            value: Diabetes,

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
                                                this.Diabetes =
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
                                  padding: const EdgeInsets.fromLTRB(5, 2, 8, 2),
                                  child: Container(

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),


                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,

                                            value: Epilepsy,

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
                                                this.Epilepsy =
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
                                  padding: const EdgeInsets.fromLTRB(5, 2, 8, 2),
                                  child: Container(

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),


                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,


                                            value: HeartDisease,

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
                                                this.HeartDisease =
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
                                  padding: const EdgeInsets.fromLTRB(5, 2, 8, 2),
                                  child: Container(

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),


                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,


                                            value: Hypertension,

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
                                                this.Hypertension =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Measles",


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

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),
                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,




                                            value: Measles,

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
                                                this.Measles =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Mumps",


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

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),


                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,
                                            
                                          

                                            
                                            value: Mumps,

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
                                                this.Mumps =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Thyroid Problem",


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

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),
                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,




                                            value: ThyroidProblem,

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
                                                this.ThyroidProblem =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Varicella",


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
                                  
                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),

                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,


                                            value: Varicella,

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
                                                this.Varicella =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),



                                SizedBox(height: 10),



                                Align(
                                  alignment: Alignment.center,
                                  child: Text("Allergy",


                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),


                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Food",


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

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),

                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,
                                            

                                            value: AllergyFood,

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
                                                this.AllergyFood =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),


                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Food Specify",


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
                                        controller: foodSpecify,

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
                                        validator: (validate) => validateEmail(validate),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Medicine",


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

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(



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
                                            ),

                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,

                                          
                                            
                                            value: AllergyMedicine,

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
                                                this.AllergyMedicine =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Medicine (Specify)",


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
                                        controller: medicineSpecify,

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
                                        validator: (validate) => validateEmail(validate),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Others",


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

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),

                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,
                                          
                                            
                                            value: AllergyOthers,

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
                                                this.AllergyOthers =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Others Specify",


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
                                        controller: othersSpecify,

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
                                        validator: (validate) => validateEmail(validate),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text("Medical Immunization",


                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("BCG",


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


                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),

                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,



                                            value: ImmuneBCGmedical,

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
                                                this.ImmuneBCGmedical =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("MMR",


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
                                 

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),


                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,



                                            value: ImmuneMMRmedical,

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
                                                this.ImmuneMMRmedical =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Hepa  A",


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


                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(


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
                                            ),

                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,


                                            value: ImmuneHepa_A,

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
                                                this.ImmuneHepa_A =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Typhoid",


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
                                    

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),

                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,
                                            
                                            
                                            
                                            value: ImmuneTyphoid,

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
                                                this.ImmuneTyphoid =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Varicella",


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


                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),


                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,

                                            value: ImmuneVaricella,

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
                                                this.ImmuneVaricella =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Heppa B",


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
                                  

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(


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
                                            ),

                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,




                                            value: ImmuneHeppa_B,

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
                                                this.ImmuneHeppa_B =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Heppa B Doses",


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
                                        controller: dosesHepaB,

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
                                        validator: (validate) => validateEmail(validate),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("DPT",


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


                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(


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
                                            ),

                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,


                                            value: ImmuneDPT,

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
                                                this.ImmuneDPT =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("DPT Doses",


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
                                        controller: dosesHepaB,

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
                                        validator: (validate) => validateEmail(validate),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("OPV",


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


                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(
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
                                            ),

                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,




                                            value: ImmuneOPV,

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
                                                this.ImmuneOPV =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("OPV Doses",


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
                                        controller: dosesOPV,

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
                                        validator: (validate) => validateEmail(validate),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("HIB",


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
                                   

                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: DropdownButtonHideUnderline(

                                          child: DropdownButtonFormField<String>(

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
                                            ),


                                            validator: (value) => value == null
                                                ? 'Please choose Yes or No' : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction ,
                                            value: ImmuneHIB,

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
                                                this.ImmuneHIB =
                                                    value),


                                          ),

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("HIB Doses",


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
                                        controller: dosesHIB,

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
                                        validator: (validate) => validateEmail(validate),
                                      ),
                                    ),
                                  ),
                                ),


                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text("Pubertal History",


                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Age on set",


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
                                        keyboardType: TextInputType.number,
                                        autovalidateMode: AutovalidateMode.onUserInteraction ,
                                        controller: pubertalHistoryAge,

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
                                        validator: (validate) => validateEmail(validate),
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

