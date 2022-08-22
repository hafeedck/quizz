import 'package:flutter/material.dart';
import 'package:flutter_application_11/shared/styles/colors.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.index, required this.txt})
      : super(key: key);
  final int index;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.all(5),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [ Align( alignment: Alignment.centerLeft,
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text(
                          "$index"'.', textAlign: TextAlign.left,
                          style: const TextStyle(color: Colors.purple, fontSize: 22),
                        )),
            ],
          ),
                  ),
              
        
          Row(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align( alignment: Alignment.center,
                child: Container(width: 350,
                  child: Text(
                    txt,
                    style: const TextStyle(fontSize: 16, color: Colors.purple),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),

         
        ],
      ),
    );
  }
}
