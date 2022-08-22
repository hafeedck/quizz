import 'package:flutter/material.dart';
import 'package:flutter_application_11/shared/components/constants.dart';
import 'package:flutter_application_11/shared/styles/colors.dart';

class titlecard extends StatelessWidget {
  const titlecard({Key? key, required this.index, })
      : super(key: key);
  final int index;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: quests.length,
                        itemBuilder: (context, index) {
    return Center(
      child: 
            CircleAvatar(
                radius: 22,
                backgroundColor: Colors.purple,
                child:CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Center(
                  child: Text(
                "$index",
                style: const TextStyle(color: bg, fontSize: 22),
              ))),
            ),
         
        
      
    );}
  ));}
}
