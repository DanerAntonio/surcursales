class Sucursal {
  final String nombre;
  final String ciudad;
  final String direccion;

  Sucursal({
    required this.nombre,
    required this.ciudad,
    required this.direccion,
  });

  @override
  String toString() {
    return 'Sucursal: $nombre, Ciudad: $ciudad, Dirección: $direccion';
  }
}