
import 'package:args/command_runner.dart';

import '../../../repositories/student_dio_repository.dart';

class FindByIdCommand extends Command {
  final StudentDioRepository repository;

  @override
  String get description => 'Find Student by id';

  @override
  String get name => 'byId';

  FindByIdCommand(this.repository) {
    argParser.addOption('id', help: 'Student Id', abbr: 'i');
  }

  @override
  Future<void> run() async {
    if (argResults?['id'] == null) {
      print('Por favor envie o id do aluno com o comando --id=0 ou -i 0');
      return;
    }
    final id = int.parse(argResults?['id']);
    print('Aguarde buscando alunos...');
    final student = await repository.findById(id);

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
  }
}
