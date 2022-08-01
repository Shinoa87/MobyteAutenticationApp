import 'package:flutter/material.dart';
import '../classes/static_fields.dart';

 class CustomArrowBack extends StatefulWidget {
   const CustomArrowBack({Key? key}) : super(key: key);

   @override
   State<CustomArrowBack> createState() => _CustomArrowBackState();
 }

 class _CustomArrowBackState extends State<CustomArrowBack> {
   @override
   Widget build(BuildContext context) {
     return Container(
       padding: EdgeInsets.only(left: 3),
       alignment: Alignment.centerLeft,
       child: InkWell(
         onTap: (){
           Navigator.pop(context);
         },
         child: CircleAvatar(
           backgroundColor: StaticConst.kMainColorTheme.withOpacity(0.5),
           radius: 20,
           child: Icon(
             Icons.arrow_back,
             color: Colors.white,
           ),
         ),
       ),
     );
   }
 }
