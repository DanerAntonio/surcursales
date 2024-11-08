class CuentaAhorro {
  final int numeroCuenta;
  final String nombreCliente;
  double saldo;
  final String numeroDocumento;

  CuentaAhorro({
    required this.numeroCuenta,
    required this.nombreCliente,
    required this.numeroDocumento,
    this.saldo = 10000, // Saldo inicial por defecto
  });

  bool depositar(double monto) {
    if (monto > 0) {
      saldo += monto;
      return true;
    }
    return false;
  }

  bool retirar(double monto) {
    if (monto > 0 && saldo >= monto) {
      saldo -= monto;
      return true;
    }
    return false;
  }

  @override
  String toString() {
    return 'Cuenta #$numeroCuenta - Cliente: $nombreCliente - Saldo: \$${saldo.toStringAsFixed(2)}';
  }
}