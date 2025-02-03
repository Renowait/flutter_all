import 'package:flutter/material.dart';
import 'package:student_app/student.dart';

class EditScreen extends StatefulWidget {
  final int index; //รายการที่ต้องการแก้ไข
  const EditScreen({super.key, required this.index});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  var nameController = TextEditingController();
  var idController = TextEditingController();
  var scoreController = TextEditingController();
  @override
  Widget build(BuildContext context) {

   

    var numItem = widget.index;
    if (numItem >= 0) {
      idController.text = Student.studentItems[numItem]['id'];
      nameController.text = Student.studentItems[numItem]['name'];
      scoreController.text = Student.studentItems[numItem]['score'].toString();
    }
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: idController,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              labelText: 'รหัสนักศึกษา',
              focusColor: Colors.deepOrange,
              labelStyle: TextStyle(
                  decorationColor: Colors.deepOrange,
                  color: Colors.black,
                  fontSize: 16),
              icon: Icon(
                Icons.key,
                color: Colors.deepOrange,
                size: 30,
              ),
              fillColor: Colors.deepOrange,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.deepOrange, style: BorderStyle.solid),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: nameController,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              labelText: 'ชื่อนักศึกษา',
              focusColor: Colors.deepOrange,
              labelStyle: TextStyle(
                  decorationColor: Colors.deepOrange,
                  color: Colors.black,
                  fontSize: 16),
              icon: Icon(
                Icons.person_outlined,
                color: Colors.deepOrange,
                size: 30,
              ),
              fillColor: Colors.deepOrange,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.deepOrange, style: BorderStyle.solid),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: scoreController,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              labelText: 'คะแนน',
              focusColor: Colors.deepOrange,
              labelStyle: TextStyle(
                  decorationColor: Colors.deepOrange,
                  color: Colors.black,
                  fontSize: 16),
              icon: Icon(
                Icons.numbers,
                color: Colors.deepOrange,
                size: 30,
              ),
              fillColor: Colors.deepOrange,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.deepOrange, style: BorderStyle.solid),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          buildButton(),
        ],
      ),
    );
  }

  Widget buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              Student.studentItems[widget.index]['id'] = idController.text;
              Student.studentItems[widget.index]['name'] = nameController.text;
              Student.studentItems[widget.index]['score'] = int.parse(scoreController.text);
              Student.updateStudentItems();
            });
            Navigator.of(context).pop();
          },
          child: const Text(
            'บันทึก',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'ยกเลิก',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
