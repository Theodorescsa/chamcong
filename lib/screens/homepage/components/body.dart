import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/user.dart';

// class Body extends StatefulWidget {
//   @override
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
// var url = Uri.parse('http://10.20.34.13:8001/timekeeping');
// StreamController<List<User>> _streamController = StreamController.broadcast();
// List<User> _students = [];

// Future<void> _getStudents() async {
// var result = await http.get(url);
// if (result.statusCode == 200) {
//   var jsonData = json.decode(result.body)["data"];
//   List<User> students = [];
//   for (var item in jsonData) {
//     students.add(User.fromJson(item));
//   }
//   _streamController.add(students);
// } else {
//   throw Exception('Failed to load students');
// }
// }

// @override
// void initState() {
//   super.initState();
//   _getStudents();

//   Timer.periodic(Duration(seconds: 5), (_) {
//     _getStudents();
//   });
// }

// @override
// void dispose() {
//   _streamController.close();
//   super.dispose();
// }

// @override
// Widget build(BuildContext context) {
//   return StreamBuilder<List<User>>(
//     stream: _streamController.stream,
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         _students = snapshot.data!;
//         return ListView.builder(
//           // reverse: true,
//           itemCount: _students.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               title: Text(_students[index].name!),
//               subtitle: Text(_students[index].email!),
//             );
//           },
//         );
//       } else if (snapshot.hasError) {
//         return Center(child: Text('${snapshot.error}'));
//       } else {
//         return Center(child: CircularProgressIndicator());
//       }
//       },
//     );
//   }
// }
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, dynamic>> listtitle = [
    {
      'Ten': 'Ten1',
      'Thoi gian cham cong': 'Thoi gian 1',
      'chuc vu': 'Chuc vu 1'
    },
    {
      'Ten': 'Ten2',
      'Thoi gian cham cong': 'Thoi gian 2',
      'chuc vu': 'Chuc vu 2'
    },
    {
      'Ten': 'Ten3',
      'Thoi gian cham cong': 'Thoi gian 3',
      'chuc vu': 'Chuc vu 3'
    },
    {
      'Ten': 'Ten4',
      'Thoi gian cham cong': 'Thoi gian 4',
      'chuc vu': 'Chuc vu 4'
    },
  ];

  late List<dynamic> jsonList;

  @override
  void initState() {
    super.initState();
    String jsonString = jsonEncode(listtitle);

    jsonList = jsonDecode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: jsonList.map((item) {
            return Column(
              children: [
                Text('Ten: ${item["Ten"]}'),
                Text('Thoi gian cham cong: ${item["Thoi gian cham cong"]}'),
                Text('Chuc vu: ${item["chuc vu"]}'),
                SizedBox(height: 16),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
