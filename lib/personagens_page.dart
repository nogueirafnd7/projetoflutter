import 'package:flutter/material.dart';

// Modelo de dados local para esta página
class Personagem {
  final String name;
  final String description;
  final String imagePath;

  Personagem({
    required this.name,
    required this.description,
    required this.imagePath,
  });
}

class PersonagensPage extends StatelessWidget {
  const PersonagensPage({super.key});

  // Dados dos personagens embutidos nesta página
  List<Personagem> _getPersonagens() {
    return [
      Personagem(
        name: 'Carrie Bradshaw',
        description: 'Escritora de coluna sobre relacionamentos no New York Star. Viciada em sapatos e sempre em busca do amor verdadeiro. Conhecida por suas reflexões filosóficas sobre amor e relacionamentos.',
        imagePath: 'assets/images/carrie.jpg',
      ),
      Personagem(
        name: 'Charlotte York',
        description: 'Galerista de arte tradicional e romântica incurável. Acredita no amor verdadeiro e nos contos de fada. Sempre otimista e em busca do príncipe encantado.',
        imagePath: 'assets/images/charlotte.jpg',
      ),
      Personagem(
        name: 'Miranda Hobbes',
        description: 'Advogada bem-sucedida, cínica e prática. Representa a mulher moderna e independente. Sempre com comentários sarcásticos e realistas sobre relacionamentos.',
        imagePath: 'assets/images/miranda.jpg',
      ),
      Personagem(
        name: 'Samantha Jones',
        description: 'Executiva de relações públicas confiante e sexualmente liberada. Não acredita em relacionamentos sérios e valoriza sua independência acima de tudo.',
        imagePath: 'assets/images/samantha.jpg',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final personagens = _getPersonagens();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        foregroundColor: Colors.pink.shade800,
        title: const Text('Personagens'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: personagens.length,
        itemBuilder: (context, index) {
          final personagem = personagens[index];
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
                  Icons.person,
                  size: 30,
                  color: Colors.pink.shade600,
                ),
              ),
              title: Text(
                personagem.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                personagem.description,
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
                    builder: (context) => PersonagemDetailPage(personagem: personagem),
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

class PersonagemDetailPage extends StatelessWidget {
  final Personagem personagem;

  const PersonagemDetailPage({
    super.key,
    required this.personagem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        foregroundColor: Colors.pink.shade800,
        title: Text(personagem.name),
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
                  Icon(
                    Icons.image,
                    size: 80,
                    color: Colors.pink.shade400,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Imagem: ${personagem.imagePath}',
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
                personagem.name,
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
                personagem.description,
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

