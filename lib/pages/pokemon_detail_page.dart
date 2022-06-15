import 'package:flutter/material.dart';
import 'package:flutter_codigo5_pokedex/models/pokemon_model.dart';
import 'package:flutter_codigo5_pokedex/ui/general/colors.dart';
import 'package:flutter_codigo5_pokedex/ui/widgets/item_data_pokemon_widget.dart';
import 'package:flutter_codigo5_pokedex/ui/widgets/item_type_widget.dart';

class PokemonDetailPage extends StatelessWidget {
  PokemonModel pokemon;
  PokemonDetailPage({
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPokemon[pokemon.type[0]],
      appBar: AppBar(
        backgroundColor: colorPokemon[pokemon.type[0]],
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            right: -20,
            top: MediaQuery.of(context).size.height * 0.09,
            child: Image.asset(
              'assets/images/pokeball.png',
              width: 200,
              color: Colors.white.withOpacity(0.26),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pokemon.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: pokemon.type
                              .map(
                                (e) => ItemTypeWidget(type: e),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                    Text(
                      "#${pokemon.num}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Column(
                          children: [
                            const Text(
                              "About Pokemon",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            ItemDataPokemonWidget(
                              title: "Height",
                              data: pokemon.height,
                            ),
                            ItemDataPokemonWidget(
                              title: "Weight",
                              data: pokemon.weight,
                            ),
                            ItemDataPokemonWidget(
                              title: "Egg",
                              data: pokemon.egg,
                            ),
                            ItemDataPokemonWidget(
                              title: "Candy",
                              data: pokemon.candy,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                children: [
                                  Text("Multipliers: "),
                                  Row(
                                    children: pokemon.multipliers!
                                        .map(
                                          (e) => Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            child: Chip(
                                              label: Text(e.toString()),
                                              elevation: 2,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              backgroundColor: Colors.white38,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                children: [
                                  Text("Weaknesses: "),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: pokemon.weaknesses!
                                            .map(
                                              (e) => Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            child: Chip(
                                              label: Text(e),
                                              elevation: 2,
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 10.0),
                                              backgroundColor: Colors.white38,
                                            ),
                                          ),
                                        )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        top: -110,
                        //right: MediaQuery.of(context).size.width * 0.35,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.network(
                            pokemon.img,
                            height: 140.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
