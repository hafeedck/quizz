import 'package:flutter/material.dart';
import 'package:flutter_application_11/modules/quiz.dart';
import 'package:flutter_application_11/shared/styles/colors.dart';

Future resultInDialogBox({
  required BuildContext ctx,
 // required IconData icon,
 // required String txtState,
  required int total,
}) {
  return showDialog(
     context: ctx,
      builder: (context) => AlertDialog(

            backgroundColor: Colors.grey,
            alignment: Alignment.center,
           // title: Icon(icon, color: primary, size: 45),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Thank You',
                  style: const TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.bold,),
                ),
                const SizedBox(
                  height: 75,
                ),
                Text("your score is: $total",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,color: Colors.black
                            ),),
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const Quiz()));
                    },
                    icon: const Icon(
                      Icons.restart_alt_rounded,
                      color: primary,
                      size: 22,
                    ))
              ],
            ),
          ));
}

Widget circleDesignOfNumbers({required Color color, required Widget child}) {
  return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(child: child));
}

Widget innerCircleDesignOfNumbers({
  required int index,
  required Color color,
}){
  return Container(
            height: 35,
            width: 35,
            decoration: const BoxDecoration(
              color: bg,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: Text(
              "$index",
              style: TextStyle(color: color),
            )),
          
        );
}