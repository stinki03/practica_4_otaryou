// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Inscription à l\'événement';

  @override
  String get nameLabel => 'Nom';

  @override
  String get emailLabel => 'E-mail';

  @override
  String get dateLabel => 'Date de l\'événement';

  @override
  String get eventTypeLabel => 'Type d\'événement';

  @override
  String get preferenceLabel => 'Préférence de siège';

  @override
  String get termsLabel => 'J\'accepte les conditions générales';

  @override
  String get registerButton => 'S\'inscrire';

  @override
  String get confirmTitle => 'Confirmer l\'inscription';

  @override
  String get confirmContent =>
      'Êtes-vous sûr de vouloir vous inscrire avec ces détails ?';

  @override
  String get cancelButton => 'Annuler';

  @override
  String get confirmButton => 'Confirmer';

  @override
  String get summaryTitle => 'Résumé de l\'inscription';

  @override
  String get profileImage => 'Image de profil';

  @override
  String get missingFields => 'Veuillez remplir tous les champs obligatoires';

  @override
  String get invalidEmail => 'Veuillez entrer une adresse e-mail valide';

  @override
  String get palcoA => 'Loge A';

  @override
  String get palcoB => 'Loge B';

  @override
  String get palcoC => 'Loge C';

  @override
  String get typeConference => 'Conférence';

  @override
  String get typeWorkshop => 'Atelier';

  @override
  String get typeSeminar => 'Séminaire';
}
