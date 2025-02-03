import 'package:flutter/material.dart';
import 'package:student_app/add_screen.dart';
import 'package:student_app/edit_screen.dart';
import 'package:student_app/student.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {  
  @override
  Widget build(BuildContext context) {
    
    Student.updateStudentItems = (){
      setState(() {
        Student.countItem = Student.studentItems.length;
      });
    };
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 10),
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.deepOrange,
                  child: Icon(Icons.people_alt, size: 40, color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'รายชื่อนักศึกษา',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Text('นักศึกษาทั้งหมด ${Student.countItem} คน')
              ],
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 55),
                  child: studentList(context),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> const AddScreen())
            );
          }, //เปิดหน้า addStudentScreen
          child: const Icon(
            Icons.add,
            size: 40,
            color: Colors.blue,
          )),
    );
  }

  Widget studentList(BuildContext ctx) {
    return ListView.builder(
      itemCount: Student.countItem,
      itemBuilder: (ctx, index){
        return Column(
          children: [
            //ลบรายการในแถวที่ใช้นิ้วเลื่อนจากขวาไปซ้าย end to Start
            Dismissible(
              key: Key(Student.studentItems[index]['id']),
              background: Container(
                decoration: const BoxDecoration(color: Colors.deepOrange),
              ),
              onDismissed: (direction){
                if(direction==DismissDirection.endToStart){
                  Student.studentItems.removeAt(index);
                  setState(() {
                    Student.countItem = Student.studentItems.length;
                  });
                }
              }, 
              direction: DismissDirection.endToStart,
              child: studentTile(index)),
            const Divider(
              color: Colors.blueGrey, indent: 20,endIndent: 20,height: 1,
            )
          ],
        );

      });
  }
  Widget studentTile(int index){
    //var id = Student.studentItems[index]['id'];
    var name = Student.studentItems[index]['name'];
    var score = Student.studentItems[index]['score'];
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 60, right: 60
      ),
      title: Text('${index+1}. $name',
                    style: const TextStyle(color: Colors.deepOrange, 
                    fontSize: 18,fontWeight: FontWeight.w500),
      ),
      trailing: Text(score.toString(), 
                    style: const TextStyle(color: Colors.deepOrange, 
                    fontSize: 18,fontWeight: FontWeight.w500),
      ),
      onTap: (){
        showModalBottomSheet(
          isScrollControlled: true,
          context: context, 
          builder: (conext){return EditScreen(index: index);});
      },
    );
  }
}