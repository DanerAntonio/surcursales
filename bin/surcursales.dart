import 'dart:io';
import '../lib/services/banco_service.dart';

void main() {
  final banco = BancoService();
  
  while (true) {
    print('\n=== Gestión de Sucursales y Cuentas de Ahorro ===');
    print('1. Registrar una Sucursal');
    print('2. Listar Sucursales');
    print('3. Buscar una Sucursal');
    print('4. Cantidad de Sucursales');
    print('5. Cuentas de Ahorro');
    print('6. Salir');
    
    stdout.write('\nSeleccione una opción: ');
    final opcion = stdin.readLineSync();
    
    switch (opcion) {
      case '1':
        registrarSucursal(banco);
        break;
      case '2':
        banco.listarSucursales();
        break;
      case '3':
        buscarSucursal(banco);
        break;
      case '4':
        print('\nCantidad total de sucursales: ${banco.cantidadSucursales()}');
        break;
      case '5':
        menuCuentasAhorro(banco);
        break;
      case '6':
        print('¡Gracias por usar el sistema!');
        return;
      default:
        print('Opción no válida');
    }
  }
}

void registrarSucursal(BancoService banco) {
  stdout.write('\nNombre de la sucursal: ');
  final nombre = stdin.readLineSync() ?? '';
  
  stdout.write('Ciudad: ');
  final ciudad = stdin.readLineSync() ?? '';
  
  stdout.write('Dirección: ');
  final direccion = stdin.readLineSync() ?? '';
  
  banco.registrarSucursal(nombre, ciudad, direccion);
  print('\nSucursal registrada exitosamente.');
}

void buscarSucursal(BancoService banco) {
  stdout.write('\nIngrese el nombre de la sucursal a buscar: ');
  final nombre = stdin.readLineSync() ?? '';
  
  final sucursal = banco.buscarSucursal(nombre);
  if (sucursal != null) {
    print('\nSucursal encontrada:');
    print(sucursal);
  } else {
    print('\nSucursal no encontrada.');
  }
}

void menuCuentasAhorro(BancoService banco) {
  while (true) {
    print('\n=== Menú de Cuentas de Ahorro ===');
    print('1. Crear nueva cuenta');
    print('2. Depositar');
    print('3. Retirar');
    print('4. Consultar saldo');
    print('5. Volver al menú principal');
    
    stdout.write('\nSeleccione una opción: ');
    final opcion = stdin.readLineSync();
    
    switch (opcion) {
      case '1':
        crearCuenta(banco);
        break;
      case '2':
        realizarDeposito(banco);
        break;
      case '3':
        realizarRetiro(banco);
        break;
      case '4':
        consultarSaldo(banco);
        break;
      case '5':
        return;
      default:
        print('Opción no válida');
    }
  }
}

void crearCuenta(BancoService banco) {
  stdout.write('\nNombre del cliente: ');
  final nombre = stdin.readLineSync() ?? '';
  
  stdout.write('Número de documento: ');
  final documento = stdin.readLineSync() ?? '';
  
  final cuenta = banco.crearCuenta(nombre, documento);
  print('\nCuenta creada exitosamente:');
  print(cuenta);
}

void realizarDeposito(BancoService banco) {
  stdout.write('\nNúmero de cuenta: ');
  final numeroCuenta = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  
  final cuenta = banco.buscarCuenta(numeroCuenta);
  if (cuenta == null) {
    print('Cuenta no encontrada.');
    return;
  }
  
  stdout.write('Monto a depositar: ');
  final monto = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
  
  if (cuenta.depositar(monto)) {
    print('Depósito realizado exitosamente.');
    print('Nuevo saldo: \$${cuenta.saldo}');
  } else {
    print('Error al realizar el depósito.');
  }
}

void realizarRetiro(BancoService banco) {
  stdout.write('\nNúmero de cuenta: ');
  final numeroCuenta = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  
  final cuenta = banco.buscarCuenta(numeroCuenta);
  if (cuenta == null) {
    print('Cuenta no encontrada.');
    return;
  }
  
  stdout.write('Monto a retirar: ');
  final monto = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
  
  if (cuenta.retirar(monto)) {
    print('Retiro realizado exitosamente.');
    print('Nuevo saldo: \$${cuenta.saldo}');
  } else {
    print('Error al realizar el retiro. Verifique el monto y el saldo disponible.');
  }
}

void consultarSaldo(BancoService banco) {
  stdout.write('\nNúmero de cuenta: ');
  final numeroCuenta = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  
  final cuenta = banco.buscarCuenta(numeroCuenta);
  if (cuenta != null) {
    print(cuenta);
  } else {
    print('Cuenta no encontrada.');
  }
}