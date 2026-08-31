// import 'package:flutter/material.dart';
// import 'emergency_contacts_screen.dart';

// //import 'emergency_contacts_screen.dart';

// class SosScreen extends StatelessWidget {
//   const SosScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F8FA),

//       appBar: AppBar(
//         title: const Text(
//           'Emergency SOS',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.red,
//         foregroundColor: Colors.white,
//       ),

//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),

//         child: Column(
//           children: [
//             // =========================
//             // HEADER
//             // =========================
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),

//               decoration: BoxDecoration(
//                 color: Colors.red.shade50,
//                 borderRadius: BorderRadius.circular(20),
//               ),

//               child: Column(
//                 children: [
//                   Icon(
//                     Icons.warning_rounded,
//                     size: 60,
//                     color: Colors.red.shade700,
//                   ),

//                   const SizedBox(height: 10),

//                   const Text(
//                     'Need Emergency Help?',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   const SizedBox(height: 6),

//                   Text(
//                     'Choose an emergency service below',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.grey.shade700,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 25),

//             // =========================
//             // SOS BUTTON
//             // =========================
//             SizedBox(
//               width: double.infinity,
//               height: 62,

//               child: ElevatedButton.icon(
//                 onPressed: () {
//                   _showMessage(
//                     context,
//                     'Emergency SOS activated!',
//                   );
//                 },

//                 icon: const Icon(
//                   Icons.sos,
//                   size: 30,
//                 ),

//                 label: const Text(
//                   'SEND SOS',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red.shade700,
//                   foregroundColor: Colors.white,

//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 25),

//             // =========================
//             // TITLE
//             // =========================
//             const Align(
//               alignment: Alignment.centerLeft,

//               child: Text(
//                 'Emergency Services',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 12),

//             // =========================
//             // POLICE
//             // =========================
//             _serviceButton(
//               context,
//               Icons.local_police,
//               'Police',
//               'Police emergency assistance',
//               Colors.blue,
//               '112',
//             ),

//             // =========================
//             // AMBULANCE
//             // =========================
//             _serviceButton(
//               context,
//               Icons.medical_services,
//               'Ambulance',
//               'Medical emergency assistance',
//               Colors.red,
//               '108',
//             ),

//             // =========================
//             // FIRE SERVICE
//             // =========================
//             _serviceButton(
//               context,
//               Icons.local_fire_department,
//               'Fire Service',
//               'Fire and rescue assistance',
//               Colors.orange,
//               '101',
//             ),

//             const SizedBox(height: 15),

//             // =========================
//             // SHARE LOCATION
//             // =========================
//             SizedBox(
//               width: double.infinity,

//               child: OutlinedButton.icon(
//                 onPressed: () {
//                   _showMessage(
//                     context,
//                     'Location sharing selected',
//                   );
//                 },

//                 icon: const Icon(
//                   Icons.location_on,
//                 ),

//                 label: const Text(
//                   'Share My Location',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),

//                 style: OutlinedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 16,
//                   ),

//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(14),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),

//             // =========================
//             // EMERGENCY CONTACTS
//             // =========================
//             SizedBox(
//               width: double.infinity,

//               child: OutlinedButton.icon(
//                 onPressed: () {
//                   Navigator.push(
//                     context,

//                     MaterialPageRoute(
//                       builder: (context) =>
//                           const EmergencyContactsScreen(),
//                     ),
//                   );
//                 },

//                 icon: const Icon(
//                   Icons.contacts,
//                 ),

//                 label: const Text(
//                   'Emergency Contacts',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),

//                 style: OutlinedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 16,
//                   ),

//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(14),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   // =====================================================
//   // EMERGENCY SERVICE BUTTON
//   // =====================================================

//   Widget _serviceButton(
//     BuildContext context,
//     IconData icon,
//     String title,
//     String subtitle,
//     Color color,
//     String phoneNumber,
//   ) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),

//       elevation: 2,

//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),

//       child: ListTile(
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 18,
//           vertical: 8,
//         ),

//         leading: CircleAvatar(
//           radius: 26,

//           backgroundColor: color.withValues(
//             alpha: 0.12,
//           ),

//           child: Icon(
//             icon,
//             color: color,
//             size: 28,
//           ),
//         ),

//         title: Text(
//           title,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 17,
//           ),
//         ),

//         subtitle: Text(
//           subtitle,
//         ),

//         trailing: Icon(
//           Icons.call,
//           color: color,
//         ),

//         onTap: () {
//           _makeCall(
//             context,
//             phoneNumber,
//           );
//         },
//       ),
//     );
//   }

//   // =====================================================
//   // CALL FUNCTION
//   // =====================================================

//   // Future<void> _makeCall(
//   //   BuildContext context,
//   //   String number,
//   // ) async {
//   //   final Uri phoneUri = Uri(
//   //     scheme: 'tel',
//   //     path: number,
//   //   );

//   //   final bool canCall = await canLaunchUrl(
//   //     phoneUri,
//   //   );

//   //   if (canCall) {
//   //     await launchUrl(
//   //       phoneUri,
//   //       mode: LaunchMode.externalApplication,
//   //     );
//   //   } else {
//   //     _showMessage(
//   //       context,
//   //       'Unable to open phone dialer',
//   //     );
//   //   }
//   // }

//   // =====================================================
//   // MESSAGE
//   // =====================================================

//   void _showMessage(
//     BuildContext context,
//     String message,
//   ) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'emergency_contacts_screen.dart';

class SosScreen extends StatelessWidget {
  const SosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      appBar: AppBar(
        title: const Text(
          'Emergency SOS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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

              child: Column(
                children: [
                  Icon(
                    Icons.warning_rounded,
                    size: 60,
                    color: Colors.red.shade700,
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Need Emergency Help?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    'Choose an emergency service below',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 62,

              child: ElevatedButton.icon(
                onPressed: () {
                  _showMessage(
                    context,
                    'Emergency SOS activated!',
                  );
                },

                icon: const Icon(
                  Icons.sos,
                  size: 30,
                ),

                label: const Text(
                  'SEND SOS',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade700,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Emergency Services',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            _serviceButton(
              context,
              Icons.local_police,
              'Police',
              'Police emergency assistance',
              Colors.blue,
              '112',
            ),

            _serviceButton(
              context,
              Icons.medical_services,
              'Ambulance',
              'Medical emergency assistance',
              Colors.red,
              '108',
            ),

            _serviceButton(
              context,
              Icons.local_fire_department,
              'Fire Service',
              'Fire and rescue assistance',
              Colors.orange,
              '101',
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

                icon: const Icon(
                  Icons.location_on,
                ),

                label: const Text(
                  'Share My Location',
                ),
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
                      builder: (context) =>
                          const EmergencyContactsScreen(),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.contacts,
                ),

                label: const Text(
                  'Emergency Contacts',
                ),
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
    String number,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),

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

        subtitle: Text(
          '$subtitle\nEmergency Number: $number',
        ),

        trailing: Icon(
          Icons.call,
          color: color,
        ),

        onTap: () {
          _showMessage(
            context,
            '$title selected - $number',
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