
import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../models/student.dart';
import '../../../repositories/student_repository.dart';

class FindAllCommand extends Command {

  final StudentRepository repository;

  @override
  String get description => 'Find all Students';

  @override
  String get name => 'findAll';

  FindAllCommand(this.repository);
  
  @override
  Future<void> run() async {
    print('Aguarde buscando alunos...');
    final students = await repository.findAll();
    print('Apresentar tambem os Cursos? (S ou N)');
    
    final showCourses = stdin.readLineSync();
    print(showCourses);
  }
  
}