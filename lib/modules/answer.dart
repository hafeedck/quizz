import 'package:flutter/material.dart';
import 'package:flutter_application_11/shared/styles/colors.dart';




class Parent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ParentState();
  }
}

class ParentState extends State<Parent> {

  
  Color _color = Colors.amber; // declare it here

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
         _color = Colors.deepPurple;
      }),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
             border: Border.all(color: Colors.purple,),
            color: _color,
            borderRadius: BorderRadius.circular(30),
          ),
          //  child: Center(
          //   child: Text(
          //     //value,
          //     style: const TextStyle(
          //       color: Colors.black,
          //     ),
          //   ),
          )
    );
  }
}


class Answer extends StatelessWidget {
  const Answer({Key? key, required this.value, required this.press, })
      : super(key: key);
  final String value;
   
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
             border: Border.all(color: Colors.purple,),
            //color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          )),
    );
  }
}


