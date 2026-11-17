import 'package:flutter/material.dart';

class SafetyScreen extends StatefulWidget {
  const SafetyScreen({super.key});

  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
  String _selectedGuide = 'Earthquake';
  final Map<String, bool> _checkedItems = {
    'Anchor Tall & Heavy Furniture': true,
    'Pack 72-Hour Survival Go-Bag': false,
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        // Offline Cache Banner
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              const Icon(Icons.cloud_done_outlined, color: Colors.green, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Cached Offline Guide', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    Text('All protocols ready without cellular signal', style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(6)),
                child: const Text('v4.2', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        const Text(
          'CIVIL DEFENSE DIRECTIVES',
          style: TextStyle(color: Color(0xFFD90429), fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.8),
        ),
        const SizedBox(height: 4),
        const Text('Preparedness & Safety', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(
          'Official verified survival procedures and interactive pre-disaster safety checklists.',
          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
        ),
        const SizedBox(height: 14),

        // Category Tabs
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ['Earthquake', 'Flood', 'Cyclone', 'Fire'].map((cat) {
              final selected = _selectedGuide == cat;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(cat),
                  selected: selected,
                  onSelected: (_) => setState(() => _selectedGuide = cat),
                  selectedColor: const Color(0xFF14171F),
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: selected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 16),

        // Dynamic Protocol Card
        _buildActiveGuideCard(),
        const SizedBox(height: 20),

        // Other Hazards Overview
        Text(
          'OTHER HAZARDS OVERVIEW',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey[600], letterSpacing: 0.8),
        ),
        const SizedBox(height: 10),
        _buildOverviewTile('Flood Protocols', 'High-ground routing & water safety', () => setState(() => _selectedGuide = 'Flood')),
        _buildOverviewTile('Cyclone Protocols', 'Securing roof, shutters & gale shelters', () => setState(() => _selectedGuide = 'Cyclone')),
        _buildOverviewTile('Fire Protocols', 'Stop-drop-roll & PASS fire extinguisher', () => setState(() => _selectedGuide = 'Fire')),
        const SizedBox(height: 16),

        // Bottom Red Call Button
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.call, size: 18),
          label: const Text('Direct Emergency Dispatch Line (112)', style: TextStyle(fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD90429),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
      ],
    );
  }

  Widget _buildActiveGuideCard() {
    if (_selectedGuide == 'Earthquake') {
      return Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=800',
                height: 130,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('SEISMIC RESPONSE CODE', style: TextStyle(color: Color(0xFFD90429), fontSize: 10, fontWeight: FontWeight.bold)),
                Text('3 min read', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 4),
            const Text('Earthquake Survival Protocols', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(
              'Rapid tactical directives calibrated for structural tremors and aftershock containment.',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            const SizedBox(height: 14),
            const Text('1   Before: Preparation', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 8),
            ..._checkedItems.keys.map((key) {
              return CheckboxListTile(
                value: _checkedItems[key],
                onChanged: (val) => setState(() => _checkedItems[key] = val ?? false),
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.black87,
                title: Text(key, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                subtitle: Text(
                  key.contains('Anchor')
                      ? 'Fasten bookcases, water heaters, and large flat screens securely into structural wall studs.'
                      : '3L clean water per person, crank radio, lithium torch, comprehensive sterile first-aid kit, and powerbanks.',
                  style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                ),
              );
            }),
          ],
        ),
      );
    }

    final Map<String, Map<String, String>> guides = {
      'Flood': {
        'tag': 'RAPID INUNDATION DIRECTIVES',
        'title': 'Flood Survival Rules',
        'desc': 'Turn Around, Don\'t Drown: Just 15cm (6 inches) of rapid water can knock an adult off their feet.',
        'tip1': 'Never drive through water-covered roadways or bridges.',
        'tip2': 'Boil municipal water for a full 3 minutes before ingesting.',
      },
      'Cyclone': {
        'tag': 'EXTREME GALE & PRESSURE DROP',
        'title': 'Cyclone & Typhoon Protocols',
        'desc': 'Secure sheet metal roofs, board external windows, and retreat to central interior hallway.',
        'tip1': 'Beware the "Eye of the Storm" calm; violent counter-winds follow abruptly.',
        'tip2': 'Disconnect rooftop solar arrays and exterior antennae.',
      },
      'Fire': {
        'tag': 'THERMAL & SMOKE MANAGEMENT',
        'title': 'Structural Fire Procedures',
        'desc': 'Crawl low beneath heavy toxic smoke layers and memorize the PASS extinguisher method.',
        'tip1': 'P.A.S.S: Pull the pin, Aim at base, Squeeze lever, Sweep side to side.',
        'tip2': 'Check closed doors with back of hand before turning handle.',
      },
    };

    final data = guides[_selectedGuide]!;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data['tag']!, style: const TextStyle(color: Color(0xFFD90429), fontSize: 10, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(data['title']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(data['desc']!, style: TextStyle(fontSize: 13, color: Colors.grey[700], height: 1.4)),
          const SizedBox(height: 14),
          _buildTipBox(data['tip1']!),
          const SizedBox(height: 8),
          _buildTipBox(data['tip2']!),
        ],
      ),
    );
  }

  Widget _buildTipBox(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 18),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }

  Widget _buildOverviewTile(String title, String subtitle, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ],
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}