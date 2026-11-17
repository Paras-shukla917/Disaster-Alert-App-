class DisasterAlertItem {
  final String title;
  final String location;
  final String time;
  final String category; // Flood, Earthquake, Cyclone, Fire
  final String severity; // Critical, High, Medium, Low
  final String badgeText;
  final String description;
  final String buttonText;
  final String imageUrl;

  DisasterAlertItem({
    required this.title,
    required this.location,
    required this.time,
    required this.category,
    required this.severity,
    required this.badgeText,
    required this.description,
    required this.buttonText,
    required this.imageUrl,
  });
}

final List<DisasterAlertItem> sampleAlerts = [
  DisasterAlertItem(
    title: 'Cyclone Mocha Storm Alert',
    location: 'Coastal Odisha & Bengal',
    time: 'Today, 10:45 AM',
    category: 'Cyclone',
    severity: 'Critical',
    badgeText: '110 km/h Peak Gusts',
    description:
        'Wind speeds up to 110 km/h expected along the coastal belt. Fishermen are strictly advised not to venture into deep sea waters. Port caution flag 4 hoisted.',
    buttonText: 'View Details & Precautions',
    imageUrl: 'https://images.unsplash.com/photo-1527482797697-8795b05a13fe?w=800',
  ),
  DisasterAlertItem(
    title: 'Flash Flood Watch in Low-Lying Basins',
    location: 'Godavari Basin, Nashik',
    time: 'Today, 07:15 AM',
    category: 'Flood',
    severity: 'High',
    badgeText: '+1.8m above danger mark',
    description:
        'Water levels rising rapidly near the old bridge district. Local emergency evacuation teams are placed on standby. Residents in sector 4 alerted to shift valuables.',
    buttonText: 'View Details',
    imageUrl: 'https://images.unsplash.com/photo-1547683905-f686c993aae5?w=800',
  ),
  DisasterAlertItem(
    title: 'Industrial Warehouse Fire Outbreak',
    location: 'MIDC Phase II, Pune',
    time: 'Yesterday, 08:30 PM',
    category: 'Fire',
    severity: 'Medium',
    badgeText: '6 Fire Tenders on Site',
    description:
        'Fire tenders deployed and primary containment achieved. Surrounding area cordoned off within a 500m radius. Avoid logistics route 7.',
    buttonText: 'View Details',
    imageUrl: 'https://images.unsplash.com/photo-1517582082532-16a092d47074?w=800',
  ),
  DisasterAlertItem(
    title: 'Minor Seismic Activity M3.2',
    location: 'Chamoli, Uttarakhand',
    time: 'Yesterday, 02:10 PM',
    category: 'Earthquake',
    severity: 'Low',
    badgeText: 'Magnitude 3.2 Richter • Depth: 10 km',
    description:
        'Depth recorded at 10km. National Center for Seismology confirms no structural damage or civilian injury reported.',
    buttonText: 'View Details',
    imageUrl: '',
  ),
];