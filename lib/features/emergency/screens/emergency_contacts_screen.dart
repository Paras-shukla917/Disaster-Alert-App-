import 'package:flutter/material.dart';

class EmergencyContactsScreen extends StatelessWidget {
  const EmergencyContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      appBar: AppBar(
        title: const Text(
          'Emergency Contacts',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.contact_phone,
                  size: 50,
                  color: Colors.red.shade700,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Emergency Contacts',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Quick access to important emergency services',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          _contactCard(
            icon: Icons.local_police,
            title: 'Police',
            number: '112',
            color: Colors.blue,
          ),

          _contactCard(
            icon: Icons.medical_services,
            title: 'Ambulance',
            number: '108',
            color: Colors.red,
          ),

          _contactCard(
            icon: Icons.local_fire_department,
            title: 'Fire Service',
            number: '101',
            color: Colors.orange,
          ),

          _contactCard(
            icon: Icons.support_agent,
            title: 'Emergency Helpline',
            number: '112',
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _contactCard({
    required IconData icon,
    required String title,
    required String number,
    required Color color,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),

        leading: CircleAvatar(
          radius: 26,
          backgroundColor: color.withValues(alpha: 0.12),
          child: Icon(
            icon,
            color: color,
            size: 28,
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(
          number,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),

        trailing: IconButton(
          onPressed: () {
            // Call functionality can be connected later.
          },
          icon: Icon(
            Icons.call,
            color: color,
          ),
        ),
      ),
    );
  }
}