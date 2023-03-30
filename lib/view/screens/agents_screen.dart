import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_app/data/model/character_model.dart';

import '../../cubit/characters_cubit.dart';
import '../widgets/agents_list.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({Key? key}) : super(key: key);

  @override
  State<AgentsScreen> createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  List<CharacterModel> characters = [];

  @override
  Widget build(BuildContext context) {
    return AgentsList(data: characters, count: 2);
  }

  @override
  void initState() {
    // context.read<CharactersCubit>().getCharacters();
    final cubiData = context.read<CharactersCubit>();
    if (cubiData.state is CharactersLoadedState) {
      characters = (cubiData.state as CharactersLoadedState).listCharacters;
      // print(characters);
    }
    super.initState();
  }
}
