import 'package:flutter/material.dart';

// Modelo de dados local para esta página
class Cidade {
  final String name;
  final String description;
  final String imagePath;

  Cidade({
    required this.name,
    required this.description,
    required this.imagePath,
  });
}

class CidadesPage extends StatelessWidget {
  const CidadesPage({super.key});

  // Dados das cidades embutidos nesta página
  List<Cidade> _getCidades() {
    return [
      Cidade(
        name: 'Manhattan',
        description: 'O coração de Nova York e cenário principal da série. Representa oportunidades, glamour e a vida urbana sofisticada. Cada bairro tem sua personalidade única.',
        imagePath: 'assets/images/manhattan.jpg',
      ),
      Cidade(
        name: 'Brooklyn',
        description: 'Representa uma alternativa mais tranquila e familiar ao ritmo frenético de Manhattan. Miranda se muda para lá em busca de uma vida mais equilibrada.',
        imagePath: 'assets/images/brooklyn.jpg',
      ),
      Cidade(
        name: 'Paris',
        description: 'A cidade do amor onde Carrie vive uma experiência transformadora com Aleksandr Petrovsky. Representa romance, arte e uma nova perspectiva de vida.',
        imagePath: 'assets/images/paris.jpg',
      ),
      Cidade(
        name: 'Los Angeles',
        description: 'A cidade dos sonhos de Hollywood onde as meninas vivem aventuras. Representa uma cultura diferente e novas possibilidades de vida.',
        imagePath: 'assets/images/los_angeles.jpg',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final cidades = _getCidades();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        foregroundColor: Colors.pink.shade800,
        title: const Text('Cidades'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cidades.length,
        itemBuilder: (context, index) {
          final cidade = cidades[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.location_city,
                  size: 30,
                  color: Colors.pink.shade600,
                ),
              ),
              title: Text(
                cidade.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                cidade.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.pink.shade400,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CidadeDetailPage(cidade: cidade),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class CidadeDetailPage extends StatelessWidget {
  final Cidade cidade;

  const CidadeDetailPage({
    super.key,
    required this.cidade,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        foregroundColor: Colors.pink.shade800,
        title: Text(cidade.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Espaço para imagem
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.pink.shade200, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.shade100,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    cidade.imagePath,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Imagem: ${cidade.imagePath}',
                    style: TextStyle(
                      color: Colors.pink.shade600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Nome do elemento
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade50, Colors.pink.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.pink.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.shade100,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                cidade.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink.shade800,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            
            // Descrição do elemento
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.pink.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.shade100,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                cidade.description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.pink.shade700,
                  height: 1.6,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 32),
            
            // Botão de voltar estilizado
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.pink.shade400,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Voltar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

