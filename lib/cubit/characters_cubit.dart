import 'package:bloc/bloc.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../data/model/character_model.dart';
import '../data/repo/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this._charactersRepository)
      : super(const CharactersInitialState());

  final CharactersRepository _charactersRepository;
  Future<void> getCharacter ()async{
    try{
      emit(const CharactersLoadingState());
      final listOfCharactersModel=await requestCharacters();
      emit(CharactersLoadedState(listCharacters: listOfCharactersModel));

    }catch(e){
      emit(CharactersErrorState(message: e.toString()));
    }
  }

  Future<List<CharacterModel>> requestCharacters() async {
    try {
      final response = await _charactersRepository.getListCharacters();
      if (response == null) {
        return [];
      }
      final listOfCharacters = json.decode(response.body);
      final owo = listOfCharacters['data'] as List<dynamic>;
      final list = owo
          .map((dynamic e)
      {
        //Role
        final roles = e['role'] ?? {};
        final roleInfo = RoleModel(
            displayName: roles['displayName'] ?? '',
            description: roles['description'] ?? '',
            displayIcon: roles['displayIcon'] ?? '',
            id: roles['uuid'] ?? '');

        //Abilities
        final abilities = e['abilities'] as List<dynamic>;
        final abilitiesInfo = abilities
            .map((dynamic a) => AbilityModel(
          slot: a['slot'] ?? '',
          displayName: a['displayName'] ?? '',
          description: a['description'] ?? '',
          displayIcon: a['displayIcon'] ?? '',
        ))
            .toList();
        //retainWhere method: Removes all objects from this list that fail to satisfy test.
        abilitiesInfo.retainWhere((x) => x.displayIcon.isNotEmpty);

        //VoiceLine
        final voiceLine = e['voiceLine'] ?? {};
        final voiceMediaList = voiceLine['mediaList'] as List;
        final voiceMedia =
        VoiceLineModel(voiceLine: voiceMediaList[0]['wave']);

        return CharacterModel(
          displayName: e['displayName'] ?? '',
          description: e['description'] ?? '',
          background: e['background'] ?? '',
          fullPortrait: e['fullPortrait'] ?? '',
          role: roleInfo,
          abilitie: abilitiesInfo,
          voiceLine: voiceMedia,
        );
      }
      ).toSet()
          .toList();

      list.retainWhere((x) => x.fullPortrait.isNotEmpty);
      return list;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e.toString());
    }
  }

}