import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetTodos extends StatefulWidget {
  const GetTodos({super.key});

  @override
  State<GetTodos> createState() => _GetTodosState();
}

class _GetTodosState extends State<GetTodos> {
  Future<Map<String, dynamic>> getTodo(int id) async {
    var url = "https://jsonplaceholder.typicode.com/todos/$id";
    var respones = await http.get(Uri.parse(url));

    return jsonDecode(respones.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>>? todo;
  var text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restful API'),
      ),
      body: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Text(text),
              const SizedBox(
                height: 30,
              ),
            ],
          )),
    );
  }

  Widget btnRandom() {
    return TextButton(
        onPressed: () {
          var id = Random().nextInt(30) + 1;
          todo = getTodo(id);
          todo?.then((value) {
            setState(() {
              text = 'Title: ${value['title']}\n';
              text += 'Complete: ${value['Complere']}\n';
            });
          });
        },
        child: const Text('Random Todo'));
  }
}
