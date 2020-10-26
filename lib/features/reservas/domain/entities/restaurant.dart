import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Restaurant extends Equatable {
  final String id;
  final String nombre;
  final String descripcion;

  const Restaurant(
      {@required this.id, @required this.nombre, @required this.descripcion});

  @override
  List<Object> get props => [id, nombre, descripcion];

  @override
  bool get stringify => true;
}