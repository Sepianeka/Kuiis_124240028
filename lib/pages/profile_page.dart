import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const String maleCharacter =
      'https://archives.bulbagarden.net/media/upload/1/1f/Sword_Shield_Victor.png';
  static const String femaleCharacter =
      'https://archives.bulbagarden.net/media/upload/c/cd/Sword_Shield_Gloria.png';

  String _selectedImage = maleCharacter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 132),
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(_selectedImage),
              ),
              const SizedBox(height: 16),
              Text(
                widget.username,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 28),
              const Text(
                'Saya bersumpah\nmengerjakan soal kuis ini dengan cara yang jujur dan tidak curang dengan cara\napapun',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _ProfileCharacterButton(
                    label: 'Male Character',
                    imageUrl: maleCharacter,
                    isSelected: _selectedImage == maleCharacter,
                    onTap: () {
                      setState(() {
                        _selectedImage = maleCharacter;
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  _ProfileCharacterButton(
                    label: 'Female Character',
                    imageUrl: femaleCharacter,
                    isSelected: _selectedImage == femaleCharacter,
                    onTap: () {
                      setState(() {
                        _selectedImage = femaleCharacter;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout'),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileCharacterButton extends StatelessWidget {
  final String label;
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onTap;

  const _ProfileCharacterButton({
    required this.label,
    required this.imageUrl,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 110,
            height: 110,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.grey.shade300,
                width: isSelected ? 3 : 1,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.broken_image, size: 40),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}
