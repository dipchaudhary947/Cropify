import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_profile/model/user_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ViewModel class managing the UserProfile state
class ProfileViewModel extends Notifier<UserProfile?> {
  @override
  UserProfile? build() {
    // Initial state: Fetching/mocking the user profile data
    return UserProfile(
      name: 'Sarah Mitchell',
      email: 'sarah.m@email.com',
      membership: 'Buyer · Gold member',
      totalOrders: 12,
      totalFavorites: 8,
      amountSaved: 340.00,
    );
  }

  // Example business logic method
  void logout() {
    state = null; // Clear state on logout
  }
}

// Global provider declaration
final profileProvider = NotifierProvider<ProfileViewModel, UserProfile?>(() {
  return ProfileViewModel();
});
