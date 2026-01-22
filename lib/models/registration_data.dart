class RegistrationData {
  String name;
  String email;
  DateTime date;
  String eventType;
  String preference;
  bool termsAccepted;

  RegistrationData({
    this.name = '',
    this.email = '',
    DateTime? date,
    this.eventType = 'conference',
    this.preference = 'palcoA',
    this.termsAccepted = false,
  }) : date = date ?? DateTime.now();

  @override
  String toString() {
    return 'RegistrationData(name: $name, email: $email, date: $date, eventType: $eventType, preference: $preference, termsAccepted: $termsAccepted)';
  }
}
