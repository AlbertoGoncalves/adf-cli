import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../repositories/student_repository.dart';

class DeleteByIdCommand extends Command {
  StudentRepository studentRepository;

  @override
  String get description => 'Delete Student';

  @override
  String get name => 'delete';

  DeleteByIdCommand(this.studentRepository) {
    argParser.addOption('id', help: 'Student id', abbr: 'i');
  }

  @override
  Future<void> run() async {
    print('------------------------------');
    final id = int.tryParse(argResults?['id']);

    if (id == null) {
      print('Favor informar o id do aluno com o comando --id=0 ou -i 0');
      return;
    }

    try {
      final student = await studentRepository.findById(id);

      print('-------------------------------------------------');
      print('Aluno ${student.name}');
      print('-------------------------------------------------');

      print('id: ${student.id}');
      print('Nome: ${student.name}');
      print('Idade ${student.age ?? 'Não informado'}');
      print('Cursos:');
      student.nameCourses.forEach(print);
      print('Endereço:');
      print(
          '  ${student.address.street} - ${student.address.zipCode} - ${student.address.city.name}');
      print('-------------------------------------------------');

      print('Deseja realmente excluir aluno, (S ou N)');

      final deleteOk = stdin.readLineSync();

      if (deleteOk?.toLowerCase() == 's') {
        print('Aguarde, excluindo dados do aluno');

        await studentRepository.deleteById(student);

        print('Aluno id: $id Nome: ${student.name} excluindo com sucesso');
      } else {
        print('Comando excluir cancelado');
      }

      print('------------------------------');
    } catch (e) {
      print("Erro ao excluir aluno, Id aluno invalido");
    }
  }
}
