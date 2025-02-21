
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/character.dart';
import 'package:rick_and_morty_app/services/rm_api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<List<Character>> _futureCharacters;
  final RmApiService _rmApiService = RmApiService();

  @override
  void initState(){
    super.initState();
    _futureCharacters = _rmApiService.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick and Morty"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _futureCharacters, 
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){ // Se o estado for de espera
            return const Center(child: CircularProgressIndicator()); // coloca uma barra de carregamento

          }else if(snapshot.hasError){
            return Center(child: Text("Erro: ${snapshot.error}")); // mensagem de erro

          } else if(snapshot.hasData){
            final characters = snapshot.data!; // se tiver dados retorna os dados da lista de personagens

            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index){
                final character = characters[index];
                return Placeholder();
              }
            );
          } else{
            const Center(child: Text("Nenhum dado disponível"));
          }
        }
      )
    );
  }
}