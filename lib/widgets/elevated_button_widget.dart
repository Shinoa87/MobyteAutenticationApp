import 'package:flutter/material.dart';

 class CustomElevatedButton extends StatefulWidget {
   const CustomElevatedButton({Key? key,
     required this.title,
     required this.titleColour,
     required this.buttonColour,
     required this.onPressed
   }) : super(key: key);

   final String title;
   final Color buttonColour;
   final Color titleColour;
   final onPressed;

   @override
   State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
 }

 class _CustomElevatedButtonState extends State<CustomElevatedButton> {
   @override
   Widget build(BuildContext context) {
     return Container(
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
         boxShadow: [
           BoxShadow(
             color: Colors.grey.withOpacity(0.5),
             spreadRadius: 1,
             blurRadius: 1,
             offset: Offset(0, 0), // changes position of shadow
           ),
         ],
       ),
       height: 53,
       width: double.infinity,
       child: ElevatedButton(
         style: ButtonStyle(
           backgroundColor: MaterialStateProperty.all(widget.buttonColour),
           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
             RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20.0),
             ),
           ),
         ),
         onPressed: widget.onPressed,
         child: Text(
           widget.title,
           style: TextStyle(
             color: widget.titleColour,
             fontSize: 16,
             fontWeight: FontWeight.w600,
           ),
         ),
       ),
     );
   }
 }




// _createTaskForm(BuildContext context) {
//   if (_formKey.currentState!.validate()) {
//     final TaskItem taskItem = TaskItem(date: _getFormattedTime(), color: colorPriority[_priorities.indexOf(_currentItemSelected)],priority:_currentItemSelected ,title:titleController.text,description:descController.text);
//     Navigator.of(context).pop(taskItem);
//   }
// }
