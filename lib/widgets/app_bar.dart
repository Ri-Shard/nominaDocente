// import 'package:flutter/material.dart';

// class MyAppBar extends AppBar {

//   @override
//   Widget build(BuildContext context) {
//     return  AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               buttn("INICIO", Colors.green, '/', context),
//               const SizedBox(
//                 width: 15,
//               ),
//              buttn("AGREGAR", Colors.green, '/register', context),
//               const SizedBox(
//                 width: 15,
//               ),
//             ],
//           )
//         ],
//         title: const Text("NOMINA DOCENTES UPC",
//             style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 3)),
//       );
//   }
//   Widget buttn(String tet, Color color, String page, BuildContext context) {
//   return ButtonTheme(
//     height: 100,
//     child: ElevatedButton(
//       onPressed: () {
//         Navigator.pushNamed(context, page);
//       },
//       style:
//           ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(color)),
//       child: Text(
//         tet,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ),
//   );
// }

// }