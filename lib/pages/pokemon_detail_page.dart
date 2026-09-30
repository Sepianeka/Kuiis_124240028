import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../core/theme/app_colors.dart';
import '../core/utils/format.dart';
import '../widgets/Pokemon_image.dart';
import '../widgets/type_tag.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            leading: CircleAvatar(
              backgroundColor: Colors.black.withAlpha((255 * 0.4).round()),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'pokemon-${pokemon.name}',
                child: PokemonImage(
                  imageUrl: pokemon.image,
                  height: 320,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              pokemon.name,
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
                      pokemon.name,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'ID: #${pokemon.id}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: pokemon.types.map((type) => TypeTag(type: type)).toList(),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        _StatTile(
                          icon: Icons.height,
                          label: 'Tinggi',
                          value: FormatUtils.formatNumber(pokemon.height.toDouble(), 'cm'),
                        ),
                        const SizedBox(width: 12),
                        _StatTile(
                          icon: Icons.scale,
                          label: 'Berat',
                          value: FormatUtils.formatNumber(pokemon.weight.toDouble(), 'kg'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Kemampuan',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withAlpha((255 * 0.1).round()),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.accent.withAlpha((255 * 0.3).round())),
                      ),
                      child: Text(
                        pokemon.ability,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Jenis',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: pokemon.types
                          .map((type) => TypeTag(type: type))
                          .toList(),
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
                        child: const Text('Kembali ke Home'),
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
