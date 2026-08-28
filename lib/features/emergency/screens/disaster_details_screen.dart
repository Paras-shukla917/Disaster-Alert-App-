import 'package:flutter/material.dart';

class DisasterDetailsScreen extends StatelessWidget {
  final String disaster;

  const DisasterDetailsScreen({
    super.key,
    required this.disaster,
  });

  @override
  Widget build(BuildContext context) {
    final details = _getDisasterDetails(disaster);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      appBar: AppBar(
        title: Text(
          disaster,
          style: const TextStyle(
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
                  Icons.health_and_safety,
                  size: 50,
                  color: Colors.red.shade700,
                ),
                const SizedBox(height: 10),
                Text(
                  '$disaster Safety Guide',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Follow these safety steps and official instructions.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          _SafetySection(
            title: 'BEFORE',
            icon: Icons.check_circle_outline,
            items: details['before']!,
          ),

          _SafetySection(
            title: 'DURING',
            icon: Icons.warning_amber_rounded,
            items: details['during']!,
          ),

          _SafetySection(
            title: 'AFTER',
            icon: Icons.task_alt,
            items: details['after']!,
          ),
        ],
      ),
    );
  }

  Map<String, List<String>> _getDisasterDetails(String type) {
    switch (type) {
      case 'Earthquake':
        return {
          'before': [
            'Prepare an emergency kit',
            'Identify safe locations',
            'Keep emergency contacts ready',
          ],
          'during': [
            'Drop, Cover and Hold',
            'Stay away from windows',
            'Protect your head and neck',
          ],
          'after': [
            'Check for injuries',
            'Leave damaged buildings',
            'Follow official instructions',
          ],
        };

      case 'Flood':
        return {
          'before': [
            'Keep an emergency kit ready',
            'Know higher ground and safe routes',
            'Monitor official warnings',
          ],
          'during': [
            'Move to higher ground',
            'Avoid flooded roads',
            'Follow evacuation instructions',
          ],
          'after': [
            'Avoid contaminated water',
            'Check for damaged structures',
            'Follow local authorities',
          ],
        };

      case 'Fire':
        return {
          'before': [
            'Keep fire extinguishers accessible',
            'Know emergency exits',
            'Prepare an emergency plan',
          ],
          'during': [
            'Raise the alarm',
            'Leave the building immediately',
            'Stay low if there is smoke',
          ],
          'after': [
            'Do not re-enter damaged buildings',
            'Check for injuries',
            'Wait for official clearance',
          ],
        };

      case 'Cyclone':
        return {
          'before': [
            'Secure loose outdoor objects',
            'Store emergency food and water',
            'Monitor official warnings',
          ],
          'during': [
            'Stay indoors',
            'Stay away from windows',
            'Follow evacuation orders',
          ],
          'after': [
            'Avoid fallen power lines',
            'Watch for further warnings',
            'Return only when authorities allow',
          ],
        };

      case 'Lightning':
        return {
          'before': [
            'Monitor weather warnings',
            'Identify safe indoor shelter',
            'Avoid exposed outdoor areas',
          ],
          'during': [
            'Move indoors immediately',
            'Stay away from windows',
            'Avoid using electrical appliances',
          ],
          'after': [
            'Check for injuries',
            'Avoid damaged electrical lines',
            'Follow local safety instructions',
          ],
        };

      case 'Landslide':
        return {
          'before': [
            'Learn local landslide warning signs',
            'Know safe evacuation routes',
            'Keep an emergency kit ready',
          ],
          'during': [
            'Move away from the landslide area',
            'Follow evacuation instructions',
            'Avoid crossing unstable ground',
          ],
          'after': [
            'Stay away from the affected area',
            'Watch for additional landslides',
            'Follow official instructions',
          ],
        };

      default:
        return {
          'before': ['Prepare an emergency kit'],
          'during': ['Move to a safe location'],
          'after': ['Follow official instructions'],
        };
    }
  }
}

class _SafetySection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> items;

  const _SafetySection({
    required this.title,
    required this.icon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.red.shade700,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '✓ ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}