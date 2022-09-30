import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modelview/controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(context) {

    // Instancie sua classe usando Get.put() para torná-la disponível para todas as rotas subsequentes
    final Controller c = Get.put(Controller());

    return Scaffold(
      // Use Obx(()=> para atualizar Text() sempre que a contagem é alterada.
        appBar: AppBar(title: Obx(() => Text("Total de cliques: ${c.count}"))),

        // Troque o Navigator.push de 8 linhas por um simples Get.to(). Você não precisa do 'context'
        body: Center(child: ElevatedButton(
            child: Text("Ir pra Outra tela"), onPressed: () => Get.to(Outra()))),
        floatingActionButton:
        FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Outra extends StatelessWidget {
  // Você pode pedir o Get para encontrar o controller que foi usado em outra página e redirecionar você pra ele.
  final Controller c = Get.find();
  @override
  Widget build(context) => Scaffold(appBar: AppBar(title: Obx(() => Text("Números de cliques: ${c.count}"),)), body: Center(child: Column(
    children: [
      Obx(() => Text("${c.count}")),
      ElevatedButton(child: Icon(Icons.add), onPressed: c.increment)
    ],
  )));
}