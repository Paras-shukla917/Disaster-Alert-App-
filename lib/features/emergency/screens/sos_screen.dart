import 'package:flutter/material.dart';
import 'emergency_contacts_screen.dart';

class SosScreen extends StatelessWidget {
  const SosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency SOS'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.warning_rounded,
                    size: 60,
                    color: Colors.red,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Need Emergency Help?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Choose an emergency service below',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {
                  _showMessage(
                    context,
                    'Emergency SOS activated!',
                  );
                },
                icon: const Icon(Icons.sos),
                label: const Text(
                  'SEND SOS',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 25),

            _serviceButton(
              context,
              Icons.local_police,
              'Police',
              'Police emergency assistance',
              Colors.blue,
            ),

            _serviceButton(
              context,
              Icons.medical_services,
              'Ambulance',
              'Medical emergency assistance',
              Colors.red,
            ),

            _serviceButton(
              context,
              Icons.local_fire_department,
              'Fire Service',
              'Fire and rescue assistance',
              Colors.orange,
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  _showMessage(
                    context,
                    'Location sharing selected',
                  );
                },
                icon: const Icon(Icons.location_on),
                label: const Text('Share My Location'),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EmergencyContactsScreen(),
     ),
  );
},
                icon: const Icon(Icons.contacts),
                label: const Text('Emergency Contacts'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _serviceButton(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    Color color,
  ) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.12),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(
          Icons.call,
          color: color,
        ),
        onTap: () {
          _showMessage(
            context,
            '$title selected',
          );
        },
      ),
    );
  }

  void _showMessage(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}