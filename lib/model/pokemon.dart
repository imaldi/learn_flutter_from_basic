// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromJson(jsonString);

import 'dart:convert';

PokemonModel pokemonModelFromJson(String str) =>
    PokemonModel.fromJson(json.decode(str));

String pokemonModelToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel {
  PokemonModel({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  List<Ability>? abilities;
  int? baseExperience;
  List<Species>? forms;
  List<GameIndex>? gameIndices;
  int? height;
  List<HeldItem>? heldItems;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<Move>? moves;
  String? name;
  int? order;
  List<dynamic>? pastTypes;
  Species? species;
  Sprites? sprites;
  List<Stat>? stats;
  List<Type>? types;
  int? weight;

  PokemonModel copyWith({
    List<Ability>? abilities,
    int? baseExperience,
    List<Species>? forms,
    List<GameIndex>? gameIndices,
    int? height,
    List<HeldItem>? heldItems,
    int? id,
    bool? isDefault,
    String? locationAreaEncounters,
    List<Move>? moves,
    String? name,
    int? order,
    List<dynamic>? pastTypes,
    Species? species,
    Sprites? sprites,
    List<Stat>? stats,
    List<Type>? types,
    int? weight,
  }) =>
      PokemonModel(
        abilities: abilities ?? this.abilities,
        baseExperience: baseExperience ?? this.baseExperience,
        forms: forms ?? this.forms,
        gameIndices: gameIndices ?? this.gameIndices,
        height: height ?? this.height,
        heldItems: heldItems ?? this.heldItems,
        id: id ?? this.id,
        isDefault: isDefault ?? this.isDefault,
        locationAreaEncounters:
            locationAreaEncounters ?? this.locationAreaEncounters,
        moves: moves ?? this.moves,
        name: name ?? this.name,
        order: order ?? this.order,
        pastTypes: pastTypes ?? this.pastTypes,
        species: species ?? this.species,
        sprites: sprites ?? this.sprites,
        stats: stats ?? this.stats,
        types: types ?? this.types,
        weight: weight ?? this.weight,
      );

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        abilities: json["abilities"] == null
            ? []
            : List<Ability>.from(
                json["abilities"]!.map((x) => Ability.fromJson(x))),
        baseExperience: json["base_experience"],
        forms: json["forms"] == null
            ? []
            : List<Species>.from(
                json["forms"]!.map((x) => Species.fromJson(x))),
        gameIndices: json["game_indices"] == null
            ? []
            : List<GameIndex>.from(
                json["game_indices"]!.map((x) => GameIndex.fromJson(x))),
        height: json["height"],
        heldItems: json["held_items"] == null
            ? []
            : List<HeldItem>.from(
                json["held_items"]!.map((x) => HeldItem.fromJson(x))),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: json["moves"] == null
            ? []
            : List<Move>.from(json["moves"]!.map((x) => Move.fromJson(x))),
        name: json["name"],
        order: json["order"],
        pastTypes: json["past_types"] == null
            ? []
            : List<dynamic>.from(json["past_types"]!.map((x) => x)),
        species:
            json["species"] == null ? null : Species.fromJson(json["species"]),
        sprites:
            json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]),
        stats: json["stats"] == null
            ? []
            : List<Stat>.from(json["stats"]!.map((x) => Stat.fromJson(x))),
        types: json["types"] == null
            ? []
            : List<Type>.from(json["types"]!.map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": abilities == null
            ? []
            : List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "forms": forms == null
            ? []
            : List<dynamic>.from(forms!.map((x) => x.toJson())),
        "game_indices": gameIndices == null
            ? []
            : List<dynamic>.from(gameIndices!.map((x) => x.toJson())),
        "height": height,
        "held_items": heldItems == null
            ? []
            : List<dynamic>.from(heldItems!.map((x) => x.toJson())),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": moves == null
            ? []
            : List<dynamic>.from(moves!.map((x) => x.toJson())),
        "name": name,
        "order": order,
        "past_types": pastTypes == null
            ? []
            : List<dynamic>.from(pastTypes!.map((x) => x)),
        "species": species?.toJson(),
        "sprites": sprites?.toJson(),
        "stats": stats == null
            ? []
            : List<dynamic>.from(stats!.map((x) => x.toJson())),
        "types": types == null
            ? []
            : List<dynamic>.from(types!.map((x) => x.toJson())),
        "weight": weight,
      };
}

class Ability {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  Species? ability;
  bool? isHidden;
  int? slot;

  Ability copyWith({
    Species? ability,
    bool? isHidden,
    int? slot,
  }) =>
      Ability(
        ability: ability ?? this.ability,
        isHidden: isHidden ?? this.isHidden,
        slot: slot ?? this.slot,
      );

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability:
            json["ability"] == null ? null : Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability?.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Species {
  Species({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  Species copyWith({
    String? name,
    String? url,
  }) =>
      Species(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class GameIndex {
  GameIndex({
    this.gameIndex,
    this.version,
  });

  int? gameIndex;
  Species? version;

  GameIndex copyWith({
    int? gameIndex,
    Species? version,
  }) =>
      GameIndex(
        gameIndex: gameIndex ?? this.gameIndex,
        version: version ?? this.version,
      );

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version:
            json["version"] == null ? null : Species.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "game_index": gameIndex,
        "version": version?.toJson(),
      };
}

class HeldItem {
  HeldItem({
    this.item,
    this.versionDetails,
  });

  Species? item;
  List<VersionDetail>? versionDetails;

  HeldItem copyWith({
    Species? item,
    List<VersionDetail>? versionDetails,
  }) =>
      HeldItem(
        item: item ?? this.item,
        versionDetails: versionDetails ?? this.versionDetails,
      );

  factory HeldItem.fromJson(Map<String, dynamic> json) => HeldItem(
        item: json["item"] == null ? null : Species.fromJson(json["item"]),
        versionDetails: json["version_details"] == null
            ? []
            : List<VersionDetail>.from(
                json["version_details"]!.map((x) => VersionDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "item": item?.toJson(),
        "version_details": versionDetails == null
            ? []
            : List<dynamic>.from(versionDetails!.map((x) => x.toJson())),
      };
}

class VersionDetail {
  VersionDetail({
    this.rarity,
    this.version,
  });

  int? rarity;
  Species? version;

  VersionDetail copyWith({
    int? rarity,
    Species? version,
  }) =>
      VersionDetail(
        rarity: rarity ?? this.rarity,
        version: version ?? this.version,
      );

  factory VersionDetail.fromJson(Map<String, dynamic> json) => VersionDetail(
        rarity: json["rarity"],
        version:
            json["version"] == null ? null : Species.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "rarity": rarity,
        "version": version?.toJson(),
      };
}

class Move {
  Move({
    this.move,
    this.versionGroupDetails,
  });

  Species? move;
  List<VersionGroupDetail>? versionGroupDetails;

  Move copyWith({
    Species? move,
    List<VersionGroupDetail>? versionGroupDetails,
  }) =>
      Move(
        move: move ?? this.move,
        versionGroupDetails: versionGroupDetails ?? this.versionGroupDetails,
      );

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: json["move"] == null ? null : Species.fromJson(json["move"]),
        versionGroupDetails: json["version_group_details"] == null
            ? []
            : List<VersionGroupDetail>.from(json["version_group_details"]!
                .map((x) => VersionGroupDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "move": move?.toJson(),
        "version_group_details": versionGroupDetails == null
            ? []
            : List<dynamic>.from(versionGroupDetails!.map((x) => x.toJson())),
      };
}

class VersionGroupDetail {
  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  int? levelLearnedAt;
  Species? moveLearnMethod;
  Species? versionGroup;

  VersionGroupDetail copyWith({
    int? levelLearnedAt,
    Species? moveLearnMethod,
    Species? versionGroup,
  }) =>
      VersionGroupDetail(
        levelLearnedAt: levelLearnedAt ?? this.levelLearnedAt,
        moveLearnMethod: moveLearnMethod ?? this.moveLearnMethod,
        versionGroup: versionGroup ?? this.versionGroup,
      );

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: json["move_learn_method"] == null
            ? null
            : Species.fromJson(json["move_learn_method"]),
        versionGroup: json["version_group"] == null
            ? null
            : Species.fromJson(json["version_group"]),
      );

  Map<String, dynamic> toJson() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod?.toJson(),
        "version_group": versionGroup?.toJson(),
      };
}

class GenerationV {
  GenerationV({
    this.blackWhite,
  });

  Sprites? blackWhite;

  GenerationV copyWith({
    Sprites? blackWhite,
  }) =>
      GenerationV(
        blackWhite: blackWhite ?? this.blackWhite,
      );

  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        blackWhite: json["black-white"] == null
            ? null
            : Sprites.fromJson(json["black-white"]),
      );

  Map<String, dynamic> toJson() => {
        "black-white": blackWhite?.toJson(),
      };
}

class GenerationIv {
  GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  Sprites? diamondPearl;
  Sprites? heartgoldSoulsilver;
  Sprites? platinum;

  GenerationIv copyWith({
    Sprites? diamondPearl,
    Sprites? heartgoldSoulsilver,
    Sprites? platinum,
  }) =>
      GenerationIv(
        diamondPearl: diamondPearl ?? this.diamondPearl,
        heartgoldSoulsilver: heartgoldSoulsilver ?? this.heartgoldSoulsilver,
        platinum: platinum ?? this.platinum,
      );

  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: json["diamond-pearl"] == null
            ? null
            : Sprites.fromJson(json["diamond-pearl"]),
        heartgoldSoulsilver: json["heartgold-soulsilver"] == null
            ? null
            : Sprites.fromJson(json["heartgold-soulsilver"]),
        platinum: json["platinum"] == null
            ? null
            : Sprites.fromJson(json["platinum"]),
      );

  Map<String, dynamic> toJson() => {
        "diamond-pearl": diamondPearl?.toJson(),
        "heartgold-soulsilver": heartgoldSoulsilver?.toJson(),
        "platinum": platinum?.toJson(),
      };
}

class Versions {
  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  GenerationI? generationI;
  GenerationIi? generationIi;
  GenerationIii? generationIii;
  GenerationIv? generationIv;
  GenerationV? generationV;
  Map<String, Home>? generationVi;
  GenerationVii? generationVii;
  GenerationViii? generationViii;

  Versions copyWith({
    GenerationI? generationI,
    GenerationIi? generationIi,
    GenerationIii? generationIii,
    GenerationIv? generationIv,
    GenerationV? generationV,
    Map<String, Home>? generationVi,
    GenerationVii? generationVii,
    GenerationViii? generationViii,
  }) =>
      Versions(
        generationI: generationI ?? this.generationI,
        generationIi: generationIi ?? this.generationIi,
        generationIii: generationIii ?? this.generationIii,
        generationIv: generationIv ?? this.generationIv,
        generationV: generationV ?? this.generationV,
        generationVi: generationVi ?? this.generationVi,
        generationVii: generationVii ?? this.generationVii,
        generationViii: generationViii ?? this.generationViii,
      );

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        generationI: json["generation-i"] == null
            ? null
            : GenerationI.fromJson(json["generation-i"]),
        generationIi: json["generation-ii"] == null
            ? null
            : GenerationIi.fromJson(json["generation-ii"]),
        generationIii: json["generation-iii"] == null
            ? null
            : GenerationIii.fromJson(json["generation-iii"]),
        generationIv: json["generation-iv"] == null
            ? null
            : GenerationIv.fromJson(json["generation-iv"]),
        generationV: json["generation-v"] == null
            ? null
            : GenerationV.fromJson(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"]!)
            .map((k, v) => MapEntry<String, Home>(k, Home.fromJson(v))),
        generationVii: json["generation-vii"] == null
            ? null
            : GenerationVii.fromJson(json["generation-vii"]),
        generationViii: json["generation-viii"] == null
            ? null
            : GenerationViii.fromJson(json["generation-viii"]),
      );

  Map<String, dynamic> toJson() => {
        "generation-i": generationI?.toJson(),
        "generation-ii": generationIi?.toJson(),
        "generation-iii": generationIii?.toJson(),
        "generation-iv": generationIv?.toJson(),
        "generation-v": generationV?.toJson(),
        "generation-vi": Map.from(generationVi!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "generation-vii": generationVii?.toJson(),
        "generation-viii": generationViii?.toJson(),
      };
}

class Sprites {
  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
    this.animated,
  });

  String? backDefault;
  dynamic backFemale;
  String? backShiny;
  dynamic backShinyFemale;
  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;
  Other? other;
  Versions? versions;
  Sprites? animated;

  Sprites copyWith({
    String? backDefault,
    dynamic backFemale,
    String? backShiny,
    dynamic backShinyFemale,
    String? frontDefault,
    dynamic frontFemale,
    String? frontShiny,
    dynamic frontShinyFemale,
    Other? other,
    Versions? versions,
    Sprites? animated,
  }) =>
      Sprites(
        backDefault: backDefault ?? this.backDefault,
        backFemale: backFemale ?? this.backFemale,
        backShiny: backShiny ?? this.backShiny,
        backShinyFemale: backShinyFemale ?? this.backShinyFemale,
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
        frontShiny: frontShiny ?? this.frontShiny,
        frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
        other: other ?? this.other,
        versions: versions ?? this.versions,
        animated: animated ?? this.animated,
      );

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
        versions: json["versions"] == null
            ? null
            : Versions.fromJson(json["versions"]),
        animated: json["animated"] == null
            ? null
            : Sprites.fromJson(json["animated"]),
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": other?.toJson(),
        "versions": versions?.toJson(),
        "animated": animated?.toJson(),
      };
}

class GenerationI {
  GenerationI({
    this.redBlue,
    this.yellow,
  });

  RedBlue? redBlue;
  RedBlue? yellow;

  GenerationI copyWith({
    RedBlue? redBlue,
    RedBlue? yellow,
  }) =>
      GenerationI(
        redBlue: redBlue ?? this.redBlue,
        yellow: yellow ?? this.yellow,
      );

  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        redBlue: json["red-blue"] == null
            ? null
            : RedBlue.fromJson(json["red-blue"]),
        yellow:
            json["yellow"] == null ? null : RedBlue.fromJson(json["yellow"]),
      );

  Map<String, dynamic> toJson() => {
        "red-blue": redBlue?.toJson(),
        "yellow": yellow?.toJson(),
      };
}

class RedBlue {
  RedBlue({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  String? backDefault;
  String? backGray;
  String? backTransparent;
  String? frontDefault;
  String? frontGray;
  String? frontTransparent;

  RedBlue copyWith({
    String? backDefault,
    String? backGray,
    String? backTransparent,
    String? frontDefault,
    String? frontGray,
    String? frontTransparent,
  }) =>
      RedBlue(
        backDefault: backDefault ?? this.backDefault,
        backGray: backGray ?? this.backGray,
        backTransparent: backTransparent ?? this.backTransparent,
        frontDefault: frontDefault ?? this.frontDefault,
        frontGray: frontGray ?? this.frontGray,
        frontTransparent: frontTransparent ?? this.frontTransparent,
      );

  factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"],
        backGray: json["back_gray"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontGray: json["front_gray"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_gray": backGray,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_gray": frontGray,
        "front_transparent": frontTransparent,
      };
}

class GenerationIi {
  GenerationIi({
    this.crystal,
    this.gold,
    this.silver,
  });

  Crystal? crystal;
  Gold? gold;
  Gold? silver;

  GenerationIi copyWith({
    Crystal? crystal,
    Gold? gold,
    Gold? silver,
  }) =>
      GenerationIi(
        crystal: crystal ?? this.crystal,
        gold: gold ?? this.gold,
        silver: silver ?? this.silver,
      );

  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
        crystal:
            json["crystal"] == null ? null : Crystal.fromJson(json["crystal"]),
        gold: json["gold"] == null ? null : Gold.fromJson(json["gold"]),
        silver: json["silver"] == null ? null : Gold.fromJson(json["silver"]),
      );

  Map<String, dynamic> toJson() => {
        "crystal": crystal?.toJson(),
        "gold": gold?.toJson(),
        "silver": silver?.toJson(),
      };
}

class Crystal {
  Crystal({
    this.backDefault,
    this.backShiny,
    this.backShinyTransparent,
    this.backTransparent,
    this.frontDefault,
    this.frontShiny,
    this.frontShinyTransparent,
    this.frontTransparent,
  });

  String? backDefault;
  String? backShiny;
  String? backShinyTransparent;
  String? backTransparent;
  String? frontDefault;
  String? frontShiny;
  String? frontShinyTransparent;
  String? frontTransparent;

  Crystal copyWith({
    String? backDefault,
    String? backShiny,
    String? backShinyTransparent,
    String? backTransparent,
    String? frontDefault,
    String? frontShiny,
    String? frontShinyTransparent,
    String? frontTransparent,
  }) =>
      Crystal(
        backDefault: backDefault ?? this.backDefault,
        backShiny: backShiny ?? this.backShiny,
        backShinyTransparent: backShinyTransparent ?? this.backShinyTransparent,
        backTransparent: backTransparent ?? this.backTransparent,
        frontDefault: frontDefault ?? this.frontDefault,
        frontShiny: frontShiny ?? this.frontShiny,
        frontShinyTransparent:
            frontShinyTransparent ?? this.frontShinyTransparent,
        frontTransparent: frontTransparent ?? this.frontTransparent,
      );

  factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        backShinyTransparent: json["back_shiny_transparent"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontShinyTransparent: json["front_shiny_transparent"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "back_shiny_transparent": backShinyTransparent,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_shiny_transparent": frontShinyTransparent,
        "front_transparent": frontTransparent,
      };
}

class Gold {
  Gold({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;
  String? frontTransparent;

  Gold copyWith({
    String? backDefault,
    String? backShiny,
    String? frontDefault,
    String? frontShiny,
    String? frontTransparent,
  }) =>
      Gold(
        backDefault: backDefault ?? this.backDefault,
        backShiny: backShiny ?? this.backShiny,
        frontDefault: frontDefault ?? this.frontDefault,
        frontShiny: frontShiny ?? this.frontShiny,
        frontTransparent: frontTransparent ?? this.frontTransparent,
      );

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_transparent": frontTransparent,
      };
}

class GenerationIii {
  GenerationIii({
    this.emerald,
    this.fireredLeafgreen,
    this.rubySapphire,
  });

  OfficialArtwork? emerald;
  Gold? fireredLeafgreen;
  Gold? rubySapphire;

  GenerationIii copyWith({
    OfficialArtwork? emerald,
    Gold? fireredLeafgreen,
    Gold? rubySapphire,
  }) =>
      GenerationIii(
        emerald: emerald ?? this.emerald,
        fireredLeafgreen: fireredLeafgreen ?? this.fireredLeafgreen,
        rubySapphire: rubySapphire ?? this.rubySapphire,
      );

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        emerald: json["emerald"] == null
            ? null
            : OfficialArtwork.fromJson(json["emerald"]),
        fireredLeafgreen: json["firered-leafgreen"] == null
            ? null
            : Gold.fromJson(json["firered-leafgreen"]),
        rubySapphire: json["ruby-sapphire"] == null
            ? null
            : Gold.fromJson(json["ruby-sapphire"]),
      );

  Map<String, dynamic> toJson() => {
        "emerald": emerald?.toJson(),
        "firered-leafgreen": fireredLeafgreen?.toJson(),
        "ruby-sapphire": rubySapphire?.toJson(),
      };
}

class OfficialArtwork {
  OfficialArtwork({
    this.frontDefault,
    this.frontShiny,
  });

  String? frontDefault;
  String? frontShiny;

  OfficialArtwork copyWith({
    String? frontDefault,
    String? frontShiny,
  }) =>
      OfficialArtwork(
        frontDefault: frontDefault ?? this.frontDefault,
        frontShiny: frontShiny ?? this.frontShiny,
      );

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class Home {
  Home({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;

  Home copyWith({
    String? frontDefault,
    dynamic frontFemale,
    String? frontShiny,
    dynamic frontShinyFemale,
  }) =>
      Home(
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
        frontShiny: frontShiny ?? this.frontShiny,
        frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
      );

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class GenerationVii {
  GenerationVii({
    this.icons,
    this.ultraSunUltraMoon,
  });

  DreamWorld? icons;
  Home? ultraSunUltraMoon;

  GenerationVii copyWith({
    DreamWorld? icons,
    Home? ultraSunUltraMoon,
  }) =>
      GenerationVii(
        icons: icons ?? this.icons,
        ultraSunUltraMoon: ultraSunUltraMoon ?? this.ultraSunUltraMoon,
      );

  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
        icons:
            json["icons"] == null ? null : DreamWorld.fromJson(json["icons"]),
        ultraSunUltraMoon: json["ultra-sun-ultra-moon"] == null
            ? null
            : Home.fromJson(json["ultra-sun-ultra-moon"]),
      );

  Map<String, dynamic> toJson() => {
        "icons": icons?.toJson(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon?.toJson(),
      };
}

class DreamWorld {
  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  String? frontDefault;
  dynamic frontFemale;

  DreamWorld copyWith({
    String? frontDefault,
    dynamic frontFemale,
  }) =>
      DreamWorld(
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
      );

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}

class GenerationViii {
  GenerationViii({
    this.icons,
  });

  DreamWorld? icons;

  GenerationViii copyWith({
    DreamWorld? icons,
  }) =>
      GenerationViii(
        icons: icons ?? this.icons,
      );

  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        icons:
            json["icons"] == null ? null : DreamWorld.fromJson(json["icons"]),
      );

  Map<String, dynamic> toJson() => {
        "icons": icons?.toJson(),
      };
}

class Other {
  Other({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
  });

  DreamWorld? dreamWorld;
  Home? home;
  OfficialArtwork? officialArtwork;

  Other copyWith({
    DreamWorld? dreamWorld,
    Home? home,
    OfficialArtwork? officialArtwork,
  }) =>
      Other(
        dreamWorld: dreamWorld ?? this.dreamWorld,
        home: home ?? this.home,
        officialArtwork: officialArtwork ?? this.officialArtwork,
      );

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: json["dream_world"] == null
            ? null
            : DreamWorld.fromJson(json["dream_world"]),
        home: json["home"] == null ? null : Home.fromJson(json["home"]),
        officialArtwork: json["official-artwork"] == null
            ? null
            : OfficialArtwork.fromJson(json["official-artwork"]),
      );

  Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld?.toJson(),
        "home": home?.toJson(),
        "official-artwork": officialArtwork?.toJson(),
      };
}

class Stat {
  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  int? baseStat;
  int? effort;
  Species? stat;

  Stat copyWith({
    int? baseStat,
    int? effort,
    Species? stat,
  }) =>
      Stat(
        baseStat: baseStat ?? this.baseStat,
        effort: effort ?? this.effort,
        stat: stat ?? this.stat,
      );

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: json["stat"] == null ? null : Species.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat?.toJson(),
      };
}

class Type {
  Type({
    this.slot,
    this.type,
  });

  int? slot;
  Species? type;

  Type copyWith({
    int? slot,
    Species? type,
  }) =>
      Type(
        slot: slot ?? this.slot,
        type: type ?? this.type,
      );

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: json["type"] == null ? null : Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type?.toJson(),
      };
}
