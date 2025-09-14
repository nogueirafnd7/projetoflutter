import 'package:flutter/material.dart';
import 'personagens_page.dart';
import 'itens_page.dart';
import 'missoes_page.dart';
import 'cidades_page.dart';

void main() {
  runApp(const SexAndTheCityApp());
}

class SexAndTheCityApp extends StatelessWidget {
  const SexAndTheCityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sex and the City App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink.shade100,
          foregroundColor: Colors.pink.shade800,
          elevation: 2,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sex and the City App'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.pink.shade50,
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          // ✅ permite rolagem
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo/Título principal
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.shade100,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/heart.png", // substitui o ícone
                        height: 48,
                        color: Colors.pink.shade400,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Sex and the City',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Explore o mundo das quatro amigas',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.pink.shade600,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Botões do menu
                _buildMenuButton(
                  context,
                  'Personagens',
                  "assets/personagens.png",
                  'Conheça Carrie, Charlotte, Miranda e Samantha',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PersonagensPage()),
                  ),
                ),
                const SizedBox(height: 16),
                _buildMenuButton(
                  context,
                  'Itens',
                  "assets/itens.png",
                  'Sapatos, drinks e objetos icônicos',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ItensPage()),
                  ),
                ),
                const SizedBox(height: 16),
                _buildMenuButton(
                  context,
                  'Missões',
                  "assets/missoes.png",
                  'As jornadas e desafios das personagens',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MissoesPage()),
                  ),
                ),
                const SizedBox(height: 16),
                _buildMenuButton(
                  context,
                  'Cidades',
                  "assets/cidades.png",
                  'Os cenários que marcaram a série',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CidadesPage()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context,
    String title,
    String imagePath, // agora recebe imagem
    String subtitle,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [Colors.pink.shade100, Colors.pink.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.pink.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  imagePath,
                  height: 28,
                  color: Colors.pink.shade800,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink.shade800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.pink.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.pink.shade600,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
