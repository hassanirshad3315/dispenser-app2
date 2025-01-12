// import 'package:flutter/material.dart';
//
//
// class Nextscreen extends StatefulWidget {
//   const Nextscreen({super.key});
//
//   @override
//   State<Nextscreen> createState() => _NextscreenState();
// }
//
// class _NextscreenState extends State<Nextscreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//               ),
//               child: Text(
//                 'Menu',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Home'),
//               onTap: () {
//                 Navigator.pop(context); // Close the drawer
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         title: TextField(
//           cursorColor: Colors.white,
//           decoration: InputDecoration(
//             hintText: 'Search...',
//             hintStyle: TextStyle(color: Colors.white70),
//             border: InputBorder.none,
//           ),
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.grey,
//         leading: Builder(
//           builder: (context) => IconButton(
//             icon: Icon(Icons.menu),
//             onPressed: () {
//               Scaffold.of(context).openDrawer();
//             },
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   width: 100,
//                   height: 100,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border.all(color: Colors.black12),
//                       borderRadius: BorderRadius.circular(20)),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   width: 100,
//                   height: 100,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border.all(color: Colors.black12),
//                       borderRadius: BorderRadius.circular(20)),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


