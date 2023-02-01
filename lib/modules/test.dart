// import 'package:flutter/material.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //parent widget will be  impelemented fully then child will be constructured
//     //advantage of builder ---> get updated build context when you need it ---> a build specific part
//     return Scaffold(body: Builder(
//       builder: (BuildContext context) {
//         return MaterialButton(onPressed: () {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(const SnackBar(content: Text("hello")));
//         });
//       },
//     ));
//     // return const Scaffold(body: ShowSnackBar());//solution 1
//   }
// }

// //solution 1 ---> to get rid of access build context of parent inside build context ----> by separating its code form build

// //called stand alone wigdet
// class ShowSnackBar extends StatelessWidget {
//   const ShowSnackBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //inside another build
//     return MaterialButton(
//       onPressed: () {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(const SnackBar(content: Text("hello")));
//       },
//     );
//   }
// }

// //problem ---> access buildcontext of parent widget inside build method
// //solving
// //scaffold or navigator or themedata or media query .of context  ---> inherited widgets
// //
