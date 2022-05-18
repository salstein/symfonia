 import 'package:flutter/material.dart';



class Loading extends StatelessWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
SizedBox(
                  child: Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(color: Colors.green),
                    ],
                  ),
                ));
  }
}

