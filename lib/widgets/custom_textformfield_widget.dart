import 'package:flutter/material.dart';

 class CustomTextFormField extends StatefulWidget {
    CustomTextFormField({Key? key,
      required this.hintText,
      required this.showEye,
      required this.controller,
      this.validator
      // required this.onChanged
    }) : super(key: key);

   final String hintText;
   final bool showEye;
   final TextEditingController controller;
   final String? Function(String?)? validator;
   // final onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  bool _showPassword = true;

   @override
   Widget build(BuildContext context) {

     return TextFormField(
       controller: widget.controller,
       // validator: (value) {
       //   if (value == null || value.isEmpty) {
       //     return "Please enter login and password";
       //   }
       //   return null;
       // },
       autovalidateMode: AutovalidateMode.onUserInteraction,
       validator: widget.validator,
         //   (value) =>
         // value != null && !EmailValidator.validate(value)
         //   ? 'Enter a valid name'
         //   : null,
       obscureText: !_showPassword,
       decoration: InputDecoration(
         contentPadding: EdgeInsets.all(20.0),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10),
         ),
         enabledBorder: OutlineInputBorder(
           borderSide: BorderSide(
             color: Colors.purple,
           ),
           borderRadius: BorderRadius.circular(10),
         ),
         disabledBorder: OutlineInputBorder(
           borderSide: BorderSide(
             color: Colors.grey,
           ),
           borderRadius: BorderRadius.circular(10),
         ),
         focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(
             color: Colors.purple,
           ),
           borderRadius: BorderRadius.circular(10),
         ),
         hintText: widget.hintText,
         hintStyle: const TextStyle(
           fontSize: 14,
           fontWeight: FontWeight.w400,
         ),
         suffixIcon: widget.showEye ? GestureDetector(
           onTap: () {
             _togglevisibility();
           },
           child: Icon(
             Icons.visibility_sharp,
             color: _showPassword ? const Color(0xff8A5DA5) : const Color(0xff757575),
           ),
         ) : null,
       ),
     );
   }

  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}
