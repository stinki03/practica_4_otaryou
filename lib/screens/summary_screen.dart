import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/registration_data.dart';

class SummaryScreen extends StatelessWidget {
  final RegistrationData data;

  const SummaryScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.summaryTitle)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Card(
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Profile Image Simulation
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                    child: Text(
                      data.name.isNotEmpty ? data.name[0].toUpperCase() : '?',
                      style: TextStyle(
                        fontSize: 48,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.profileImage,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Divider(height: 32),

                  // Details
                  _buildDetailRow(context, l10n.nameLabel, data.name),
                  _buildDetailRow(context, l10n.emailLabel, data.email),
                  _buildDetailRow(
                    context,
                    l10n.dateLabel,
                    DateFormat('yyyy-MM-dd').format(data.date),
                  ),
                  _buildDetailRow(
                    context,
                    l10n.eventTypeLabel,
                    _getLocalizedType(l10n, data.eventType),
                  ),
                  _buildDetailRow(
                    context,
                    l10n.preferenceLabel,
                    _getLocalizedPreference(l10n, data.preference),
                  ),

                  const SizedBox(height: 32),
                  FilledButton(
                    onPressed: () {
                      // Return to root (pop until first)
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getLocalizedType(AppLocalizations l10n, String type) {
    switch (type) {
      case 'conference':
        return l10n.typeConference;
      case 'workshop':
        return l10n.typeWorkshop;
      case 'seminar':
        return l10n.typeSeminar;
      default:
        return type;
    }
  }

  String _getLocalizedPreference(AppLocalizations l10n, String pref) {
    switch (pref) {
      case 'palcoA':
        return l10n.palcoA;
      case 'palcoB':
        return l10n.palcoB;
      case 'palcoC':
        return l10n.palcoC;
      default:
        return pref;
    }
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
