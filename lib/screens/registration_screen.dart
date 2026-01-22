import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../l10n/app_localizations.dart';
import '../models/registration_data.dart';

import 'summary_screen.dart';

class RegistrationScreen extends StatefulWidget {
  final void Function(Locale) onLocaleChange;
  const RegistrationScreen({super.key, required this.onLocaleChange});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _data = RegistrationData();
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController.text = DateFormat('yyyy-MM-dd').format(_data.date);
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _data.date,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _data.date) {
      setState(() {
        _data.date = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void _submitForm() {
    final l10n = AppLocalizations.of(context)!;
    if (_formKey.currentState!.validate()) {
      if (!_data.termsAccepted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.missingFields)));
        return;
      }
      _formKey.currentState!.save();
      _showConfirmationDialog();
    }
  }

  void _showConfirmationDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.confirmTitle),
        content: Text(l10n.confirmContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.cancelButton),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SummaryScreen(data: _data),
                ),
              );
            },
            child: Text(l10n.confirmButton),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(
          'Select Language',
        ), // Ideally localized, but "Select Language" is generic enough or add to arb
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.flag),
              title: const Text('English'),
              onTap: () {
                widget.onLocaleChange(const Locale('en'));
                Navigator.pop(ctx);
              },
            ),
            ListTile(
              leading: const Icon(Icons.flag),
              title: const Text('Español'),
              onTap: () {
                widget.onLocaleChange(const Locale('es'));
                Navigator.pop(ctx);
              },
            ),
            ListTile(
              leading: const Icon(Icons.flag),
              title: const Text('Français'),
              onTap: () {
                widget.onLocaleChange(const Locale('fr'));
                Navigator.pop(ctx);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            tooltip: 'Change Language',
            onPressed: () => _showLanguageDialog(context),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: orientation == Orientation.landscape ? 800 : 500,
                ),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Name
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: l10n.nameLabel,
                              prefixIcon: const Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return l10n.missingFields;
                              }
                              return null;
                            },
                            onSaved: (value) => _data.name = value!,
                          ),
                          const SizedBox(height: 16),

                          // Email
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: l10n.emailLabel,
                              prefixIcon: const Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return l10n.missingFields;
                              }
                              if (!value.contains('@') ||
                                  !value.contains('.')) {
                                return l10n.invalidEmail;
                              }
                              return null;
                            },
                            onSaved: (value) => _data.email = value!,
                          ),
                          const SizedBox(height: 16),

                          // Date
                          TextFormField(
                            controller: _dateController,
                            decoration: InputDecoration(
                              labelText: l10n.dateLabel,
                              prefixIcon: const Icon(Icons.calendar_today),
                            ),
                            readOnly: true,
                            onTap: () => _selectDate(context),
                          ),
                          const SizedBox(height: 16),

                          // Event Type Dropdown
                          DropdownButtonFormField<String>(
                            value: _data.eventType,
                            decoration: InputDecoration(
                              labelText: l10n.eventTypeLabel,
                              prefixIcon: const Icon(Icons.category),
                            ),
                            items: [
                              DropdownMenuItem(
                                value: 'conference',
                                child: Text(l10n.typeConference),
                              ),
                              DropdownMenuItem(
                                value: 'workshop',
                                child: Text(l10n.typeWorkshop),
                              ),
                              DropdownMenuItem(
                                value: 'seminar',
                                child: Text(l10n.typeSeminar),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _data.eventType = value!;
                              });
                            },
                          ),
                          const SizedBox(height: 24),

                          // Preferences Radio
                          Text(
                            l10n.preferenceLabel,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile<String>(
                                  title: Text(l10n.palcoA),
                                  value: 'palcoA',
                                  groupValue: _data.preference,
                                  contentPadding: EdgeInsets.zero,
                                  onChanged: (value) =>
                                      setState(() => _data.preference = value!),
                                ),
                              ),
                              Expanded(
                                child: RadioListTile<String>(
                                  title: Text(l10n.palcoB),
                                  value: 'palcoB',
                                  groupValue: _data.preference,
                                  contentPadding: EdgeInsets.zero,
                                  onChanged: (value) =>
                                      setState(() => _data.preference = value!),
                                ),
                              ),
                              // Optional Palco C
                              Expanded(
                                child: RadioListTile<String>(
                                  title: Text(l10n.palcoC),
                                  value: 'palcoC',
                                  groupValue: _data.preference,
                                  contentPadding: EdgeInsets.zero,
                                  onChanged: (value) =>
                                      setState(() => _data.preference = value!),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Terms Checkbox
                          CheckboxListTile(
                            title: Text(l10n.termsLabel),
                            value: _data.termsAccepted,
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            onChanged: (value) {
                              setState(() {
                                _data.termsAccepted = value!;
                              });
                            },
                            subtitle:
                                !_data.termsAccepted &&
                                    _formKey.currentState != null &&
                                    _formKey.currentState!.validate() == false
                                ? Text(
                                    l10n.missingFields,
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.error,
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(height: 24),

                          // Submit Button
                          FilledButton.icon(
                            onPressed: _submitForm, // _submitForm,
                            icon: const Icon(Icons.check_circle),
                            label: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                              ),
                              child: Text(
                                l10n.registerButton,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
