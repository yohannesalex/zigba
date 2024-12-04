import 'package:flutter/material.dart';

class DragWidget extends StatefulWidget {
  const DragWidget({super.key});

  @override
  State<DragWidget> createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1, // Initial size of the sheet
      minChildSize: 0.1, // Minimum size of the sheet
      maxChildSize: 1, // Maximum size of the sheet
      builder: (context, scrollController) {
        return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 60,
                    height: 3,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                      child: Text(
                    "Easy way To pay your tax on time",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                      child: Text(
                    "It is a long established fact that paying tax and other payments will be tedious process to keep up. ",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                    textAlign: TextAlign.center,
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(36, 15, 36, 15),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 246, 244, 244),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text('Login'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(32, 15, 32, 15),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 246, 244, 244),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text('Sign up'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
