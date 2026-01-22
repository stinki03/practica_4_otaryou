// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Registro de Eventos';

  @override
  String get nameLabel => 'Nombre';

  @override
  String get emailLabel => 'Correo Electrónico';

  @override
  String get dateLabel => 'Fecha del Evento';

  @override
  String get eventTypeLabel => 'Tipo de Evento';

  @override
  String get preferenceLabel => 'Preferencia de Asiento';

  @override
  String get termsLabel => 'Acepto los Términos y Condiciones';

  @override
  String get registerButton => 'Registrar';

  @override
  String get confirmTitle => 'Confirmar Registro';

  @override
  String get confirmContent =>
      '¿Está seguro de que desea registrarse con estos detalles?';

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get confirmButton => 'Confirmar';

  @override
  String get summaryTitle => 'Resumen de Registro';

  @override
  String get profileImage => 'Imagen de Perfil';

  @override
  String get missingFields =>
      'Por favor complete todos los campos obligatorios';

  @override
  String get invalidEmail => 'Por favor ingrese un correo válido';

  @override
  String get palcoA => 'Palco A';

  @override
  String get palcoB => 'Palco B';

  @override
  String get palcoC => 'Palco C';

  @override
  String get typeConference => 'Conferencia';

  @override
  String get typeWorkshop => 'Taller';

  @override
  String get typeSeminar => 'Seminario';
}
