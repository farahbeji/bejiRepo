import 'package:flutter/material.dart';
import 'package:edu_expo/models/user_student.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: students.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 0.85),
       itemBuilder: (context,index)=>CategoryCard(
          student: students[index],
       ));
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key, required this.student,
  }) : super(key: key);
final Student student;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
           padding:const EdgeInsets.all(10.0),

           decoration: BoxDecoration(
             color: student.color,
             borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            children:[
              Image.asset(student.image,
               height: 100 ,
               //width: 50,)
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
              student.name, 
              style: const TextStyle(
                fontSize:18,
                color: Colors.white,
                fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                height: 10,
              ),
                Text(
             "${student.major} majors", 
              style: const TextStyle(
                fontSize:15,
                color: Colors.white,
                fontWeight: FontWeight.bold),
                ),
            ] 
            
            
            ),
           ),
    );
  }
}
