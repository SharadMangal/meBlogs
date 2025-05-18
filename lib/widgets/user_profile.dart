class UserProfile {
  static final UserProfile _instance = UserProfile._internal();

  factory UserProfile() {
    return _instance;
  }

  UserProfile._internal();

  // User fields
  String name = "John Doe";
  String email = "john@example.com";
  String bio = "Mobile app developer";

  // Add social links or more if needed
  String instagram = "";
  String linkedin = "";
  String github = "";
  String twitter = "";
}
