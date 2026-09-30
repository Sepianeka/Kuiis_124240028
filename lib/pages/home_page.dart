import 'package:flutter/material.dart';
import 'package:animal_atlas/data/pokemon_data.dart';
import 'pokemon_detail_page.dart';
import 'profile_page.dart';
import '../widgets/Pokemon_card.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, this.username = ''});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      _PokemonListPage(username: widget.username),
      ProfilePage(username: widget.username),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF2D6A4F),
        unselectedItemColor: const Color(0xFF64736A),
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.catching_pokemon),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class _PokemonListPage extends StatelessWidget {
  final String username;

  const _PokemonListPage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username.isEmpty ? 'Pokémon List' : 'Halo, $username'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final int crossAxisCount = constraints.maxWidth >= 600 ? 3 : 2;

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: pokemonList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 280,
            ),
            itemBuilder: (context, index) {
              final pokemon = pokemonList[index];
              return PokemonCard(
                pokemon: pokemon,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PokemonDetailPage(pokemon: pokemon),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
