
import 'package:bsu_aims/cuppertino/navigation_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'navigation_provider.dart';
class NavigationDrawerWidget extends StatelessWidget{

  static final padding = EdgeInsets.symmetric(horizontal: 20);

    @override
    Widget build(BuildContext context) => Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[

            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  buildMenuItem(

                    context,
                    item: NavigationItem.personal,
                    text: 'Personal',
                    icon: Icons.person_pin
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                      context,
                      item: NavigationItem.emergency,
                      text: 'Emergency',
                      icon: Icons.emergency
                  ),


                  const SizedBox(height: 16),
                  buildMenuItem(
                      context,
                      item: NavigationItem.medical_history,
                      text: 'Medical history',
                      icon: Icons.medical_information_rounded
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                      context,
                      item: NavigationItem.family,
                      text: 'Family',
                      icon: Icons.family_restroom
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                      context,
                      item: NavigationItem.assestment_diagnosis,
                      text: 'Assestment Diagnosis',
                      icon: Icons.assessment
                  ),


                ],
              ),
            )
          ],
        ),
      ),


    );

    Widget buildMenuItem(
        BuildContext context, {
          required NavigationItem item,
          required String text,
          required IconData icon,
        }) {
          final provider = Provider.of<NavigationProvider>(context);
          final currentitem = provider.navigationItem;
          final isSelected = item == currentitem;

          final color = Colors.black;

          return Material(
            color: Colors.transparent,
            child: ListTile(
              selected: isSelected,
              selectedTileColor: Color(0xff98c1d9),
              leading: Icon(icon, color: color),
              title: Text(text,
                  style: GoogleFonts.montserrat(
                      color: color,
                      fontSize: 13,
                    fontWeight: FontWeight.w600

                  )),
              onTap: () => selectItem(context, item),
            ),
          );



    }
void selectItem(BuildContext context, NavigationItem item){
      final provider = Provider.of<NavigationProvider>(context, listen: false);
      provider.setNavigationItem(item);
}


}
