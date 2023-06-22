


import 'package:bsu_aims/cuppertino/navigation_item.dart';
import 'package:bsu_aims/cuppertino/navigation_provider.dart';
import 'package:bsu_aims/pages/AssessmentDiagnosisPage.dart';
import 'package:bsu_aims/pages/familyHistory.dart';
import 'package:bsu_aims/pages/medicalHistory.dart';
import 'package:bsu_aims/pages/personal_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'emergencyPage.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DrawerMainpage(),

      ),

  );
}

class DrawerMainpage extends StatefulWidget {
  const DrawerMainpage({Key? key}) : super(key: key);

  @override
  State<DrawerMainpage> createState() => _DrawerMainpageState();
}

class _DrawerMainpageState extends State<DrawerMainpage> {
  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages()  {
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;

    switch (navigationItem) {
      case NavigationItem.personal:
        return myProfile();
      case NavigationItem.emergency:
        return Emergency();
      case NavigationItem.medical_history:
        return medicalHistory();
      case NavigationItem.family:
        return FamilyHomePage();
      case NavigationItem.assestment_diagnosis:
        return AssessmentDiagnosis();

    }

  }
}

