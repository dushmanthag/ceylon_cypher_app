import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class ProfileFeedContent extends StatelessWidget {
  const ProfileFeedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepNavy,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            _buildProfileHeader(),
            const SizedBox(height: 32),
            _buildCypherCoinsPlaceholder(), // The requested special section
            const SizedBox(height: 32),
            _buildProfileMenu(),
            const SizedBox(height: 100), // Bottom padding for mini player
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          child: Text('JD',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 16),
        const Text('Captain JD',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        const Text('Premium Voyager',
            style: TextStyle(color: AppColors.skyBlue, fontSize: 14)),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStat('124', 'Songs'),
            _buildVerticalDivider(),
            _buildStat('84', 'Insights'),
            _buildVerticalDivider(),
            _buildStat('12', 'Playlists'),
          ],
        ),
      ],
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.white10,
      margin: const EdgeInsets.symmetric(horizontal: 24),
    );
  }

  Widget _buildCypherCoinsPlaceholder() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryOrange, AppColors.accentYellow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryOrange.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.monetization_on_rounded,
              color: Colors.white, size: 40),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cypher Coins',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Text('Coming soon to the marketplace.',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(12)),
            child: const Text('0.00',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileMenu() {
    return Column(
      children: [
        _buildMenuTile(Icons.person_outline, 'Personal Information'),
        _buildMenuTile(Icons.notifications_none, 'Notifications'),
        _buildMenuTile(Icons.shield_outlined, 'Privacy & Security'),
        _buildMenuTile(Icons.help_outline, 'Help & Support'),
        _buildMenuTile(Icons.logout, 'Logout', isDestructive: true),
      ],
    );
  }

  Widget _buildMenuTile(IconData icon, String title,
      {bool isDestructive = false}) {
    return ListTile(
      leading:
          Icon(icon, color: isDestructive ? Colors.redAccent : Colors.grey),
      title: Text(title,
          style: TextStyle(
              color: isDestructive ? Colors.redAccent : Colors.white70,
              fontSize: 16)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white10),
      onTap: () {},
    );
  }
}
