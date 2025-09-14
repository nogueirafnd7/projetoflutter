import 'package:flutter/material.dart';

// Modelo de dados local para esta página
class Item {
  final String name;
  final String description;
  final String imagePath;

  Item({
    required this.name,
    required this.description,
    required this.imagePath,
  });
}

class ItensPage extends StatelessWidget {
  const ItensPage({super.key});

  // Dados dos itens embutidos nesta página
  List<Item> _getItens() {
    return [
      Item(
        name: 'Sapatos Manolo Blahnik',
        description: 'Os icônicos sapatos de grife que Carrie adora. Representam luxo, estilo e a paixão de Carrie por moda. Aparecem em diversos episódios como símbolo de sofisticação.',
        imagePath: 'assets/images/manolo.jpg',
      ),
      Item(
        name: 'Laptop de Carrie',
        description: 'O computador onde Carrie escreve sua coluna sobre relacionamentos. É através dele que ela compartilha suas reflexões e experiências com os leitores.',
        imagePath: 'assets/images/laptop.jpg',
      ),
      Item(
        name: 'Cosmopolitan',
        description: 'O drink favorito das meninas, especialmente de Carrie. Símbolo das noitadas e conversas entre amigas nos bares de Manhattan.',
        imagePath: 'assets/images/cosmopolitan.jpg',
      ),
      Item(
        name: 'Anel de Noivado de Charlotte',
        description: 'O anel dos sonhos de Charlotte, representando sua busca pelo amor verdadeiro e pelo casamento perfeito. Símbolo de romance e tradição.',
        imagePath: 'assets/images/ring.jpg',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final itens = _getItens();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        foregroundColor: Colors.pink.shade800,
        title: const Text('Itens'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: itens.length,
        itemBuilder: (context, index) {
          final item = itens[index];
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
                  Icons.shopping_bag,
                  size: 30,
                  color: Colors.pink.shade600,
                ),
              ),
              title: Text(
                item.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                item.description,
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
                    builder: (context) => ItemDetailPage(item: item),
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

class ItemDetailPage extends StatelessWidget {
  final Item item;

  const ItemDetailPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        foregroundColor: Colors.pink.shade800,
        title: Text(item.name),
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
                    'Imagem: ${item.imagePath}',
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
                item.name,
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
                item.description,
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

