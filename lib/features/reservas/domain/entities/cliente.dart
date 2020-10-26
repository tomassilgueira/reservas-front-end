import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Cliente extends Equatable {
  final String id;
  final String nombre;
  final String apellido;
  final String ci;

  const Cliente(
      {@required this.id,
      @required this.nombre,
      @required this.apellido,
      @required this.ci});

  @override
  List<Object> get props => [id, nombre, apellido, ci];

  @override
  bool get stringify => true;
}
