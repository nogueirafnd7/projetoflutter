import 'package:flutter/material.dart';

// Modelo de dados local para esta página
class Missao {
  final String name;
  final String description;
  final String imagePath;

  Missao({
    required this.name,
    required this.description,
    required this.imagePath,
  });
}

class MissoesPage extends StatelessWidget {
  const MissoesPage({super.key});

  // Dados das missões embutidos nesta página
  List<Missao> _getMissoes() {
    return [
      Missao(
        name: 'Encontrar o Amor Verdadeiro',
        description: 'A eterna busca de Carrie pelo homem perfeito. Através de diversos relacionamentos, ela aprende sobre si mesma e sobre o que realmente quer em um parceiro.',
        imagePath: 'assets/images/love.jpg',
      ),
      Missao(
        name: 'Equilibrar Carreira e Vida Pessoal',
        description: 'Miranda enfrenta o desafio de ser uma advogada bem-sucedida enquanto tenta manter relacionamentos e, posteriormente, ser mãe.',
        imagePath: 'assets/images/career.jpg',
      ),
      Missao(
        name: 'Superar o Medo do Compromisso',
        description: 'Samantha aprende a lidar com sentimentos mais profundos e a possibilidade de um relacionamento sério, especialmente com Smith.',
        imagePath: 'assets/images/commitment.jpg',
      ),
      Missao(
        name: 'Aceitar as Imperfeições da Vida',
        description: 'Charlotte descobre que a vida real nem sempre é como nos contos de fada e aprende a aceitar as imperfeições em busca da felicidade.',
        imagePath: 'assets/images/acceptance.jpg',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final missoes = _getMissoes();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        foregroundColor: Colors.pink.shade800,
        title: const Text('Missões'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: missoes.length,
        itemBuilder: (context, index) {
          final missao = missoes[index];
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
                  Icons.assignment,
                  size: 30,
                  color: Colors.pink.shade600,
                ),
              ),
              title: Text(
                missao.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                missao.description,
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
                    builder: (context) => MissaoDetailPage(missao: missao),
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

class MissaoDetailPage extends StatelessWidget {
  final Missao missao;

  const MissaoDetailPage({
    super.key,
    required this.missao,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        foregroundColor: Colors.pink.shade800,
        title: Text(missao.name),
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
                    missao.imagePath,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Imagem: ${missao.imagePath}',
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
                missao.name,
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
                missao.description,
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

