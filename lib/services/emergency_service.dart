class EmergencyService {
  // Emergency numbers
  static const String policeNumber = '112';
  static const String ambulanceNumber = '108';
  static const String fireServiceNumber = '101';

  // Get police number
  static String getPoliceNumber() {
    return policeNumber;
  }

  // Get ambulance number
  static String getAmbulanceNumber() {
    return ambulanceNumber;
  }

  // Get fire service number
  static String getFireServiceNumber() {
    return fireServiceNumber;
  }

  // Emergency SOS message
  static String sosMessage() {
    return 'Emergency SOS activated!';
  }

  // Location sharing message
  static String locationMessage() {
    return 'Location sharing selected';
  }
}