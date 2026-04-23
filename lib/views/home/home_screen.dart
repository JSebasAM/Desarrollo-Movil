import 'package:flutter/material.dart';
import '../../widgets/custom_drawer.dart';

class HomeCardItem {
  const HomeCardItem({
    required this.title,
    required this.description,
    this.buttonLabel = 'Explorar',
  });

  final String title;
  final String description;
  final String buttonLabel;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.cards = _defaultCards});

  final List<HomeCardItem> cards;

  static const List<HomeCardItem> _defaultCards = [
    HomeCardItem(
      title: 'Informacion General de Colombia',
      description:
          'Conoce capital, area, poblacion, idiomas y datos principales del pais.',
      buttonLabel: 'Ver pais',
    ),
    HomeCardItem(
      title: 'Regiones y Departamentos',
      description:
          'Explora la diversidad geografica de Colombia por region y departamento.',
      buttonLabel: 'Ver regiones',
    ),
    HomeCardItem(
      title: 'Cultura y Tradiciones',
      description:
          'Descubre costumbres, expresiones y elementos culturales representativos.',
      buttonLabel: 'Ver cultura',
    ),
    HomeCardItem(
      title: 'Turismo y Naturaleza',
      description:
          'Consulta lugares iconicos y riqueza natural para planear tus rutas.',
      buttonLabel: 'Ver destinos',
    ),
  ];

  void _onCardTap(BuildContext context, HomeCardItem item) {
    // TODO: Agregar navegacion o accion especifica para cada card.
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F3),
      appBar: AppBar(title: const Text('Explore Colombia')),
      drawer: const CustomDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: _HeaderSection(theme: theme),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = cards[index];

                  return _HomeFeatureCard(
                    item: item,
                    onTap: () => _onCardTap(context, item),
                  );
                },
                childCount: cards.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                mainAxisExtent: 250,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8EA),
        borderRadius: BorderRadius.circular(28),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Stack(
        children: [
          Positioned(
            left: 4,
            top: 36,
            child: Icon(
              Icons.change_history,
              size: 38,
              color: const Color(0xFF8F8F96).withValues(alpha: 0.55),
            ),
          ),
          Positioned(
            right: 8,
            top: 48,
            child: Transform.rotate(
              angle: 0.35,
              child: Icon(
                Icons.change_history,
                size: 44,
                color: const Color(0xFF8F8F96).withValues(alpha: 0.55),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF4A4A4F),
                      height: 1.15,
                      letterSpacing: 0.2,
                    ),
                    children: const [
                      TextSpan(text: 'Explore '),
                      TextSpan(
                        text: 'Col',
                        style: TextStyle(color: Color(0xFFFFC107)),
                      ),
                      TextSpan(
                        text: 'om',
                        style: TextStyle(color: Color(0xFF0A47A1)),
                      ),
                      TextSpan(
                        text: 'bia',
                        style: TextStyle(color: Color(0xFFC8102E)),
                      ),
                      TextSpan(text: '\nwith API-Colombia'),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Un proyecto open source para consultar datos sobre la diversidad de Colombia.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: const Color(0xFF4F4F53),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeFeatureCard extends StatelessWidget {
  const _HomeFeatureCard({required this.item, required this.onTap});

  final HomeCardItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF0EAAF),
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 14,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              padding: const EdgeInsets.fromLTRB(14, 16, 14, 56),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.diamond_outlined,
                    color: Color(0xFFC8102E),
                    size: 18,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF0B0B0D),
                      height: 1.25,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF232326),
                      height: 1.3,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 18,
              right: 18,
              bottom: 12,
              child: SizedBox(
                height: 42,
                child: ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    backgroundColor: const Color(0xFFFFC107),
                    foregroundColor: const Color(0xFF101010),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: Text(
                    item.buttonLabel,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
