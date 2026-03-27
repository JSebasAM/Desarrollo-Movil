import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomePage Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _appBarTitle = 'Hola, Flutter';

  void _toggleTitle() {
    setState(() {
      _appBarTitle = _appBarTitle == 'Hola, Flutter'
          ? 'Aemeath Resonator'
          : 'Hola, Flutter';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Aemeath Resonator')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  border: Border.all(color: Colors.teal.shade300),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Text(
                  'José Sebastian Arenas Moncada',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ab282586-5fb3-4638-8743-e1e5eef37176/dl9i9yr-fab5e0cd-0e13-4cf3-9fad-d92dd9ec2eef.png/v1/fill/w_1192,h_670/aemeath_render___no_bg____wuthering_waves_by_fortyae_dl9i9yr-pre.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzIwIiwicGF0aCI6Ii9mL2FiMjgyNTg2LTVmYjMtNDYzOC04NzQzLWUxZTVlZWYzNzE3Ni9kbDlpOXlyLWZhYjVlMGNkLTBlMTMtNGNmMy05ZmFkLWQ5MmRkOWVjMmVlZi5wbmciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.Gmkom8CNDeRpEencWVf0lU7iSuFvTLGBuwP11UxJNhU',
                      width: 145,
                      height: 145,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'lib/assets/aemeath.png',
                      width: 145,
                      height: 145,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'lib/assets/aemeath.png',
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.45),
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "I hope to make you proud. \n I hope i haven't let you down.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 180,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.15,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    const images = [
                      'lib/assets/froya.png',
                      'lib/assets/lahai-roi.png',
                      'lib/assets/startorch academy.png',
                      'lib/assets/Bjart.png',
                    ];

                    const labels = [
                      'Froya',
                      'Lahai-roi',
                      'Startorch Academy',
                      'Bjart',
                    ];

                    return _ImageGridCard(
                      imagePath: images[index],
                      label: labels[index],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _toggleTitle,
                child: const Text('Cambiar título del HomePage'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Acción adicional ejecutada'),
                    ),
                  );
                },
                child: const Text('Acción adicional (TextButton)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImageGridCard extends StatelessWidget {
  const _ImageGridCard({required this.imagePath, required this.label});

  final String imagePath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              color: Colors.black.withValues(alpha: 0.48),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
