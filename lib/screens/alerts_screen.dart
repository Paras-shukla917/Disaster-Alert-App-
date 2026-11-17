import 'package:flutter/material.dart';
import '../models/alert_model.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  String _selectedSeverity = '';

  final List<String> _categories = ['All', 'Flood', 'Earthquake', 'Cyclone', 'Fire'];
  final List<String> _severities = ['Critical', 'High', 'Medium', 'Low'];

  List<DisasterAlertItem> get _filteredAlerts {
    return sampleAlerts.where((alert) {
      final matchesSearch = alert.title.toLowerCase().contains(_searchController.text.toLowerCase()) ||
          alert.location.toLowerCase().contains(_searchController.text.toLowerCase()) ||
          alert.category.toLowerCase().contains(_searchController.text.toLowerCase());
      final matchesCat = _selectedCategory == 'All' || alert.category == _selectedCategory;
      final matchesSev = _selectedSeverity.isEmpty || alert.severity == _selectedSeverity;
      return matchesSearch && matchesCat && matchesSev;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final alerts = _filteredAlerts;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        // Search Bar
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Search region, hazard or type...',
                  hintStyle: TextStyle(color: Colors.grey[500], fontSize: 13),
                  prefixIcon: const Icon(Icons.search, size: 20),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close, size: 18),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {});
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: const Icon(Icons.tune, size: 20),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Category Filter Pills
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _categories.map((cat) {
              final isSelected = _selectedCategory == cat;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(cat),
                  selected: isSelected,
                  onSelected: (_) => setState(() => _selectedCategory = cat),
                  selectedColor: Colors.black87,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: isSelected ? Colors.black87 : Colors.grey.shade300),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 8),

        // Severity Pills
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _severities.map((sev) {
              final isSelected = _selectedSeverity == sev;
              Color dotColor = sev == 'Critical'
                  ? const Color(0xFFD90429)
                  : sev == 'High'
                      ? Colors.deepOrange
                      : sev == 'Medium'
                          ? Colors.amber
                          : Colors.grey;

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedSeverity = isSelected ? '' : sev;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: isSelected ? dotColor.withOpacity(0.15) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: isSelected ? dotColor : Colors.grey.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.circle, size: 8, color: dotColor),
                        const SizedBox(width: 6),
                        Text(
                          sev == 'Medium' ? 'Med' : sev,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? dotColor : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 16),

        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Active Advisories', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('Sync: Just now', style: TextStyle(fontSize: 11, color: Colors.grey[500])),
          ],
        ),
        const SizedBox(height: 12),

        // Empty State or Alert List
        if (alerts.isEmpty)
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              children: [
                Icon(Icons.search_off, size: 42, color: Colors.grey[400]),
                const SizedBox(height: 10),
                const Text('No Active Alerts Found', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 6),
                Text(
                  'No emergency bulletins match your selected filters. Try searching for a different region or hazard type.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 14),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                      _selectedCategory = 'All';
                      _selectedSeverity = '';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('Reset All Filters'),
                ),
              ],
            ),
          )
        else
          ...alerts.map((alert) => _buildAdvisoryCard(alert)),

        const SizedBox(height: 12),
        // Bottom Push Banner
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF14171F),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Row(
            children: [
              Icon(Icons.notifications_active, color: Colors.white, size: 22),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Real-Time Push Alerts Active',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Text(
                      'Campus Zone radius monitoring: 25 km',
                      style: TextStyle(color: Colors.white60, fontSize: 11),
                    ),
                  ],
                ),
              ),
              Icon(Icons.check, color: Colors.greenAccent, size: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAdvisoryCard(DisasterAlertItem alert) {
    final isCritical = alert.severity == 'Critical';
    final badgeColor = isCritical
        ? const Color(0xFFD90429)
        : alert.severity == 'High'
            ? Colors.deepOrange
            : alert.severity == 'Medium'
                ? Colors.orange
                : Colors.grey.shade700;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isCritical ? const Color(0xFFD90429).withOpacity(0.4) : Colors.grey.shade200,
          width: isCritical ? 1.5 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(6)),
                child: Text(
                  alert.severity.toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(6)),
                child: Text(alert.category, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
              ),
              const Spacer(),
              Text(alert.time, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
            ],
          ),
          const SizedBox(height: 10),
          Text(alert.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 14, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(alert.location, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            ],
          ),
          const SizedBox(height: 12),

          if (alert.imageUrl.isNotEmpty)
            Container(
              height: 125,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(alert.imageUrl),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.darken),
                ),
              ),
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(6)),
                child: Text(
                  alert.badgeText,
                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                ),
              ),
            ),

          Text(alert.description, style: TextStyle(fontSize: 13, color: Colors.grey[700], height: 1.4)),
          const SizedBox(height: 14),

          // Action Row
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.info_outline, size: 16),
                  label: Text(alert.buttonText, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isCritical ? const Color(0xFFD90429) : const Color(0xFF14171F),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.share_outlined, size: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}