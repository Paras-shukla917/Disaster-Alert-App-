import 'package:flutter/material.dart';
import 'disaster_details_screen.dart';

class DisasterGuideScreen extends StatelessWidget {
  const DisasterGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      appBar: AppBar(
        title: const Text(
          'Disaster Safety Guide',
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
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.health_and_safety,
                  size: 50,
                  color: Colors.orange.shade700,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Stay Safe During Disasters',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Learn important safety steps before, during and after a disaster.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          _guideCard(
            context,
            Icons.water,
            'Flood',
            'Learn how to stay safe during flooding.',
            Colors.blue,
          ),

          _guideCard(
            context,
            Icons.public,
            'Earthquake',
            'Know what to do before, during and after an earthquake.',
            Colors.brown,
          ),

          _guideCard(
            context,
            Icons.local_fire_department,
            'Fire',
            'Learn basic fire safety and evacuation steps.',
            Colors.red,
          ),

          _guideCard(
            context,
            Icons.air,
            'Cyclone',
            'Stay prepared before and during severe storms.',
            Colors.teal,
          ),

          _guideCard(
            context,
            Icons.bolt,
            'Lightning',
            'Learn how to protect yourself during lightning.',
            Colors.amber.shade800,
          ),

          _guideCard(
            context,
            Icons.terrain,
            'Landslide',
            'Know the warning signs and safe actions during landslides.',
            Colors.green.shade700,
          ),
        ],
      ),
    );
  }

  Widget _guideCard(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    Color color,
  ) {
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
          radius: 27,
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
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 17,
        ),
        onTap: () {
          Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DisasterDetailsScreen(
        disaster: title,
      ),
            ),
          );
        },
      ),
    );
  }
}