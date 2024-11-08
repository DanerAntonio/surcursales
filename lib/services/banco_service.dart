import '../models/surcursal.dart';
import '../models/cuenta_ahorro.dart';

class BancoService {
  final List<Sucursal> sucursales = [];
  final List<CuentaAhorro> cuentas = [];
  int _ultimoNumeroCuenta = 1110;

  // Métodos para Sucursales
  void registrarSucursal(String nombre, String ciudad, String direccion) {
    sucursales.add(Sucursal(
      nombre: nombre,
      ciudad: ciudad,
      direccion: direccion,
    ));
  }

  void listarSucursales() {
    if (sucursales.isEmpty) {
      print('No hay sucursales registradas.');
      return;
    }
    
    for (var i = 0; i < sucursales.length; i++) {
      print('${i + 1}. ${sucursales[i]}');
    }
  }

  Sucursal? buscarSucursal(String nombre) {
    try {
      return sucursales.firstWhere(
        (sucursal) => sucursal.nombre.toLowerCase() == nombre.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  int cantidadSucursales() => sucursales.length;

  // Métodos para Cuentas de Ahorro
  CuentaAhorro crearCuenta(String nombreCliente, String numeroDocumento) {
    _ultimoNumeroCuenta++;
    final cuenta = CuentaAhorro(
      numeroCuenta: _ultimoNumeroCuenta,
      nombreCliente: nombreCliente,
      numeroDocumento: numeroDocumento,
    );
    cuentas.add(cuenta);
    return cuenta;
  }

  CuentaAhorro? buscarCuenta(int numeroCuenta) {
    try {
      return cuentas.firstWhere(
        (cuenta) => cuenta.numeroCuenta == numeroCuenta,
      );
    } catch (e) {
      return null;
    }
  }
}