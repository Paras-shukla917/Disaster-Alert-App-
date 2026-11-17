import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Function(int) onSwitchTab;

  const HomeScreen({super.key, required this.onSwitchTab});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        // Mesh Network Status Bar
        Row(
          children: [
            const Icon(Icons.circle, color: Colors.green, size: 8),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                'Mesh Node: Active • Synced 1m ago',
                style: TextStyle(fontSize: 11, color: Colors.grey[700]),
              ),
            ),
            Icon(Icons.battery_charging_full, size: 14, color: Colors.grey[700]),
            const SizedBox(width: 4),
            Text(
              'Battery Saver: Opt',
              style: TextStyle(fontSize: 11, color: Colors.grey[700]),
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Greeting
        const Text(
          'Hello, Rahul 👋',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          'Stay vigilant, connected & informed today',
          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
        ),
        const SizedBox(height: 16),

        // Monitored Zone Card
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MONITORED ZONE',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[500],
                      letterSpacing: 0.8,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.sync, size: 13, color: Colors.black87),
                        SizedBox(width: 4),
                        Text('Sync', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                'Mumbai Suburban, Maharasht...',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Divider(height: 1, color: Colors.grey[200]),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.circle, color: Colors.green, size: 8),
                      SizedBox(width: 6),
                      Text(
                        'Safe • Normal conditions reported',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Text(
                    'Radius: 15 km',
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),

        // Emergency SOS 1-Tap Banner
        GestureDetector(
          onTap: () => onSwitchTab(2),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFD90429),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFD90429).withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.notifications_active, color: Color(0xFFD90429), size: 24),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'EMERGENCY SOS',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              '1-TAP',
                              style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Broadcast distress signal with accurate live GPS to NDRF &...',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
              ],
            ),
          ),
        ),
        const SizedBox(height: 22),

        // Active Critical Alerts Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text(
                  'Active Critical Alerts',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD90429),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    '2 Live',
                    style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => onSwitchTab(1),
              child: const Text(
                'View all >',
                style: TextStyle(color: Color(0xFFD90429), fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Horizontal Critical Alert Cards
        SizedBox(
          height: 255,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildHorizontalAlertCard(
                severity: 'HIGH SEVERITY',
                badgeColor: const Color(0xFFD90429),
                location: 'Ratnagiri Coastal Belt',
                time: '2 hrs ago',
                title: 'Flash Flood Warning & Rising...',
                desc: 'Disaster Management Authority advises immediate evacuation of low-lying...',
                footer: 'Evacuation route open via NH-66',
                imageUrl: 'https://images.unsplash.com/photo-1547683905-f686c993aae5?w=600',
              ),
              const SizedBox(width: 12),
              _buildHorizontalAlertCard(
                severity: 'MEDIUM SEVERITY',
                badgeColor: Colors.orange.shade800,
                location: 'Koyna Seismic Region',
                time: '5 hrs ago',
                title: 'Earthquake Tremor Magnitu...',
                desc: 'Depth 10km recorded by National Seismological Center. No structural damag...',
                footer: 'Aftershock vigilance active',
                imageUrl: 'https://images.unsplash.com/photo-1508739773434-c26b3d09e071?w=600',
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),

        // Quick Actions & Tools
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Quick Actions & Tools',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rapid access',
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // 2x2 Grid
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.15,
          children: [
            _buildQuickActionCard(
              icon: Icons.menu_book_outlined,
              iconColor: Colors.black87,
              iconBg: Colors.grey.shade100,
              title: 'Safety Guides',
              subtitle: '4 Core Categories',
              actionText: 'Read SOPs >',
              actionColor: const Color(0xFFD90429),
              onTap: () => onSwitchTab(3),
            ),
            _buildQuickActionCard(
              icon: Icons.map_outlined,
              iconColor: Colors.black87,
              iconBg: Colors.grey.shade100,
              title: 'Live Crisis Map',
              subtitle: 'Shelters & Hospitals',
              actionText: '14 Nearby >',
              actionColor: Colors.black87,
              onTap: () => onSwitchTab(4),
            ),
            _buildQuickActionCard(
              icon: Icons.phone_in_talk,
              iconColor: const Color(0xFFD90429),
              iconBg: const Color(0xFFFFEBEE),
              title: 'Emergency Call',
              subtitle: '112 Unified Hotline',
              actionText: 'Speed Dial',
              actionIcon: Icons.call,
              actionColor: const Color(0xFFD90429),
              onTap: () => onSwitchTab(2),
            ),
            _buildQuickActionCard(
              icon: Icons.people_outline,
              iconColor: Colors.black87,
              iconBg: Colors.grey.shade100,
              title: 'Family Check-in',
              subtitle: 'Mark Myself Safe',
              actionText: '3/3 Marked',
              actionIcon: Icons.check_circle,
              actionColor: Colors.green,
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Emergency Go-Bag Status
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 44,
                height: 44,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: 0.75,
                      strokeWidth: 4,
                      backgroundColor: Colors.grey.shade200,
                      color: Colors.black87,
                    ),
                    const Center(
                      child: Text('75%', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Emergency Go-Bag St...',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      'Flashlight & Water ration ve...',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => onSwitchTab(3),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                ),
                child: const Text('Complete', style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),

        // Report a Disaster Incident
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.camera_alt, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Report a Disaster Incident',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      'Submit geotagged photo + hazards',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: Text(
            'Live verification speeds municipal relief response by 40%',
            style: TextStyle(fontSize: 11, color: Colors.grey[500]),
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalAlertCard({
    required String severity,
    required Color badgeColor,
    required String location,
    required String time,
    required String title,
    required String desc,
    required String footer,
    required String imageUrl,
  }) {
    return Container(
      width: 270,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Header
          Container(
            height: 115,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              color: Colors.grey[800],
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.35), BlendMode.darken),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.warning_amber_rounded, color: Colors.white, size: 12),
                      const SizedBox(width: 4),
                      Text(
                        severity,
                        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.white, size: 12),
                        const SizedBox(width: 4),
                        Text(location, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Text(time, style: const TextStyle(color: Colors.white70, fontSize: 11)),
                  ],
                ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15), maxLines: 1),
                const SizedBox(height: 4),
                Text(desc, style: TextStyle(color: Colors.grey[600], fontSize: 12), maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.alt_route, size: 14, color: Colors.black87),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(footer, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Details', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String subtitle,
    required String actionText,
    IconData? actionIcon,
    required Color actionColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 2),
                Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 11)),
              ],
            ),
            Row(
              children: [
                Text(
                  actionText,
                  style: TextStyle(color: actionColor, fontWeight: FontWeight.bold, fontSize: 12),
                ),
                if (actionIcon != null) ...[
                  const SizedBox(width: 4),
                  Icon(actionIcon, size: 14, color: actionColor),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}