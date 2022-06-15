import 'package:flutter/material.dart';
import 'package:flutter_codigo5_pokedex/models/pokemon_model.dart';
import 'package:flutter_codigo5_pokedex/pages/pokemon_detail_page.dart';
import 'package:flutter_codigo5_pokedex/ui/general/colors.dart';
import 'package:flutter_codigo5_pokedex/ui/widgets/item_type_widget.dart';

class ItemGridWidget extends StatelessWidget {
  // String name;
  // String image;
  // List<String> type;

  PokemonModel pokemon;

  ItemGridWidget({
    // required this.name,
    // required this.image,
    // required this.type,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> PokemonDetailPage(pokemon: pokemon,)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorPokemon[pokemon.type[0]],
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -24,
              right: -14,
              child: Image.asset(
                'assets/images/pokeball.png',
                height: 120,
                color: Colors.white.withOpacity(0.27),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: pokemon.type.map<Widget>((e) => ItemTypeWidget(type: e,)).toList(),
                  ),


                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.network(
                pokemon.img,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
