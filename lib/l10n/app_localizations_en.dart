// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Event Registration';

  @override
  String get nameLabel => 'Name';

  @override
  String get emailLabel => 'Email';

  @override
  String get dateLabel => 'Event Date';

  @override
  String get eventTypeLabel => 'Event Type';

  @override
  String get preferenceLabel => 'Seating Preference';

  @override
  String get termsLabel => 'I accept the Terms and Conditions';

  @override
  String get registerButton => 'Register';

  @override
  String get confirmTitle => 'Confirm Registration';

  @override
  String get confirmContent =>
      'Are you sure you want to register with these details?';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get confirmButton => 'Confirm';

  @override
  String get summaryTitle => 'Registration Summary';

  @override
  String get profileImage => 'Profile Image';

  @override
  String get missingFields => 'Please fill all required fields';

  @override
  String get invalidEmail => 'Please enter a valid email';

  @override
  String get palcoA => 'Box A';

  @override
  String get palcoB => 'Box B';

  @override
  String get palcoC => 'Box C';

  @override
  String get typeConference => 'Conference';

  @override
  String get typeWorkshop => 'Workshop';

  @override
  String get typeSeminar => 'Seminar';
}
