import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarHomeWidget extends StatelessWidget {
  const AppBarHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                child: Icon(FontAwesomeIcons.edit,size: 25,),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // لون الظل مع الشفافية
                      spreadRadius: 1,  // مدى الانتشار
                      blurRadius: 1,    // مدى التمويه
                      offset: Offset(0, 0), // الإزاحة (يمين/يسار, أعلى/أسفل)
                    ),
                  ],

                ),
              ),
              SizedBox(width: 6,),
              Text("Al_dawaemeh",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),
              Icon(Icons.keyboard_arrow_down_rounded)
            ],
          ),
          Container(
            child: Icon(Icons.settings,size: 25,),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // لون الظل مع الشفافية
                  spreadRadius: 1,  // مدى الانتشار
                  blurRadius: 1,    // مدى التمويه
                  offset: Offset(0, 0), // الإزاحة (يمين/يسار, أعلى/أسفل)
                ),
              ],

            ),
          ),
        ],
      ),
    );
  }
}
