import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  final VoidCallback onTapQuickSos;

  const MapScreen({super.key, required this.onTapQuickSos});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String _selectedFilter = 'Hospitals (5 nearby)';
  final List<String> _filters = [
    'All Facilities',
    'Hospitals (5 nearby)',
    'Police (3)',
    'Shelters (2)',
    'Hazard (1)',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Simulated Vector Crisis Map Canvas
        Container(
          color: const Color(0xFFECEEF1),
          child: CustomPaint(
            size: Size.infinite,
            painter: _CrisisMapPainter(),
          ),
        ),

        // Map Pins & Labels
        Positioned(
          top: 175,
          left: 110,
          child: _buildMapLabel('Central Police • 800m', Colors.white, Colors.black87),
        ),
        Positioned(
          top: 215,
          right: 65,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFD90429),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 6)],
                ),
                child: const Text(
                  'Lilavati Trauma •\n1.2 km',
                  style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 6),
              const CircleAvatar(
                radius: 16,
                backgroundColor: Color(0xFFD90429),
                child: Icon(Icons.local_hospital, color: Colors.white, size: 18),
              ),
            ],
          ),
        ),
        Positioned(
          top: 315,
          left: 105,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFD90429),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Flooded Underpass Avoided',
              style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
          top: 355,
          right: 65,
          child: _buildMapLabel('Govt Relief Camp • 2.4 km', Colors.white, Colors.orange.shade800),
        ),
        Positioned(
          top: 410,
          left: 65,
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.25),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: CircleAvatar(radius: 6, backgroundColor: Colors.blue),
                ),
              ),
              const SizedBox(width: 6),
              _buildMapLabel('You are here (Marine Lines)', Colors.white, Colors.black87),
            ],
          ),
        ),

        // Top Search & Filter Overlay
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.black54, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Search shelters, hospitals, routes...',
                          style: TextStyle(color: Colors.grey[500], fontSize: 13),
                        ),
                      ),
                      const Icon(Icons.mic, color: Colors.black54, size: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Filter Chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _filters.map((f) {
                      final isSelected = _selectedFilter == f;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedFilter = f),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.black87 : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                            ),
                            child: Text(
                              f,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black87,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 12),

                // Quick SOS Pill
                GestureDetector(
                  onTap: widget.onTapQuickSos,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD90429),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 6)],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.emergency_share, color: Colors.white, size: 16),
                        SizedBox(width: 6),
                        Text('QUICK SOS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Bottom Hospital Detail Sheet
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 14, offset: Offset(0, -4))],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      'PRIMARY TRAUMA CARE',
                      style: TextStyle(color: Color(0xFFD90429), fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 6),
                    Text('• 24/7 Verified', style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Lilavati Trauma & Emergency ...',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  '1.2 km away  •  4 min drive via Marine Flyover  •  Open 24/7',
                  style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                ),
                const SizedBox(height: 12),

                // Beds & Oxygen Info Boxes
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Available Beds', style: TextStyle(fontSize: 10, color: Colors.grey)),
                            SizedBox(height: 2),
                            Text('18 Emergency', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Critical Supplies', style: TextStyle(fontSize: 10, color: Colors.grey)),
                            SizedBox(height: 2),
                            Text('Oxygen Ready', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Call & Navigate Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.call, size: 16, color: Colors.black87),
                        label: const Text('Call Hospital', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 12)),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.navigation, size: 16),
                        label: const Text('Navigate (Maps)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF14171F),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMapLabel(String text, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Text(text, style: TextStyle(color: fg, fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }
}

class _CrisisMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw subtle road grid lines
    final roadPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6;
    canvas.drawLine(Offset(0, size.height * 0.35), Offset(size.width, size.height * 0.42), roadPaint);
    canvas.drawLine(Offset(size.width * 0.25, 0), Offset(size.width * 0.65, size.height), roadPaint);

    // Draw Flood Hazard Polygon
    final hazardFill = Paint()..color = const Color(0xFFD90429).withOpacity(0.18);
    final hazardBorder = Paint()
      ..color = const Color(0xFFD90429)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path()
      ..moveTo(size.width * 0.32, size.height * 0.36)
      ..lineTo(size.width * 0.68, size.height * 0.34)
      ..lineTo(size.width * 0.72, size.height * 0.46)
      ..lineTo(size.width * 0.26, size.height * 0.48)
      ..close();

    canvas.drawPath(path, hazardFill);
    canvas.drawPath(path, hazardBorder);

    // Draw Safe Route Line from User to Hospital
    final routePaint = Paint()
      ..color = Colors.black87
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final routePath = Path()
      ..moveTo(size.width * 0.22, size.height * 0.52)
      ..quadraticBezierTo(size.width * 0.24, size.height * 0.35, size.width * 0.62, size.height * 0.30);

    canvas.drawPath(routePath, routePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}