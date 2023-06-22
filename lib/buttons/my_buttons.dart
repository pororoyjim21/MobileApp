import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyButton extends StatelessWidget {

  final String iconImagePath;
  final String buttonText;
  final buttontapped;


  const MyButton({
    Key? key,
    required this.iconImagePath,
    required this.buttonText,
    required this.buttontapped
  })
      : super(key: key);


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: buttontapped,
      child: Column(


          children: [
            //icon
            Container(

              height: 90,
              width: 90,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  /*
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 4,
                        spreadRadius: 1
                    )
                  ]
          */
              ),
              child: Center(
                child: Image.asset(iconImagePath),

              ),
            ),
            SizedBox(
              height: 10,
            ),
            //text
            Text(buttonText,
              textAlign: TextAlign.right,
              style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,

                  color: Colors.black87
              ),

            ),

          ]
      ),
    );


  }
}
