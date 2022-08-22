import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/shared/components/constants.dart';
import 'package:flutter_application_11/shared/components/shared_widgets.dart';

import 'answer.dart';
import 'card.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 239, 236, 236),
        body: SafeArea(
          child: show == false
              ? Column(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'We need you to answer some questions to get the best results. ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF4D4D4D), fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 40,
                          width: 200,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(140, 44, 140, 1)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 240, 237, 240))))),
                            onPressed: () {
                              setState(() {
                                show = true;
                              });
                            },
                            child: const Text(
                              "Start",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : const QuizBody(),
        ));
  }
}

class QuizBody extends StatefulWidget {
  const QuizBody({Key? key}) : super(key: key);

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  int current = 1;
  int total = 0;
  inPressedAction(int score) {
    total += score;
    if (score == 10) {
      show1();
      // } else if (current == quests.length + 1 && score == 10) {
      //   show4();

      // }else if (current == quests.length + 1 && score == 10) {
      //   show3();

    } else {
      show2();
    }
    for (int i = current + 1; i == quests.length + 1 && score == 0; i++) {
      show3();
    }
    for (int j = current + 1; j == quests.length + 1 && score == 10; j++) {
      show4();
    }
    // setState(() {
    //   current += 1;
    //   if (current == quests.length + 1) {
    //     current -= 1;
    //     show1();
    //   }
    // });
    if (kDebugMode) {
      print("$score -> then : $total");
    }
  }

  showResult() {
    if (0 <= total && total <= 45) {
      return resultInDialogBox(ctx: context, total: total);
    } else if (45 < total && total <= 75) {
      return resultInDialogBox(ctx: context, total: total);
    } else {
      return resultInDialogBox(
          ctx: context,
          // icon: smile,
          // txtState: 'you are excellent',
          total: total);
    }
  }
  // endscreen(int index){
  //   if(quests.length==index){

  //   }
  // }
  show1() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Colors.green,
              title: const Center(
                child: Text(
                  'correct answer',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              content: SingleChildScrollView(
                child: Container(),
              ),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                Center(
                  // ignore: deprecated_member_use
                  child: Center(
                    child: MaterialButton(
                      height: 40,
                      minWidth: 100,
                      color: Color.fromARGB(255, 217, 225, 210),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color.fromARGB(255, 19, 100, 166)),
                          borderRadius: BorderRadius.circular(40)),
                      child: const Text(
                        "next question",
                        style: TextStyle(
                          color: Colors.black,
                          // fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          current += 1;
                          if (current == quests.length + 1) {
                            current -= 1;
                            //show1();
                          }
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }

  show2() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Colors.red,
              title: const Center(
                child: Text(
                  'wrong answer',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              content: SingleChildScrollView(
                child: Container(),
              ),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                Center(
                  // ignore: deprecated_member_use
                  child: Center(
                    child: MaterialButton(
                      height: 40,
                      minWidth: 100,
                      color: Color.fromARGB(255, 192, 199, 187),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color.fromARGB(255, 19, 100, 166)),
                          borderRadius: BorderRadius.circular(40)),
                      child: const Text(
                        "next question",
                        style: TextStyle(
                          color: Colors.black,
                          // fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          current += 1;
                          if (current == quests.length + 1) {
                            current -= 1;
                            //show1();
                           
                          }
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }

  show3() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Colors.red,
              title: Center(
                child: Column(
                  children: const [
                    Text(
                      'wrong answer',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Your task is over',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              content: SingleChildScrollView(
                child: Container(),
              ),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                Center(
                  // ignore: deprecated_member_use
                  child: Center(
                    child: MaterialButton(
                      height: 40,
                      minWidth: 100,
                      color: Color.fromARGB(255, 196, 207, 187),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color.fromARGB(255, 19, 100, 166)),
                          borderRadius: BorderRadius.circular(40)),
                      child: const Text(
                        "submit",
                        style: TextStyle(color: Colors.black
                            // fontSize: 20,
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                      onPressed: () {
                        showResult();
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (context) => const Quiz()));
                      },
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }

  show4() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Colors.green,
              title: Center(
                child: Column(
                  children: const [
                    Text(
                      'correct answer',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Your task is over',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              content: SingleChildScrollView(
                child: Container(),
              ),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                Center(
                  // ignore: deprecated_member_use
                  child: Center(
                    child: MaterialButton(
                      height: 40,
                      minWidth: 100,
                      color: Color.fromARGB(255, 194, 203, 185),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color.fromARGB(255, 19, 100, 166)),
                          borderRadius: BorderRadius.circular(40)),
                      child: const Text(
                        "submit",
                        style: TextStyle(color: Colors.black
                            // fontSize: 20,
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                      onPressed: () {
                        showResult();
                        
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (context) => const Quiz()));
                      },
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //nums
              Stack(
                children: [
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 1; i <= quests.length; i++) //15  /14 /15
                            // Padding(
                            //     padding: const EdgeInsets.all(10),
                            //     child:
                            Container(
                                height: MediaQuery.of(context).size.height / 10,
                                width: MediaQuery.of(context).size.width / 7,
                                child: showstyle(i))
                          //)
                        ],
                      ),
                    ),
                  ),
                  // titlecard(
                  //     index: current ,
                  //   ),
                ],
              ),

              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     for (int i = 1; i <= quests.length ; i++) //15  /14 /15
              //       Padding(
              //           padding: const EdgeInsets.all(2.5),
              //           child: Container(
              //               height: 35,
              //               width: 35,
              //               child: chooseicon(i)))
              //   ],
              // ),

              const SizedBox(
                height: 20,
              ),
              //card_q
              QuestionCard(
                index: current,
                txt: quests[current - 1]['text'] as String,
              ),
              const SizedBox(
                height: 20,
              ),
              //answers
              ...(quests[current - 1]['answer'] as List<Map<String, Object>>)
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Answer(
                            value: e['txt'] as String,
                            press: () => inPressedAction(e['score'] as int)),
                      ))
                  .toList(),
              Container(
                //margin: EdgeInsets.only(left: 95),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.purple,
                        size: 35.0,
                      ),
                      padding: const EdgeInsets.all(15.0),
                      shape: const CircleBorder(
                        side: BorderSide(
                            width: 5,
                            color: Colors.purple,
                            style: BorderStyle.solid),
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        setState(() {
                          current += 1;
                          if (current == quests.length + 1) {
                            current -= 1;
                            show1();
                          }
                        });
                      },
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.purple,
                        size: 35.0,
                      ),
                      padding: const EdgeInsets.all(15.0),
                      shape: const CircleBorder(
                        side: BorderSide(
                            width: 5,
                            color: Colors.purple,
                            style: BorderStyle.solid),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget chooseCirclesStyle(int index) {
  //   if (index == current) {
  //     return circles(10, primary);
  //   } else if (index > current) {
  //     return circles(5, gry.withOpacity(.5));
  //   } else {
  //     return circles(5, primary);
  //   }
  // }
  Widget showstyle(int index) {
    if (index == current) {
      return show(
          40,
          CircleAvatar(
              radius: 18,
              backgroundColor: Colors.purple,
              child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: TextButton(
                    onPressed: (() {}),
                    child: Text(
                      "$index",
                      style:
                          const TextStyle(fontSize: 14, color: Colors.purple),
                    ),
                  ))));
    } else if (index > current) {
      return show(
          40,
          CircleAvatar(
              radius: 18,
              backgroundColor: Colors.purple,
              child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: TextButton(
                    onPressed: (() {}),
                    child: Text(
                      "$index",
                      style:
                          const TextStyle(fontSize: 14, color: Colors.purple),
                    ),
                  ))));
    } else {
      return icons(
          40,
          CircleAvatar(
              radius: 18,
              backgroundColor: Colors.purple,
              child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: (() {}),
                    icon: const Icon(
                      Icons.check,
                      size: 20,
                      color: Color.fromARGB(255, 110, 11, 80),
                    ),
                  ))));
    }
  }

//   Widget chooseicon(int index) {
//     if (index == current) {
//       return icons(
//         10,
//         IconButton(
//           onPressed: (() {}),
//           icon: const Icon(
//             Icons.check_circle,
//             size: 40,
//             color: Color.fromARGB(255, 26, 25, 25),
//           ),
//         ),
//       );
//     } else if (index > current) {
//       return icons(
//           0,
//           IconButton(
//             onPressed: (() {}),
//             icon: const Icon(
//               Icons.circle,
//               size: 40,
//               color: Color.fromARGB(255, 28, 27, 27),
//             ),
//           ));
//     } else {
//       return icons(
//           0,
//           IconButton(
//             onPressed: (() {}),
//             icon: const Icon(
//               Icons.check_circle,
//               // size: 20,
//               color: Color.fromARGB(255, 110, 11, 80),
//             ),
//           ));
//     }
//   }
// }

  Widget circles(double rds, color) {
    return CircleAvatar(
      radius: rds,
      backgroundColor: color,
    );
  }

  Widget icons(double rds, Icon) {
    return IconButton(
      icon: Icon,
      onPressed: () {},
    );
  }

  Widget show(double rds, Text) {
    return TextButton(
      onPressed: () {},
      child: Text,
    );
  }

  Color getColorForOption(List<Map<String, Object>> quests) {
    // ignore: unrelated_type_equality_checks
    final isSelected = 'score' == 10;

    if (!isSelected) {
      return Colors.grey.shade200;
    } else {
      return isSelected ? Colors.green : Colors.red;
    }
  }
// Color getColorForOption(Option option, Question question) {
//     final isSelected = option == question.solution;

//     if (!isSelected) {
//       return Colors.grey.shade200;
//     } else {
//       return option.isCorrect ? Colors.green : Colors.red;
//     }
//   }
/*
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz/shared/components/constants.dart';
import 'package:quiz/shared/components/shared_widgets.dart';
import 'package:quiz/shared/styles/colors.dart';
import 'answer.dart';
import 'card.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bg,
        appBar: AppBar(
          backgroundColor: primary,
          title: const Center(
              child: Text(
            "quiz page",
            style: TextStyle(color: bg),
          )),
        ),
        body: SafeArea(
          child: show == false
              ? Center(
                  child: Container(
                    color: primary,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          show = true;
                        });
                      },
                      child: const Text(
                        "Start",
                        style: TextStyle(color: bg),
                      ),
                    ),
                  ),
                )
              : const QuizBody(),
        ));
  }
}

class QuizBody extends StatefulWidget {
  const QuizBody({Key? key}) : super(key: key);

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  int current = 1;
  int total = 0;
  inPressedAction(int score) {
    total += score;
    setState(() {
      current += 1;
      if (current == quests.length + 1) {
        current -= 1;
        showResult();
      }
    });
    if (kDebugMode) {
      print("$score -> then : $total");
    }
  }

  showResult() {
    if (0 <= total && total <= 45) {
      return resultInDialogBox(
          ctx: context, icon: frown, txtState: 'you are bad', total: total);
    } else if (45 < total && total <= 75) {
      return resultInDialogBox(
          ctx: context, icon: meh, txtState: 'you are good', total: total);
    } else {
      return resultInDialogBox(
          ctx: context,
          icon: smile,
          txtState: 'you are excellent',
          total: total);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //nums
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 1; i < quests.length + 1; i++) //15  /14 /15
                  Padding(padding: const EdgeInsets.all(8.0), child: circles(i))
              ],
            ),
          ),
          free,
          //card_q
          QuestionCard(
            index: current,
            txt: quests[current - 1]['text'] as String,
          ),
          free,
          //answers
          ...(quests[current - 1]['answer'] as List<Map<String, Object>>)
              .map((e) => Answer(
                  value: e['txt'] as String,
                  press: () => inPressedAction(e['score'] as int)))
              .toList()
        ],
      ),
    );
  }

  Widget circles(int index) {
    if (index == current) {
      return wait(index);
    } else if (index < current) {
      return seen(index);
    } else {
      return notSeen(index);
    }
  }

  Widget seen(int index) {
    return circleDesignOfNumbers(
        color: primary,
        child: innerCircleDesignOfNumbers(index: index, color: primary));
  }

  Widget wait(int index) {
    return circleDesignOfNumbers(
      color: primary,
      child: Center(
        child: Text(
          "$index",
          style: const TextStyle(color: bg),
        ),
      ),
    );
  }

  Widget notSeen(int index) {
    return circleDesignOfNumbers(
        color: gry,
        child: Center(
            child: innerCircleDesignOfNumbers(index: index, color: gry)));
  }
}
 */
}
