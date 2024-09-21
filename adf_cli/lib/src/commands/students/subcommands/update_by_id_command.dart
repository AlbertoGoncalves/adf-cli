import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../models/address.dart';
import '../../../models/city.dart';
import '../../../models/phone.dart';
import '../../../models/student.dart';
import '../../../repositories/product_repository.dart';
import '../../../repositories/student_repository.dart';

class UpdateByIdCommand extends Command {
  StudentRepository studentRepository;
  final ProductRepository productRepository;

  @override
  String get description => 'Update Student';

  @override
  String get name => 'update';

  UpdateByIdCommand(this.studentRepository)
      : productRepository = ProductRepository() {
    argParser.addOption('file', help: 'Path of the csv file', abbr: 'f');
    argParser.addOption('id', help: 'Student id', abbr: 'i');
  }

  @override
  Future<void> run() async {
    print('------------------------------');
    final filePath = argResults?['file'];
    final id = argResults?['id'];

    if (id == null) {
      print('Favor informar o id do aluno com o comando --id=0 ou -i 0');
      return;
    }

    print('Aguarde, atualizando dados do aluno');
    final students = File(filePath).readAsLinesSync();
    print('------------------------------');

    if (students.length > 1) {
      print('Favor informar apenas um aluno no arquivo $filePath');
      return;
    } else if (students.isEmpty) {
      print('Favor informar um aluno no arquivo $filePath');
      return;
    }

    final student = students.first;
    // for (var student in students) {
    final studentData = student.split(';');
    final courseCsv = studentData[2].split(',').map((e) async {
      e.trim();
      final course = await productRepository.findByName(e);
      course.isStudent = true;
      return course;
    }).toList();

    final courses = await Future.wait(courseCsv);

    final studentModel = Student(
      id: int.parse(id),
      name: studentData[0],
      age: int.parse(studentData[1]),
      nameCourses: courses.map((e) => e.name).toList(),
      courses: courses,
      address: Address(
        street: studentData[3],
        number: int.parse(studentData[4]),
        zipCode: studentData[5],
        city: City(
          id: 1,
          name: studentData[6],
        ),
        phone: Phone(
          ddd: int.parse(studentData[7]),
          phone: studentData[8],
        ),
      ),
    );

    await studentRepository.update(studentModel);
    // }
    print('------------------------------');
    print('Aluno atualizado com sucesso');
  }
}
