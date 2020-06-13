import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('starting the app', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('you can see pokemon', () async {
      await Future.delayed(Duration(seconds: 3));

      bool presentFirstPokemon =
          await IntegrationUtils.isPresent(find.byValueKey('pokemon0'), driver);

      expect(presentFirstPokemon, true);

      final firstPokemon = find.byValueKey('pokemon0');

      await driver.tap(firstPokemon);

      bool presentPokemonName = await IntegrationUtils.isPresent(
          find.byValueKey('pokemonName'), driver);

      expect(presentPokemonName, true);

      final pokemonName = find.byValueKey('pokemonName');

      expect(await driver.getText(pokemonName), equals('Bulbasaur'));
    });
  });
}

class IntegrationUtils {
  static isPresent(SerializableFinder byValueKey, FlutterDriver driver,
      {Duration timeout = const Duration(seconds: 2)}) async {
    try {
      await driver.waitFor(byValueKey, timeout: timeout);
      return true;
    } catch (exception) {
      return false;
    }
  }

  List<dynamic> backupData = [
    {
      "description":
          "A strange seed was planted on its back at birth.\fThe plant sprouts and grows with this POKéMON.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
      "name": "bulbasaur",
      "types": ["Grass", "Poison"]
    },
    {
      "description":
          "When the bulb on its back grows large, it appears\fto lose the ability to stand on its hind legs.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png",
      "name": "ivysaur",
      "types": ["Grass", "Poison"]
    },
    {
      "description":
          "The plant blooms when it is absorbing solar\fenergy. It stays on the move to seek sunlight.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png",
      "name": "venusaur",
      "types": ["Grass", "Poison"]
    },
    {
      "description":
          "The fire on the tip of its tail is a measure of its life. If healthy, its tail burns intensely.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png",
      "name": "charmander",
      "types": ["Fire"]
    },
    {
      "description":
          "When it swings its burning tail, it elevates the\ftemperature to unbearably high levels.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png",
      "name": "charmeleon",
      "types": ["Fire"]
    },
    {
      "description":
          "Spits fire that is hot enough to melt boulders.\fKnown to cause forest fires unintentionally.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png",
      "name": "charizard",
      "types": ["Fire", "Flying"]
    },
    {
      "description":
          "After birth, its back swells and hardens into a\fshell. Powerfully sprays foam from its mouth.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png",
      "name": "squirtle",
      "types": ["Water"]
    },
    {
      "description":
          "When tapped, this Pokémon will pull in its head, but its tail will still stick out a little bit.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png",
      "name": "wartortle",
      "types": ["Water"]
    },
    {
      "description":
          "A brutal POKéMON with pressurized water jets on its\fshell. They are used for high speed tackles.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png",
      "name": "blastoise",
      "types": ["Water"]
    },
    {
      "description":
          "Its short feet are tipped with suction pads that\fenable it to tirelessly climb slopes and walls.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/10.png",
      "name": "caterpie",
      "types": ["Bug"]
    },
    {
      "description":
          "A steel-hard shell protects its tender body. It quietly endures hardships while awaiting evolution.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/11.png",
      "name": "metapod",
      "types": ["Bug"]
    },
    {
      "description":
          "In battle, it flaps its wings at high speed to\frelease highly toxic dust into the air.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/12.png",
      "name": "butterfree",
      "types": ["Bug", "Flying"]
    },
    {
      "description":
          "Often found in forests, eating leaves.\fIt has a sharp venomous stinger on its head.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/13.png",
      "name": "weedle",
      "types": ["Bug", "Poison"]
    },
    {
      "description":
          "Almost incapable of moving, this POKéMON can only\fharden its shell to protect itself from predators.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/14.png",
      "name": "kakuna",
      "types": ["Bug", "Poison"]
    },
    {
      "description":
          "Flies at high speed and attacks using its large\fvenomous stingers on its forelegs and tail.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/15.png",
      "name": "beedrill",
      "types": ["Bug", "Poison"]
    },
    {
      "description":
          "It is docile and prefers to avoid conflict. If disturbed, however, it can ferociously strike back.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/16.png",
      "name": "pidgey",
      "types": ["Normal", "Flying"]
    },
    {
      "description":
          "Very protective of its sprawling territorial area,\fthis POKéMON will fiercely peck at any intruder.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/17.png",
      "name": "pidgeotto",
      "types": ["Normal", "Flying"]
    },
    {
      "description":
          "When hunting, it skims the surface of water at high\fspeed to pick off unwary prey such as MAGIKARP.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/18.png",
      "name": "pidgeot",
      "types": ["Normal", "Flying"]
    },
    {
      "description":
          "Bites anything when it attacks. Small and very\fquick, it is a common sight in many places.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/19.png",
      "name": "rattata",
      "types": ["Normal"]
    },
    {
      "description":
          "It uses its whis­ kers to maintain its balance.\fIt apparently slows down if they are cut off.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/20.png",
      "name": "raticate",
      "types": ["Normal"]
    },
    {
      "description":
          "Eats bugs in grassy areas. It has to flap its\fshort wings at high speed to stay airborne.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/21.png",
      "name": "spearow",
      "types": ["Normal", "Flying"]
    },
    {
      "description":
          "It has the stamina to fly all day on its broad wings. It fights by using its sharp beak.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/22.png",
      "name": "fearow",
      "types": ["Normal", "Flying"]
    },
    {
      "description":
          "Moves silently and stealthily. Eats the eggs of\fbirds, such as PIDGEY and SPEAROW, whole.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/23.png",
      "name": "ekans",
      "types": ["Poison"]
    },
    {
      "description":
          "It is rumored that the ferocious warning markings\fon its belly differ from area to area.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/24.png",
      "name": "arbok",
      "types": ["Poison"]
    },
    {
      "description":
          "When several of these POKéMON gather, their\felectricity could build and cause lightning storms.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
      "name": "pikachu",
      "types": ["Electric"]
    },
    {
      "description":
          "Its long tail serves as a ground to protect itself from its own high-voltage power.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/26.png",
      "name": "raichu",
      "types": ["Electric"]
    },
    {
      "description":
          "Burrows deep underground in arid locations\ffar from water. It only emerges to hunt for food.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/27.png",
      "name": "sandshrew",
      "types": ["Ground"]
    },
    {
      "description":
          "Curls up into a spiny ball when threatened. It\fcan roll while curled up to attack or escape.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/28.png",
      "name": "sandslash",
      "types": ["Ground"]
    },
    {
      "description":
          "Although small, its venomous barbs render this\fPOKéMON dangerous. The female has smaller horns.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/29.png",
      "name": "nidoran-f",
      "types": ["Poison"]
    },
    {
      "description":
          "The female's horn develops slowly. Prefers physical\fattacks such as clawing and biting.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/30.png",
      "name": "nidorina",
      "types": ["Poison"]
    },
    {
      "description":
          "Its hard scales provide strong protection. It\fuses its hefty bulk to execute powerful moves.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/31.png",
      "name": "nidoqueen",
      "types": ["Poison", "Ground"]
    },
    {
      "description":
          "Stiffens its ears to sense danger. The larger its\fhorns, the more powerful its secreted venom.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/32.png",
      "name": "nidoran-m",
      "types": ["Poison"]
    },
    {
      "description":
          "An aggressive POKéMON that is quick to attack.\fThe horn on its head secretes a powerful venom.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/33.png",
      "name": "nidorino",
      "types": ["Poison"]
    },
    {
      "description":
          "One swing of its mighty tail can snap a telephone pole as if it were a matchstick.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/34.png",
      "name": "nidoking",
      "types": ["Poison", "Ground"]
    },
    {
      "description":
          "Its magical and cute appeal has many admirers.\fIt is rare and found only in certain areas.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/35.png",
      "name": "clefairy",
      "types": ["Fairy"]
    },
    {
      "description":
          "A timid fairy POKéMON that is rarely seen. It\fwill run and hide the moment it senses people.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/36.png",
      "name": "clefable",
      "types": ["Fairy"]
    },
    {
      "description":
          "At the time of birth, it has just one tail.\fThe tail splits from its tip as it grows older.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/37.png",
      "name": "vulpix",
      "types": ["Fire"]
    },
    {
      "description":
          "Very smart and very vengeful. Grabbing one of\fits many tails could result in a 1000-year curse.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/38.png",
      "name": "ninetales",
      "types": ["Fire"]
    },
    {
      "description":
          "When its huge eyes light up, it sings a mysteriously\fsoothing melody that lulls its enemies to sleep.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/39.png",
      "name": "jigglypuff",
      "types": ["Normal", "Fairy"]
    },
    {
      "description":
          "The body is soft and rubbery. When angered, it will\fsuck in air and inflate itself to an enormous size.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/40.png",
      "name": "wigglytuff",
      "types": ["Normal", "Fairy"]
    },
    {
      "description":
          "Forms colonies in perpetually dark places. Uses\fultrasonic waves to identify and approach targets.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/41.png",
      "name": "zubat",
      "types": ["Poison", "Flying"]
    },
    {
      "description":
          "Once it strikes, it will not stop draining energy\ffrom the victim even if it gets too heavy to fly.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/42.png",
      "name": "golbat",
      "types": ["Poison", "Flying"]
    },
    {
      "description":
          "Awakened by moonlight, it roams actively at night. In the day, it stays quietly underground.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/43.png",
      "name": "oddish",
      "types": ["Grass", "Poison"]
    },
    {
      "description":
          "The fluid that oozes from its mouth isn't drool.\fIt is a nectar that is used to attract prey.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/44.png",
      "name": "gloom",
      "types": ["Grass", "Poison"]
    },
    {
      "description":
          "The larger its petals, the more toxic pollen it\fcontains. Its big head is heavy and hard to hold up.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/45.png",
      "name": "vileplume",
      "types": ["Grass", "Poison"]
    },
    {
      "description":
          "Burrows to suck tree roots. The mushrooms on its\fback grow by draw­ ing nutrients from the bug host.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/46.png",
      "name": "paras",
      "types": ["Bug", "Grass"]
    },
    {
      "description":
          "A host-parasite pair in which the parasite mushroom\fhas taken over the host bug. Prefers damp places.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/47.png",
      "name": "parasect",
      "types": ["Bug", "Grass"]
    },
    {
      "description":
          "Its big eyes are actually clusters of tiny eyes. At night, its kind is drawn by light.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/48.png",
      "name": "venonat",
      "types": ["Bug", "Poison"]
    },
    {
      "description":
          "The dust-like scales covering its wings are\fcolor coded to indicate the kinds of poison it has.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/49.png",
      "name": "venomoth",
      "types": ["Bug", "Poison"]
    },
    {
      "description":
          "Lives about one yard underground where it feeds on\fplant roots. It sometimes appears above ground.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/50.png",
      "name": "diglett",
      "types": ["Ground"]
    },
    {
      "description":
          "A team of DIGLETT triplets. It triggers huge\fearthquakes by burrowing 60 miles underground.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/51.png",
      "name": "dugtrio",
      "types": ["Ground"]
    },
    {
      "description":
          "Adores circular objects. Wanders the streets on a\fnightly basis to look for dropped loose change.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/52.png",
      "name": "meowth",
      "types": ["Normal"]
    },
    {
      "description":
          "Although its fur has many admirers, it is tough to\fraise as a pet because of its fickle meanness.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/53.png",
      "name": "persian",
      "types": ["Normal"]
    },
    {
      "description":
          "While lulling its enemies with its vacant look, this\fwily POKéMON will use psychokinetic powers.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/54.png",
      "name": "psyduck",
      "types": ["Water"]
    },
    {
      "description":
          "Often seen swim­ ming elegantly by lake shores. It\fis often mistaken for the Japanese monster, Kappa.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/55.png",
      "name": "golduck",
      "types": ["Water"]
    },
    {
      "description":
          "It lives in treetop colonies. If one becomes enraged, the whole colony rampages for no reason.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/56.png",
      "name": "mankey",
      "types": ["Fighting"]
    },
    {
      "description":
          "Always furious and tenacious to boot. It will not\fabandon chasing its quarry until it is caught.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/57.png",
      "name": "primeape",
      "types": ["Fighting"]
    },
    {
      "description":
          "Very protective of its territory. It will bark and\fbite to repel intruders from its space.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/58.png",
      "name": "growlithe",
      "types": ["Fire"]
    },
    {
      "description":
          "Its proud and regal appearance has captured the hearts of people since long ago.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/59.png",
      "name": "arcanine",
      "types": ["Fire"]
    },
    {
      "description":
          "Its newly grown legs prevent it from running. It\fappears to prefer swimming than trying to stand.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/60.png",
      "name": "poliwag",
      "types": ["Water"]
    },
    {
      "description":
          "The skin on most of its body is moist. However,\fthe skin on its belly spiral feels smooth.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/61.png",
      "name": "poliwhirl",
      "types": ["Water"]
    },
    {
      "description":
          "An adept swimmer at both the front crawl and breast\fstroke. Easily overtakes the best human swimmers.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/62.png",
      "name": "poliwrath",
      "types": ["Water", "Fighting"]
    },
    {
      "description":
          "Using its ability to read minds, it will identify\fimpending danger and TELEPORT to safety.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/63.png",
      "name": "abra",
      "types": ["Psychic"]
    },
    {
      "description":
          "It emits special alpha waves from its body that\finduce headaches just by being close by.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/64.png",
      "name": "kadabra",
      "types": ["Psychic"]
    },
    {
      "description":
          "Its brain can out­ perform a super­ computer.\fIts intelligence quotient is said to be 5,000.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/65.png",
      "name": "alakazam",
      "types": ["Psychic"]
    },
    {
      "description":
          "Loves to build its muscles. It trains in all\fstyles of martial arts to become even stronger.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/66.png",
      "name": "machop",
      "types": ["Fighting"]
    },
    {
      "description":
          "It happily carries heavy cargo to toughen up. It willingly does hard work for people.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/67.png",
      "name": "machoke",
      "types": ["Fighting"]
    },
    {
      "description":
          "Using its heavy muscles, it throws powerful punches\fthat can send the victim clear over the horizon.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/68.png",
      "name": "machamp",
      "types": ["Fighting"]
    },
    {
      "description":
          "A carnivorous POKéMON that traps and eats bugs.\fIt uses its root feet to soak up needed moisture.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/69.png",
      "name": "bellsprout",
      "types": ["Grass", "Poison"]
    },
    {
      "description":
          "It spits out POISONPOWDER to immobilize the\fenemy and then finishes it with a spray of ACID.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/70.png",
      "name": "weepinbell",
      "types": ["Grass", "Poison"]
    },
    {
      "description":
          "Said to live in huge colonies deep in jungles,\falthough no one has ever returned from there.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/71.png",
      "name": "victreebel",
      "types": ["Grass", "Poison"]
    },
    {
      "description":
          "Drifts in shallow seas. Anglers who hook them by\faccident are often punished by its stinging acid.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/72.png",
      "name": "tentacool",
      "types": ["Water", "Poison"]
    },
    {
      "description":
          "The tentacles are normally kept short. On hunts,\fthey are extended to ensnare and immobilize prey.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/73.png",
      "name": "tentacruel",
      "types": ["Water", "Poison"]
    },
    {
      "description":
          "Many live on mountain trails and remain half buried while keeping an eye on climbers.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/74.png",
      "name": "geodude",
      "types": ["Rock", "Ground"]
    },
    {
      "description":
          "Rolls down slopes to move. It rolls over any obstacle\fwithout slowing or changing its direction.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/75.png",
      "name": "graveler",
      "types": ["Rock", "Ground"]
    },
    {
      "description":
          "Its boulder-like body is extremely hard. It can\feasily withstand dynamite blasts without damage.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/76.png",
      "name": "golem",
      "types": ["Rock", "Ground"]
    },
    {
      "description":
          "Its hooves are 10 times harder than diamonds. It can\ftrample anything completely flat in little time.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/77.png",
      "name": "ponyta",
      "types": ["Fire"]
    },
    {
      "description":
          "Very competitive, this POKéMON will chase anything\fthat moves fast in the hopes of racing it.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/78.png",
      "name": "rapidash",
      "types": ["Fire"]
    },
    {
      "description":
          "Incredibly slow and dopey. It takes 5 seconds\ffor it to feel pain when under attack.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/79.png",
      "name": "slowpoke",
      "types": ["Water", "Psychic"]
    },
    {
      "description":
          "The SHELLDER that is latched onto SLOWPOKE's tail\fis said to feed on the host's left over scraps.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/80.png",
      "name": "slowbro",
      "types": ["Water", "Psychic"]
    },
    {
      "description":
          "Uses anti-gravity to stay suspended. Appears without\fwarning and uses THUNDER WAVE and similar moves.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/81.png",
      "name": "magnemite",
      "types": ["Electric", "Steel"]
    },
    {
      "description":
          "Formed by several MAGNEMITEs linked together. They\ffrequently appear when sunspots flare up.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/82.png",
      "name": "magneton",
      "types": ["Electric", "Steel"]
    },
    {
      "description":
          "The sprig of green onions it holds is its\fweapon. It is used much like a metal sword.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/83.png",
      "name": "farfetchd",
      "types": ["Normal", "Flying"]
    },
    {
      "description":
          "A bird that makes up for its poor flying with its\ffast foot speed. Leaves giant footprints.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/84.png",
      "name": "doduo",
      "types": ["Normal", "Flying"]
    },
    {
      "description":
          "Uses its three brains to execute complex plans.\fWhile two heads sleep, one head stays awake.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/85.png",
      "name": "dodrio",
      "types": ["Normal", "Flying"]
    },
    {
      "description":
          "The protruding horn on its head is very hard.\fIt is used for bashing through thick ice.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/86.png",
      "name": "seel",
      "types": ["Water"]
    },
    {
      "description":
          "Stores thermal energy in its body. Swims at a\fsteady 8 knots even in intensely cold waters.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/87.png",
      "name": "dewgong",
      "types": ["Water", "Ice"]
    },
    {
      "description":
          "Appears in filthy areas. Thrives by sucking up\fpolluted sludge that is pumped out of factories.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/88.png",
      "name": "grimer",
      "types": ["Poison"]
    },
    {
      "description":
          "Thickly covered with a filthy, vile sludge. It\fis so toxic, even its footprints contain poison.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/89.png",
      "name": "muk",
      "types": ["Poison"]
    },
    {
      "description":
          "Its hard shell repels any kind of attack.\fIt is vulnerable only when its shell is open.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/90.png",
      "name": "shellder",
      "types": ["Water"]
    },
    {
      "description":
          "When attacked, it launches its horns in quick\fvolleys. Its innards have never been seen.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/91.png",
      "name": "cloyster",
      "types": ["Water", "Ice"]
    },
    {
      "description":
          "Almost invisible, this gaseous POKéMON cloaks\fthe target and puts it to sleep without notice.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/92.png",
      "name": "gastly",
      "types": ["Ghost", "Poison"]
    },
    {
      "description":
          "Because of its ability to slip through block\fwalls, it is said to be from an­ other dimension.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/93.png",
      "name": "haunter",
      "types": ["Ghost", "Poison"]
    },
    {
      "description":
          "Under a full moon, this POKéMON likes to mimic\fthe shadows of people and laugh at their fright.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/94.png",
      "name": "gengar",
      "types": ["Ghost", "Poison"]
    },
    {
      "description":
          "As it grows, the stone portions of its body harden\fto become similar to a diamond, but colored black.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/95.png",
      "name": "onix",
      "types": ["Rock", "Ground"]
    },
    {
      "description":
          "Puts enemies to sleep then eats their dreams.\fOccasionally gets sick from eating bad dreams.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/96.png",
      "name": "drowzee",
      "types": ["Psychic"]
    },
    {
      "description":
          "When it locks eyes with an enemy, it will use a mix of\fPSI moves such as HYPNOSIS and CONFUSION.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/97.png",
      "name": "hypno",
      "types": ["Psychic"]
    },
    {
      "description":
          "Its pincers are not only powerful weapons, they are\fused for balance when walking sideways.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/98.png",
      "name": "krabby",
      "types": ["Water"]
    },
    {
      "description":
          "The large pincer has 10000 hp of crushing power.\fHowever, its huge size makes it unwieldy to use.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/99.png",
      "name": "kingler",
      "types": ["Water"]
    },
    {
      "description":
          "Usually found in power plants. Easily mistaken\ffor a POKé BALL, they have zapped many people.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/100.png",
      "name": "voltorb",
      "types": ["Electric"]
    },
    {
      "description":
          "It stores electric energy under very high pressure.\fIt often explodes with little or no provocation.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/101.png",
      "name": "electrode",
      "types": ["Electric"]
    },
    {
      "description":
          "Its six eggs converse using telepathy. They can quickly gather if they become separated.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/102.png",
      "name": "exeggcute",
      "types": ["Grass", "Psychic"]
    },
    {
      "description":
          "Legend has it that on rare occasions, one of its heads\fwill drop off and continue on as an EXEGGCUTE.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/103.png",
      "name": "exeggutor",
      "types": ["Grass", "Psychic"]
    },
    {
      "description":
          "Because it never removes its skull helmet, no one\fhas ever seen this POKéMON's real face.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/104.png",
      "name": "cubone",
      "types": ["Ground"]
    },
    {
      "description":
          "The bone it holds is its key weapon. It throws the\fbone skillfully like a boomerang to KO targets.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/105.png",
      "name": "marowak",
      "types": ["Ground"]
    },
    {
      "description":
          "When in a hurry, its legs lengthen progressively.\fIt runs smoothly with extra long, loping strides.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/106.png",
      "name": "hitmonlee",
      "types": ["Fighting"]
    },
    {
      "description":
          "While apparently doing nothing, it fires punches in\flightning fast volleys that are impossible to see.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/107.png",
      "name": "hitmonchan",
      "types": ["Fighting"]
    },
    {
      "description":
          "Its tongue can be extended like a chameleon's. It\fleaves a tingling sensation when it licks enemies.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/108.png",
      "name": "lickitung",
      "types": ["Normal"]
    },
    {
      "description":
          "Because it stores several kinds of toxic gases in\fits body, it is prone to exploding without warning.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/109.png",
      "name": "koffing",
      "types": ["Poison"]
    },
    {
      "description":
          "Where two kinds of poison gases meet, 2 KOFFINGs\fcan fuse into a WEEZING over many years.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/110.png",
      "name": "weezing",
      "types": ["Poison"]
    },
    {
      "description":
          "Its massive bones are 1000 times harder than human\fbones. It can easily knock a trailer flying.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/111.png",
      "name": "rhyhorn",
      "types": ["Ground", "Rock"]
    },
    {
      "description":
          "Protected by an armor-like hide, it is capable of\fliving in molten lava of 3,600 degrees.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/112.png",
      "name": "rhydon",
      "types": ["Ground", "Rock"]
    },
    {
      "description":
          "A rare and elusive POKéMON that is said to bring\fhappiness to those who manage to get it.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/113.png",
      "name": "chansey",
      "types": ["Normal"]
    },
    {
      "description":
          "The whole body is swathed with wide vines that are\fsimilar to sea­ weed. Its vines shake as it walks.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/114.png",
      "name": "tangela",
      "types": ["Grass"]
    },
    {
      "description":
          "The infant rarely ventures out of its mother's\fprotective pouch until it is 3 years old.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/115.png",
      "name": "kangaskhan",
      "types": ["Normal"]
    },
    {
      "description":
          "Known to shoot down flying bugs with precision\fblasts of ink from the surface of the water.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/116.png",
      "name": "horsea",
      "types": ["Water"]
    },
    {
      "description":
          "Its spines provide protection. Its fins and bones are prized as traditional medicine ingredients.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/117.png",
      "name": "seadra",
      "types": ["Water"]
    },
    {
      "description":
          "Its tail fin billows like an elegant ballroom\fdress, giving it the nickname of the Water Queen.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/118.png",
      "name": "goldeen",
      "types": ["Water"]
    },
    {
      "description":
          "In the autumn spawning season, they can be seen\fswimming power­ fully up rivers and creeks.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/119.png",
      "name": "seaking",
      "types": ["Water"]
    },
    {
      "description":
          "An enigmatic POKéMON that can effortlessly\fregenerate any appendage it loses in battle.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/120.png",
      "name": "staryu",
      "types": ["Water"]
    },
    {
      "description":
          "Its central core glows with the seven colors of\fthe rainbow. Some people value the core as a gem.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/121.png",
      "name": "starmie",
      "types": ["Water", "Psychic"]
    },
    {
      "description":
          "If interrupted while it is miming, it will\fslap around the offender with its broad hands.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/122.png",
      "name": "mr-mime",
      "types": ["Psychic", "Fairy"]
    },
    {
      "description":
          "With ninja-like agility and speed, it can create the\fillusion that there is more than one.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/123.png",
      "name": "scyther",
      "types": ["Bug", "Flying"]
    },
    {
      "description":
          "It seductively wiggles its hips as it walks. It\fcan cause people to dance in unison with it.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/124.png",
      "name": "jynx",
      "types": ["Ice", "Psychic"]
    },
    {
      "description":
          "Normally found near power plants, they can wander\faway and cause major blackouts in cities.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/125.png",
      "name": "electabuzz",
      "types": ["Electric"]
    },
    {
      "description":
          "Its body always burns with an orange glow that\fenables it to hide perfectly among flames.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/126.png",
      "name": "magmar",
      "types": ["Fire"]
    },
    {
      "description":
          "If it fails to crush the victim in its pincers,\fit will swing it around and toss it hard.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/127.png",
      "name": "pinsir",
      "types": ["Bug"]
    },
    {
      "description":
          "When it targets an enemy, it charges furiously\fwhile whipping its body with its long tails.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/128.png",
      "name": "tauros",
      "types": ["Normal"]
    },
    {
      "description":
          "In the distant past, it was somewhat stronger\fthan the horribly weak descendants that exist today.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/129.png",
      "name": "magikarp",
      "types": ["Water"]
    },
    {
      "description":
          "Rarely seen in the wild. Huge and vicious, it\fis capable of destroying entire cities in a rage.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/130.png",
      "name": "gyarados",
      "types": ["Water", "Flying"]
    },
    {
      "description":
          "A POKéMON that has been over­ hunted almost to\fextinction. It can ferry people across the water.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/131.png",
      "name": "lapras",
      "types": ["Water", "Ice"]
    },
    {
      "description":
          "Capable of copying an enemy's genetic code to instantly\ftransform itself into a duplicate of the enemy.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png",
      "name": "ditto",
      "types": ["Normal"]
    },
    {
      "description":
          "Its genetic code is irregular. It may mutate if\fit is exposed to radiation from element STONEs.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/133.png",
      "name": "eevee",
      "types": ["Normal"]
    },
    {
      "description":
          "Lives close to water. Its long tail is ridged\fwith a fin which is often mistaken for a mermaid's.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/134.png",
      "name": "vaporeon",
      "types": ["Water"]
    },
    {
      "description":
          "It accumulates negative ions in the atmosphere to\fblast out 10000- volt lightning bolts.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/135.png",
      "name": "jolteon",
      "types": ["Electric"]
    },
    {
      "description":
          "When storing thermal energy in its body, its\ftemperature could soar to over 1600 degrees.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/136.png",
      "name": "flareon",
      "types": ["Fire"]
    },
    {
      "description":
          "A POKéMON that consists entirely of programming\fcode. Capable of moving freely in cyberspace.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/137.png",
      "name": "porygon",
      "types": ["Normal"]
    },
    {
      "description":
          "Although long extinct, in rare cases, it can be\fgenetically resurrected from fossils.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/138.png",
      "name": "omanyte",
      "types": ["Rock", "Water"]
    },
    {
      "description":
          "Once wrapped around its prey, it never lets go. It eats the prey by tearing at it with sharp fangs.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/139.png",
      "name": "omastar",
      "types": ["Rock", "Water"]
    },
    {
      "description":
          "A POKéMON that was resurrected from a fossil\ffound in what was once the ocean floor eons ago.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/140.png",
      "name": "kabuto",
      "types": ["Rock", "Water"]
    },
    {
      "description":
          "Its sleek shape is perfect for swim­ ming. It slashes\fprey with its claws and drains the body fluids.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/141.png",
      "name": "kabutops",
      "types": ["Rock", "Water"]
    },
    {
      "description":
          "A Pokémon that roamed the skies in the dinosaur era. Its teeth are like saw blades.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/142.png",
      "name": "aerodactyl",
      "types": ["Rock", "Flying"]
    },
    {
      "description":
          "Very lazy. Just eats and sleeps. As its rotund\fbulk builds, it becomes steadily more slothful.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/143.png",
      "name": "snorlax",
      "types": ["Normal"]
    },
    {
      "description":
          "A legendary bird POKéMON that is said to appear to\fdoomed people who are lost in icy mountains.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/144.png",
      "name": "articuno",
      "types": ["Ice", "Flying"]
    },
    {
      "description":
          "A legendary bird POKéMON that is said to appear\ffrom clouds while dropping enormous lightning bolts.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/145.png",
      "name": "zapdos",
      "types": ["Electric", "Flying"]
    },
    {
      "description":
          "One of the legendary bird Pokémon. It is said that its appearance indicates the coming of spring.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/146.png",
      "name": "moltres",
      "types": ["Fire", "Flying"]
    },
    {
      "description":
          "Long considered a mythical POKéMON until recently\fwhen a small colony was found living underwater.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/147.png",
      "name": "dratini",
      "types": ["Dragon"]
    },
    {
      "description":
          "A mystical POKéMON that exudes a gentle aura.\fHas the ability to change climate conditions.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/148.png",
      "name": "dragonair",
      "types": ["Dragon"]
    },
    {
      "description":
          "An extremely rarely seen marine POKéMON.\fIts intelligence is said to match that of humans.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/149.png",
      "name": "dragonite",
      "types": ["Dragon", "Flying"]
    },
    {
      "description":
          "It was created by a scientist after years of horrific\fgene splicing and DNA engineering experiments.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/150.png",
      "name": "mewtwo",
      "types": ["Psychic"]
    },
    {
      "description":
          "So rare that it is still said to be a mirage by\fmany experts. Only a few people have seen it worldwide.",
      "image":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/151.png",
      "name": "mew",
      "types": ["Psychic"]
    }
  ];
}
