import 'dart:async';
import 'package:flutter/material.dart';

class SosScreen extends StatefulWidget {
  const SosScreen({super.key});

  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> {
  bool _isBroadcasting = false;
  double _holdProgress = 0.0;
  Timer? _holdTimer;

  void _startHold() {
    if (_isBroadcasting) return;
    _holdTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        _holdProgress += 0.05 / 3.0;
        if (_holdProgress >= 1.0) {
          _holdProgress = 1.0;
          _isBroadcasting = true;
          timer.cancel();
        }
      });
    });
  }

  void _cancelHold() {
    _holdTimer?.cancel();
    if (!_isBroadcasting) {
      setState(() => _holdProgress = 0.0);
    }
  }

  @override
  void dispose() {
    _holdTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        // Dark GPS Telemetry Card
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF14171F),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, color: Colors.greenAccent, size: 8),
                    SizedBox(width: 6),
                    Text(
                      'GPS ACTIVE • PRECISION ±4M',
                      style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Your live telemetry & altitude will instantly stream to the nearest dispatcher upon trigger.',
                style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Interactive SOS Hold Button
        Center(
          child: GestureDetector(
            onTapDown: (_) => _startHold(),
            onTapUp: (_) => _cancelHold(),
            onTapCancel: _cancelHold,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFD90429).withOpacity(0.1),
                  ),
                ),
                SizedBox(
                  width: 152,
                  height: 152,
                  child: CircularProgressIndicator(
                    value: _isBroadcasting ? 1.0 : _holdProgress,
                    strokeWidth: 6,
                    color: const Color(0xFFD90429),
                    backgroundColor: Colors.red.shade100,
                  ),
                ),
                Container(
                  width: 136,
                  height: 136,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFD90429),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 12, offset: Offset(0, 6)),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SOS',
                        style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        'BROADCAST',
                        style: TextStyle(color: Colors.white70, fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.touch_app, size: 16, color: Colors.black54),
            SizedBox(width: 6),
            Text('Press & Hold for 3s', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          'Fires critical audible beacon, dispatches coordinates to NDRF, and alerts designated safety kin.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
        const SizedBox(height: 14),

        // Active Banner
        if (_isBroadcasting)
          GestureDetector(
            onTap: () => setState(() {
              _isBroadcasting = false;
              _holdProgress = 0.0;
            }),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFD90429),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'EMERGENCY BROADCAST ACTIVE!\nAuthorities & Contacts Alerted. (Tap to Cancel)',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ),
        const SizedBox(height: 18),

        // National Alert 112 Card
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFD90429),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'UNIVERSAL CRISIS DISPATCH',
                style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.8),
              ),
              const SizedBox(height: 4),
              const Text(
                'National Alert 112',
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Unified relay: Police • Fire • Trauma Rescue',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Dialing National Emergency 112...')),
                    );
                  },
                  icon: const Icon(Icons.call, color: Color(0xFFD90429), size: 18),
                  label: const Text(
                    'Tap to Dial 112 Directly',
                    style: TextStyle(color: Color(0xFFD90429), fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),

        // Direct Emergency Desks
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Direct Emergency Desks', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('Toll-Free 24/7', style: TextStyle(fontSize: 11, color: Colors.grey[500])),
          ],
        ),
        const SizedBox(height: 12),

        _buildDeskTile(context, Icons.shield_outlined, 'Police Command', 'Dial 100', 'Avg response: ~8 mins locally'),
        _buildDeskTile(context, Icons.medical_services_outlined, 'Ambulance & ICU', 'Dial 102 / 108', 'Paramedic triage active', subtitleRed: true),
        _buildDeskTile(context, Icons.local_fire_department_outlined, 'Fire & Rescue', 'Dial 101', 'Hazard control & evacuation'),
        _buildDeskTile(context, Icons.flood_outlined, 'NDRF Disaster Relief', 'Dial 1078', 'National Disaster Response'),
        _buildDeskTile(context, Icons.family_restroom, 'Women & Child Helpline', 'Dial 1091', 'Immediate protective transit'),
        const SizedBox(height: 16),

        // Emergency Automation Card
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
                  const Text('Emergency Automation', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(8)),
                    child: const Text('Active Ready', style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_on, color: Color(0xFFD90429), size: 18),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Live Location Sharing: ON • Sat-lock accuracy radius is current within ±5m.',
                      style: TextStyle(fontSize: 12, height: 1.4),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.sms_outlined, color: Colors.black54, size: 18),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Automated SMS transmits to 3 primary guardians with live GPS coordinates, campus zone, and battery level (84%).',
                      style: TextStyle(fontSize: 12, height: 1.4),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDeskTile(BuildContext context, IconData icon, String title, String dialText, String subtitle, {bool subtitleRed = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(width: 6),
                    Text(dialText, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: subtitleRed ? const Color(0xFFD90429) : Colors.grey[600],
                    fontWeight: subtitleRed ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Calling $title ($dialText)...')));
            },
            icon: const Icon(Icons.call, size: 14, color: Colors.black87),
            label: const Text('Call', style: TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.bold)),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}