import 'package:flutter/material.dart';
import '../models/animal.dart';
import '../core/theme/app_colors.dart';
import '../core/utils/format.dart';
import '../widgets/animal_image.dart';
import '../widgets/type_tag.dart';
import '../widgets/info_chip.dart';

class AnimalDetailPage extends StatelessWidget {
  final Animal animal;

  const AnimalDetailPage({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            leading: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.4),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'animal-${animal.name}',
                child: AnimalImage(
                  imageUrl: animal.image,
                  height: 320,
                  fit: BoxFit.cover,
                ),
              ),
            ),
    	    title: Text(
              animal.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -24),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      animal.name,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 8),
                    TypeTag(type: animal.type),
                    const SizedBox(height: 24),
                    // Statistik Row
                    Row(
                      children: [
                        _StatTile(
                          icon: Icons.height,
                          label: 'Tinggi',
                          value: FormatUtils.formatNumber(animal.height.toDouble(), 'cm'),
                        ),
                        const SizedBox(width: 12),
                        _StatTile(
                          icon: Icons.scale,
                          label: 'Berat',
                          value: FormatUtils.formatNumber(animal.weight, 'kg'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Description Section
                    Text(
                      'Deskripsi',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      animal.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        height: 1.5,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Fun Fact Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.accent.withOpacity(0.3)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.lightbulb, color: AppColors.accent),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Fakta Menarik',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.accent,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  animal.funFact,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Habitat Section
                    Text(
                      'Habitat',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: animal.habitat.map((h) => InfoChip(
                        label: h,
                        icon: Icons.terrain,
                      )).toList(),
                    ),
                    const SizedBox(height: 24),
                    // Aktivitas Section
                    Text(
                      'Aktivitas',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: animal.activities.map((a) => InfoChip(
                        label: a,
                        isFilled: true,
                      )).toList(),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: FilledButton(
                        onPressed: () => Navigator.pop(context),
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text('Kembali ke daftar hewan'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.mist,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.accent, size: 20),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 20,
              ),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
