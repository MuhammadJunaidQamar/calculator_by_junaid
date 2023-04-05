import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/my_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: non_constant_identifier_names
  var UserInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Align(
                      alignment: Alignment.bottomRight,
                    ),
                    Text(
                      UserInput.toString(),
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      answer.toString(),
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    children: [
                      MyButton(
                        title: 'AC',
                        color: Colors.grey,
                        onPress: () {
                          setState(() {
                            UserInput = '';
                            answer = '';
                          });
                        },
                      ),
                      MyButton(
                        title: '+/-',
                        color: Colors.grey,
                        onPress: () {
                          setState(
                            () {
                              UserInput += '+/-';
                            },
                          );
                        },
                      ),
                      MyButton(
                        title: '%',
                        color: Colors.grey,
                        onPress: () {
                          setState(
                            () {
                              UserInput += '%';
                            },
                          );
                        },
                      ),
                      MyButton(
                        title: '/',
                        color: Colors.orange,
                        onPress: () {
                          setState(
                            () {
                              UserInput += '/';
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '7',
                        color: Colors.grey,
                        onPress: () {
                          setState(
                            () {
                              UserInput += '7';
                            },
                          );
                        },
                      ),
                      MyButton(
                        title: '8',
                        color: Colors.grey,
                        onPress: () {
                          setState(
                            () {
                              UserInput += '8';
                            },
                          );
                        },
                      ),
                      MyButton(
                        title: '9',
                        color: Colors.grey,
                        onPress: () {
                          setState(
                            () {
                              UserInput += '9';
                            },
                          );
                        },
                      ),
                      MyButton(
                        title: 'x',
                        color: Colors.orange,
                        onPress: () {
                          setState(
                            () {
                              UserInput += 'x';
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '4',
                        color: Colors.grey,
                        onPress: () {
                          setState(
                            () {
                              UserInput += '4';
                            },
                          );
                        },
                      ),
                      MyButton(
                        title: '5',
                        color: Colors.grey,
                        onPress: () {
                          setState(
                            () {
                              UserInput += '5';
                            },
                          );
                        },
                      ),
                      MyButton(
                        title: '6',
                        color: Colors.grey,
                        onPress: () {
                          setState(
                            () {
                              UserInput += '6';
                            },
                          );
                        },
                      ),
                      MyButton(
                        title: '-',
                        color: Colors.orange,
                        onPress: () {
                          setState(
                            () {
                              UserInput += '-';
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '1',
                        color: Colors.grey,
                        onPress: () {
                          setState(
                            () {
                              UserInput += '1';
                            },
                          );
                        },
                      ),
                      MyButton(
                        title: '2',
                        color: Colors.grey,
                        onPress: () {
                          setState(
                            () {
                              UserInput += '2';
                            },
                          );
                        },
                      ),
                      MyButton(
                        title: '3',
                        color: Colors.grey,
                        onPress: () {
                          setState(
                            () {
                              UserInput += '3';
                            },
                          );
                        },
                      ),
                      MyButton(
                        title: '+',
                        color: Colors.orange,
                        onPress: () {
                          setState(
                            () {
                              UserInput += '+';
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '0',
                        color: Colors.grey,
                        onPress: () {
                          setState(
                            () {
                              UserInput += '0';
                            },
                          );
                        },
                      ),
                      MyButton(
                        title: '.',
                        color: Colors.grey,
                        onPress: () {
                          setState(
                            () {
                              UserInput += '.';
                            },
                          );
                        },
                      ),
                      MyButton(
                        title: 'DEL',
                        color: Colors.grey,
                        onPress: () {
                          setState(
                            () {
                              UserInput =
                                  UserInput.substring(0, UserInput.length - 1);
                            },
                          );
                        },
                      ),
                      MyButton(
                        title: '=',
                        color: Colors.orange,
                        onPress: () {
                          setState(
                            () {
                              equalPress();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = UserInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double evaluate = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = evaluate.toString();
  }
}
