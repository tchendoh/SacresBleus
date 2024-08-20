//
//  Expression.swift
//  SacresBleus
//
//  Created by Eric Chandonnet on 2024-03-06.
//

import Foundation
import SwiftUI

enum ExpressionType: String, Codable {
    case blasphemyOrigin = "religieux"
    case blasphemy = "juron"
    case blasphemyEuphemism = "euphémisme"
}

struct Expression: Identifiable, Hashable, Codable {
    var id = UUID()
    var text: String
    var type: ExpressionType
    var definition: String
    var phonetic: String
    var profanityLevel: Double
    var frequency: Double
    var origin: String
    var euphemism: [String] = []
    var example: [String]
}

struct FoundExpression: Identifiable, Hashable {
    var id = UUID()
    var expression: Expression
    var color: Color
    var attributedString: AttributedString
}

// à ajouter : saperlipopette, jarnicoton, torrieu, sacramouille, ostique, estic, osto, mauditement

var expressions = [
    Expression(text: "baptême",
               type: .blasphemyOrigin,
               definition: """
               Dans la tradition catholique, un sacrement fondamental symbolisant la purification des péchés originels et l'entrée dans la communauté des croyants. Il est administré par l'aspersion ou l'immersion dans l'eau et est considéré comme le premier des sept sacrements de l'Église catholique.
               """,
               phonetic: "batÈm",
               profanityLevel: 0,
               frequency: 0,
               origin: "Du latin *baptismus*, ‘baptême’.",
               example: ["**Nom :** On est allé au baptême du fils à Louis en fin de semaine pis crisse que c'était plate! "]),
    
    Expression(text: "baptême",
               type: .blasphemy,
               definition: "Juron inoffensif qui était le préféré de Ti-Mé Paré dans La Petite vie.",
               phonetic: "batÈm",
               profanityLevel: 4,
               frequency: 8,
               origin: "Dérivé du nom @baptême_origin.",
               euphemism: ["batèche",
                           "batinse"],
               example: ["**Interjection :** Sauf que la journée des poubelles est le jeudi, baptême!",
                         "**Adjectif :** Il était en baptême contre le petit vendeur du Old Navy."]),
    
    Expression(text: "batèche",
               type: .blasphemyEuphemism,
               definition: "Interjection exprimant la contrariété.",
               phonetic: "batèS",
               profanityLevel: 5,
               frequency: 5,
               origin: "Euphémisme de @baptême.",
               example: ["**Interjection :** Batèche, peux-tu mettre ton clignotant encore moins que ça?",
                         "**Adjectif :** T'aurais dû le voir filer si fièrement sur son Bixi avant de prendre une batèche de débarque!",
                         "**Nom :** Passe juste un peu plus proche pour voir, mon batèche!"]),
    
    Expression(text: "batinse",
               type: .blasphemyEuphemism,
               definition: "Juron inoffensif utilisé pour exprimer l'exaspération, la frustration ou le désarroi.",
               phonetic: "batês",
               profanityLevel: 4,
               frequency: 4,
               origin: "Euphémisme de @baptême.",
               example: ["**Interjection :** Arrête de niaiser, batinse!"]),
    
    Expression(text: "bâtard",
               type: .blasphemyOrigin,
               definition: """
               Terme historiquement chargé désignant une personne née de parents non mariés, souvent utilisé avec condescendance ou mépris. Bien que son utilisation soit devenue moins courante et socialement inacceptable, elle reste ancrée dans l'histoire comme un rappel des préjugés passés liés à la légitimité de la naissance.
               """,
               phonetic: "bàtàr",
               profanityLevel: 0,
               frequency: 0,
               origin: "Emprunt au germanique *banstu*, ‘union avec une deuxième femme de rang inférieur’, et -⁠ard, ‘mauvais’",
               example: ["**Nom :** Au risque de te divulgâcher un peu l'histoire, Jon Snow n'est pas vraiment un bâtard."]),

    Expression(text: "bâtard",
               type: .blasphemy,
               definition: """
               Terme historiquement chargé désignant une personne née de parents non mariés, souvent utilisé avec condescendance ou mépris. Bien que son utilisation soit devenue moins courante et socialement inacceptable, elle reste ancrée dans l'histoire comme un rappel des préjugés passés liés à la légitimité de la naissance.
               """,
               phonetic: "bàtàr",
               profanityLevel: 4,
               frequency: 9,
               origin: "De @bâtard_origin.",
               example: ["**Interjection :** Ça fait six fois que je me plante, bâtard!",
                         "**Nom :** Ils ont même pas fait de rappels, les bâtards!"]),

    Expression(text: "calice",
               type: .blasphemyOrigin,
               definition: """
               Récipient liturgique utilisé dans les cérémonies religieuses, en particulier dans la tradition chrétienne, pour contenir le vin consacré lors de l'eucharistie. Symbole de la coupe utilisée par Jésus lors de la Cène, le calice incarne la présence sacrée du Christ dans le sacrement de la communion.
               """,
               phonetic: "kalis",
               profanityLevel: 0,
               frequency: 0,
               origin: "Emprunt au latin classique calicis, génitif de calix, ‘vase à boire’",
               example: ["**Nom :** Est-ce que c'est dans le premier Indiana Jones où le gars boit dans une espèce de calice et que la face lui fond?"]),
    
    Expression(text: "câlice",
               type: .blasphemy,
               definition: "Juron grossier.",
               phonetic: "kàlis",
               profanityLevel: 9,
               frequency: 10,
               origin: "De @calice_origin.",
               euphemism: ["câlique",
                           "câline",
                           "câliboire"],
               example: ["**Interjection :** Câlice que t'es laid!", 
                         "**Nom :** Lâche son carosse, mon câlice!",
                         "**Adjectif :** Ouais, c'est le genre de situation qui est un peu câlice.",
                         "**Adverbe :** La grosse poutine à quatre heure du matin était câlicement de trop.",
                         "**Verbe :** Les quinze premières fois, j'ai calicé ma boule dans le daleau."]),
    
    Expression(text: "câlique",
               type: .blasphemyEuphemism,
               definition: "Juron grossier",
               phonetic: "kàlik",
               profanityLevel: 5,
               frequency: 7,
               origin: "Euphémisme de @câlice.",
               example: ["**Interjection :** Câlique, j'ai le *pinch* plein de sirop d'érable.", 
                         "**Nom :** Crois-moi, t'as pas fini de perdre, mon câlique!"]),
    
    Expression(text: "câline",
               type: .blasphemyEuphemism,
               definition: "Juron inoffensif.",
               phonetic: "kàlin",
               profanityLevel: 3,
               frequency: 6,
               origin: "Euphémisme de @câlice.",
               example: ["**Interjection :** T'arrives toujours en retard, câline!", 
                         "**Nom :** ", "**Adjectif :** Ma deuxième t'a pris une câline de débarque."]),
    
    Expression(text: "câliboire",
               type: .blasphemyOrigin,
               definition: "Juron plutôt inoffensif.",
               phonetic: "kàlibwàr",
               profanityLevel: 3,
               frequency: 3,
               origin: "Euphémisme né d'un mariage entre @câlice et @ciboire.",
               example: ["**Interjection :** Voir que t'as donné aucun pourboire, câliboire! Tu sais pas vivre?",
                         "**Nom :** Le câliboire de printemps n'arrivera juste jamais, calvaire!"]),
    
    Expression(text: "calvaire",
               type: .blasphemyOrigin,
               definition: """
               Terme aux multiples significations, faisant référence à la fois à un lieu de supplice où des crucifixions ou des tortures ont eu lieu, et à une série de souffrances ou d'épreuves difficiles. Dans un contexte religieux, le Calvaire désigne spécifiquement le lieu où Jésus-Christ a été crucifié, également connu sous le nom de Golgotha. Dans un sens plus général, le terme est utilisé pour décrire une situation particulièrement difficile ou pénible.
               """,
               phonetic: "kalvÈr",
               profanityLevel: 0,
               frequency: 0,
               origin: "Du latin *calvaria*, ‘lieu du crâne’.",
               example: ["**Nom :** Je te jure, il fallait y aller chaque crime de dimanche matin, un vrai calvaire!"]),
    
    Expression(text: "calvaire",
               type: .blasphemyOrigin,
               definition: """
               Juron assez intense.
               """,
               phonetic: "kalvÈr",
               profanityLevel: 8,
               frequency: 9,
               origin: "De @calvaire_origin.",
               euphemism: ["calvasse"],
               example: ["**Nom :** Je te jure, il fallait y aller chaque crime de dimanche matin, un vrai calvaire!"]),
    
    Expression(text: "calvasse",
               type: .blasphemyEuphemism,
               definition: "Juron plutôt inoffensif.",
               phonetic: "kalvas",
               profanityLevel: 3,
               frequency: 2,
               origin: "Euphémisme de @calvaire.",
               example: ["**Interjection :** C'est écrit une pincée de sel, calvasse, pas le sac au complet!"]),
    
    Expression(text: "ciboire",
               type: .blasphemyOrigin,
               definition: "Vase sacré à couvercle où sont conservées les hosties consacrées.",
               phonetic: "sibwàr",
               profanityLevel: 0,
               frequency: 0,
               origin: "",
               example: ["**Nom :** Es-tu game d'aller chercher le ciboire pendant que monseigneur est pompette?"]),
    
    Expression(text: "ciboire",
               type: .blasphemy,
               definition: "Juron grossier.",
               phonetic: "sibwàr",
               profanityLevel: 8,
               frequency: 6,
               origin: "De @ciboire_origin.",
               euphemism: ["cibole"],
               example: ["**Interjection :** ", "**Nom :** ", "**Adjectif :** ", "**Adverbe :**", "**Verbe :** "]),
    
    Expression(text: "cibole",
               type: .blasphemyEuphemism,
               definition: "Juron plutôt inoffensif.",
               phonetic: "sibòl",
               profanityLevel: 3,
               frequency: 3,
               origin: "Euphémisme de @ciboire.",
               example: ["**Interjection :** Cibole, il ne restait plus de sapin adulte?"]),
    
    Expression(text: "chrême",
               type: .blasphemyOrigin,
               definition: "Huile consacrée mêlée de baume, employée lors de certaines onctions sacramentelles.",
               phonetic: "krÈm",
               profanityLevel: 0,
               frequency: 0,
               origin: "Du latin *chrisma*, ‘huile bénite‘.",
               example: [""]),
    
    Expression(text: "chrême",
               type: .blasphemy,
               definition: "Juron inoffensif, surtout utilisé sous la forme *« saint chrême »*. ",
               phonetic: "krÈm",
               profanityLevel: 0,
               frequency: 0,
               origin: "Du @chrême_origin.",
               example: ["**Interjection :** Dis-moi pas que Guillaume Lemay-Thivierge a encore dire des niaiseries, saint chrême!"]),
    
    Expression(text: "christ",
               type: .blasphemyOrigin,
               definition: "Nom donné à Jésus par les chrétiens.",
               phonetic: "krist",
               profanityLevel: 0,
               frequency: 0,
               origin: "Du latin *Christus*.",
               example: ["**Nom :** Sa famille était vraiment très très religieuse. Genre, ils avaient un christ crucifié grandeur nature au sous-sol. Assez malaisant. "]),
    
    Expression(text: "crisse",
               type: .blasphemy,
               definition: "",
               phonetic: "kris",
               profanityLevel: 8,
               frequency: 10,
               origin: "De @christ_origin.",
               euphemism: ["crime"],
               example: ["**Interjection :**  Crisse que t'es belle!", "**Adverbe :** T'as crissement pas rapport, ostie d'épais.", "**Verbe :** Il était en échappée et il l'a crissé *top net*.", "**Verbe :** Tout ce que tu racontes avec tes histoires de pro-vie, je m'en contre-crisse."]),
    
    Expression(text: "crime",
               type: .blasphemyEuphemism,
               definition: "Juron plutôt inoffensif.",
               phonetic: "kristi",
               profanityLevel: 4,
               frequency: 10,
               origin: "Abrégé de @sacristie_origin.",
               example: ["**Interjection : ** Il est tellement cave. Crime que c'est pas une lumière!", "**Interjection : ** L'éclipse m'a rendu aveugle, crime!", "**Adjectif :** Peux-tu juste mettre tes crime de notification à off, svp?!"]),
    
    Expression(text: "christie",
               type: .blasphemyEuphemism,
               definition: "Juron plutôt inoffensif.",
               phonetic: "kristi",
               profanityLevel: 4,
               frequency: 4,
               origin: "Abrégé de @sacristie_origin.",
               example: ["**Interjection : ** Cristi, le gars est parti avec mes gougounes!", "**Adjectif :** On s'est encore fait torcher par le cristi de Lightning!"]),
    
    Expression(text: "cristie",
               type: .blasphemyEuphemism,
               definition: "Juron plutôt inoffensif.",
               phonetic: "kristi",
               profanityLevel: 4,
               frequency: 4,
               origin: "Euphémisme de @christ_origin.",
               example: ["**Interjection : ** Cristi, le gars est parti avec mes gougounes!", "**Adjectif :** On s'est encore fait torcher par le cristi de Lightning!"]),
    
    Expression(text: "diable",
               type: .blasphemyOrigin,
               definition: "Dans le contexte catholique, le diable désigne l'entité spirituelle considérée comme l'ennemi de Dieu et de l'humanité. Il est souvent représenté comme le chef des anges déchus, tentant les êtres humains vers le mal et l'éloignant de la foi chrétienne. Le diable est vu comme l'incarnation du mal et est associé à des symboles tels que les flammes de l'enfer et les représentations démoniaques. En somme, c'est l'antagoniste principal dans la cosmologie catholique, personnifiant le mal et la tentation.",
               phonetic: "djàbl",
               profanityLevel: 0,
               frequency: 0,
               origin: "du latin chrétien *diabolus*, ‘diable’ ; du grec chrétien *diabolos*, ‘Satan’.",
               example: ["**Nom : ** Arrête d'acheter les chocolatines à 600 calories! T'es vraiment le diable!"]),
    
    Expression(text: "diable",
               type: .blasphemy,
               definition: "Juron utilisé sans nécessairement viser à offenser directement les croyances religieuses. Souvent prononcé *yable*. À ne pas confondre avec « que diable » qui est une espèce de synonyme de « diantre ». ",
               phonetic: "djàbl",
               profanityLevel: 2,
               frequency: 6,
               origin: "De @diable_origin.",
               example: ["**Nom :** Crisse que tu sens le diable/yable!",
                         "**Adjectif :**  La défensive des Canadiens est pas yable/diable!"]),
    
    Expression(text: "esprit",
               type: .blasphemyOrigin,
               definition: "Être immatériel ; âme",
               phonetic: "èspri",
               profanityLevel: 0,
               frequency: 0,
               origin: "Du latin *spiritus*, ‘souffle’.",
               example: ["**Interjection :** ", "**Nom :** ", "**Adjectif :** ", "**Adverbe :**", "**Verbe :** "]),
    
    Expression(text: "esprit",
               type: .blasphemy,
               definition: "Juron assez inoffensif. Souvent utilisé pour remplacer hostie.",
               phonetic: "èspri",
               profanityLevel: 3,
               frequency: 3,
               origin: "De @esprit_origin.",
               example: ["**Interjection :** Esprit que j'ai fait le saut!"]),
    
    Expression(text: "étole",
               type: .blasphemyOrigin,
               definition: "Ornement liturgique constitué d’une bande d’étoffe que l’évêque, le prêtre et le diacre portent autour du cou.",
               phonetic: "étòl",
               profanityLevel: 0,
               frequency: 0,
               origin: "Du latin *stola*, ‘bande d’étoffe liturgique‘.",
               example: ["Je t'ai acheté une belle étole. Ce sera merveilleux sur ton kit de gala."]),
    
    Expression(text: "étole",
               type: .blasphemy,
               definition: "Juron inoffensif.",
               phonetic: "étòl",
               profanityLevel: 3,
               frequency: 1,
               origin: "De @étole_origin.",
               example: ["**Interjection: ** Étole, veux-tu bien me dire ce que t'as fait?!"]),
    
    Expression(text: "hostie",
               type: .blasphemyOrigin,
               definition: """
               Dans la tradition catholique, une hostie est une fine tranche de pain azyme consacrée pendant la messe, censée devenir le corps du Christ lors de la communion. Elle est souvent placée sur un plateau ou dans un ciboire et distribuée aux fidèles pendant la liturgie eucharistique.
               """,
               phonetic: "òsti",
               profanityLevel: 9,
               frequency: 10,
               origin: "Du latin *hostia*, 'victime sacrifiée', soulignant le lien entre l'eucharistie et le sacrifice du Christ sur la croix",
               example: ["**Interjection :** ", "**Nom :** ", "**Adjectif :** ", "**Adverbe :**", "**Verbe :** "]),
    
    Expression(text: "hostie",
               type: .blasphemy,
               definition: "Juron grossier",
               phonetic: "òsti",
               profanityLevel: 9,
               frequency: 10,
               origin: "De @hostie_origin.",
               euphemism: ["hosto",
                           "osto",
                           "estique",
                           "estifi"],
               example: ["**Interjection :** ",
                         "**Nom :** ",
                         "**Adjectif :** "]),
    
    Expression(text: "ostie",
               type: .blasphemy,
               definition: "Juron grossier",
               phonetic: "òsti",
               profanityLevel: 9,
               frequency: 10,
               origin: "De @hostie_origin.",
               euphemism: ["hosto",
                           "osto"],
               example: ["**Interjection :** ", "**Nom :** ", "**Adjectif :** Je me suis fait courir après par un ostie de gros taon."]),
    
    Expression(text: "estie",
               type: .blasphemy,
               definition: "Juron grossier",
               phonetic: "èsti",
               profanityLevel: 9,
               frequency: 10,
               origin: "De @hostie_origin.",
               euphemism: ["estique",
                           "estifi"],
               example: ["**Interjection :** Pas encore Maxime Bernier, estie!", 
                         "**Nom :** Sti qu'il m'a refilé une ITS, cet estie-là.",
                         "**Adjectif :** Mêle-toi de tes estie d'affaires!"]),
    
    Expression(text: "stie",
               type: .blasphemy,
               definition: "Juron grossier",
               phonetic: "sti",
               profanityLevel: 8,
               frequency: 10,
               origin: "De @hostie_origin.",
               example: ["**Interjection :** Sti qu'il m'a refilé une ITS, cet estie-là.", 
                         "**Nom :** ",
                         "**Adjectif :** "]),
    
    Expression(text: "jériboire",
               type: .blasphemy,
               definition: "Juron.",
               phonetic: "Zéribwàr",
               profanityLevel: 5,
               frequency: 3,
               origin: "Possiblement une fusion de la ville de Jérusalem et du juron @ciboire_origin",
               example: ["**Interjection :** ", "**Nom :** ", "**Adjectif :** "]),
    
    
    Expression(text: "maudit",
               type: .blasphemyOrigin,
               definition: """
                Adjectif chargé d'émotion, utilisé pour décrire quelque chose ou quelqu'un qui est condamné ou en proie à une malédiction. Le terme est souvent associé à des événements malheureux, des circonstances désespérées ou des personnes considérées comme méchantes ou détestables. Il peut également être utilisé comme une exclamation de frustration ou d'exaspération.
               """,
               phonetic: "modi",
               profanityLevel: 0,
               frequency: 0,
               origin: "Du latin chrétien *maledicere*, ‘maudire’.",
               example: ["**Interjection :**", "**Adverbe :**"]),
    
    Expression(text: "sacristie",
               type: .blasphemyOrigin,
               definition: """
               Dans le contexte religieux chrétien, une sacristie est une pièce adjacente à une église ou une autre structure religieuse, généralement réservée à la préparation des cérémonies liturgiques et au rangement des objets liturgiques. La sacristie est souvent utilisée par les membres du clergé pour se préparer avant une messe ou d'autres services religieux, et elle abrite souvent les vêtements liturgiques, les ornements sacrés, les calices, les ciboires et autres objets utilisés lors des cérémonies.
               """,
               phonetic: "sakristi",
               profanityLevel: 0,
               frequency: 0,
               origin: "Du latin *sacristia*.",
               euphemism: ["cristie"],
               example: ["**Interjection :** ", "**Nom :** ", "**Adjectif :** ", "**Adverbe :**", "**Verbe :** "]),
    
    Expression(text: "sapristi",
               type: .blasphemy,
               definition: "Juron inoffensif.",
               phonetic: "sapristi",
               profanityLevel: 2,
               frequency: 4,
               origin: "De @sacristie_origin.",
               example: ["**Interjection :** Sapristi! Tu m'as arraché le prépuce!"]),
    
    Expression(text: "sacre",
               type: .blasphemyOrigin,
               definition: """
               Acte solennel ou une cérémonie religieuse au cours de laquelle une personne est consacrée à une fonction religieuse, telle que l'ordination d'un prêtre ou l'intronisation d'un monarque. Il implique souvent des gestes symboliques, des prières et des bénédictions spéciales.
               """,
               phonetic: "sakr",
               profanityLevel: 0,
               frequency: 0,
               origin: "",
               example: ["**Interjection :** ", "**Nom :** ", "**Adjectif :** ", "**Adverbe :**", "**Verbe :** "]),
    
    Expression(text: "sacre",
               type: .blasphemy,
               definition: """
               Dans un sens plus profane, le terme « sacre » est parfois utilisé comme un juron ou une expression de surprise ou de frustration.
               """,
               phonetic: "sakr",
               profanityLevel: 0,
               frequency: 0,
               origin: "De @sacre_origin.",
               example: ["**Interjection :** Sacre, tu y es pas allé avec le dos de la main morte!"]),
    
    Expression(text: "sacrement",
               type: .blasphemyOrigin,
               definition: """
               Dans le contexte religieux, un sacrement est un acte ou un rituel considéré comme saint et sacré dans certaines traditions religieuses, particulièrement dans le christianisme. Les sacrements sont souvent perçus comme des signes visibles de la grâce divine et sont censés apporter des bénédictions spirituelles à ceux qui les reçoivent. Dans l'Église catholique, les sept sacrements sont le baptême, la confirmation, l'Eucharistie (communion), la pénitence (confession), l'extrême-onction (sacrement des malades), l'ordination (sacrement du sacerdoce) et le mariage.
               """,
               phonetic: "sakremâ",
               profanityLevel: 0,
               frequency: 0,
               origin: "",
               example: ["En sixième année, on m'a forcé à faire mon sacrement du pardon."]),
    
    Expression(text: "sacrament",
               type: .blasphemy,
               definition: "Juron.",
               phonetic: "sakramâ",
               profanityLevel: 8,
               frequency: 9,
               origin: "De @sacrement_origin.",
               euphemism: [""],
               example: ["**Interjection :** Sacrament, Ginette!"]),
    
    Expression(text: "sacramouille",
               type: .blasphemyEuphemism,
               definition: "Juron popularisé par Benoit Dutrizac manifestant la colère ou le mécontentement.",
               phonetic: "sakʁamuj",
               profanityLevel: 8,
               frequency: 2,
               origin: "De @sacrement.",
               example: ["**Interjection :** Aucun ministre est redevable de rien, sacramouille!"]),
    
    Expression(text: "sacrifice",
               type: .blasphemyOrigin,
               definition: """
                Dans le contexte catholique, le sacrifice est un concept central qui fait référence à l'offrande du Christ sur la croix pour le salut de l'humanité. La messe catholique est considérée comme la répétition sacramentelle de ce sacrifice, où le pain et le vin deviennent le corps et le sang du Christ, offerts en mémoire de son sacrifice ultime. Les fidèles sont également encouragés à offrir leurs propres sacrifices, que ce soit par des prières, des actes de charité ou des renoncements personnels, en union avec le sacrifice du Christ pour le bien de l'Église et du monde.
                """,
               phonetic: "sakrifis",
               profanityLevel: 0,
               frequency: 0,
               origin: "Du latin *sacrificium*.",
               example: ["**Interjection :** "]),
    
    Expression(text: "sacréfice",
               type: .blasphemyEuphemism,
               definition: "Juron utilisé pour exprimer une forte émotion ou frustration. C'est une façon colorée d'exprimer une émotion intense ou un désaccord.",
               phonetic: "sakréfis",
               profanityLevel: 4,
               frequency: 4,
               origin: "De @sacrifice_origin",
               example: ["**Interjection :** Quelqu'un a fait caca dans mes culottes, sacréfice!"]),
    
    Expression(text: "sacrafâsse",
               type: .blasphemyEuphemism,
               definition: "Juron plutôt inoffensif.",
               phonetic: "sakréfis",
               profanityLevel: 4,
               frequency: 1,
               origin: "Euphémisme de  @sacréfice.",
               example: ["**Interjection :** "]),
    
    Expression(text: "saint",
               type: .blasphemyOrigin,
               definition: """
En termes religieux, « saint » désigne une personne reconnue pour sa sainteté et sa piété exceptionnelles, souvent canonisée par une église ou une religion pour ses vertus et ses actes de dévotion. Les saints sont souvent vénérés et considérés comme des intercesseurs auprès de Dieu dans de nombreuses traditions religieuses, notamment dans le christianisme.
L'adjectif "saint" peut également être utilisé pour décrire quelque chose de sacré, de divin ou de consacré à Dieu, comme dans l'expression "lieu saint" désignant un endroit considéré comme sacré dans une religion.
""",
               phonetic: "sê",
               profanityLevel: 0,
               frequency: 0,
               origin: "Du latin *sanctus*, ‘consacré’.",
               example: ["**Interjection :** ", "**Nom :** ", "**Adjectif :** ", "**Adverbe :**", "**Verbe :** "]),
    
    Expression(text: "tabernacle",
               type: .blasphemyOrigin,
               definition: "Dans le contexte religieux catholique, un tabernacle désigne un meuble sacré, généralement placé sur l'autel, utilisé pour abriter et conserver les hosties consacrées, qui sont censées représenter le corps du Christ dans la foi catholique.",
               phonetic: "tabèrnakl",
               profanityLevel: 0,
               frequency: 0,
               origin: "Du latin *tabernaculum*, ‘tente‘.",
               example: ["**Nom :** Il parait qu'ils ont retrouvé une VHS avec plein de vidéos de petits garçons dans le tabernacle."]),
    
    Expression(text: "tabarnak",
               type: .blasphemy,
               definition: "Juron grossier.",
               phonetic: "tabarnak",
               profanityLevel: 10,
               frequency: 9,
               origin: "De @tabernacle_origin.",
               euphemism: ["tabarouette",
                           "tabarnique",
                            "tabarnouche"],
               example: ["**Interjection :** Lâche ma manette, tabarnak!",
                         "**Nom :** C'est le fameux soir où j'ai dévoré le gros tabarnak à trente piastres!",
                         "**Verbe :** Sans farce, je m'en tabarnak tellement de tes histoires de crossfit!"]),
    
    Expression(text: "tabarouette",
               type: .blasphemyEuphemism,
               definition: "Juron inoffensif, voire enfantin.",
               phonetic: "tabarwèt",
               profanityLevel: 2,
               frequency: 6,
               origin: "Euphémisme de @tabarnak.",
               example: ["**Interjection :** Tabarouette, est-ce qu'on peut se calmer sur le Elton John en boucle?", 
                         "**Nom :** Il a remis sa maudite playlist poche, le tabarouette.",
                         "**Adjectif :** On s'entend que son ex est un tabarouette de champion."]),
    
    Expression(text: "tabarnique",
               type: .blasphemyEuphemism,
               definition: "Juron.",
               phonetic: "tabarnik",
               profanityLevel: 3,
               frequency: 3,
               origin: "Euphémisme de @tabarnak.",
               example: ["**Interjection :** Quand le soleil s'est couché, il y avait du maringouin en tabarnik!", 
                         "**Nom :** Il arrive toujours à sept heure du matin, le tabarnik.",
                         "**Adjectif :** Avec la piscine pis le gros parasol, vous êtes rendus avec une tabarnik de belle cour!"]),
    
    Expression(text: "tabarnouche",
               type: .blasphemyEuphemism,
               definition: "Juron inoffensif, voire enfantin.",
               phonetic: "tabarnuS",
               profanityLevel: 2,
               frequency: 7,
               origin: "Euphémisme de @tabarnak.",
               example: ["**Interjection :** Je cherche encore mon cell, tabarnouche!",
                         "**Nom :** Tu me bats toujours aux cartes, ma petite tabarnouche!",
                         "**Verbe :** Je l'ai tabarnouché au bout de mes bras!"]),
    
    Expression(text: "torrieu",
               type: .blasphemy,
               definition: "Juron inoffensif.",
               phonetic: "tòrjö",
               profanityLevel: 4,
               frequency: 5,
               origin: "Possiblement de `tort à dieu`.",
               example: ["**Interjection :** Je vais être un peu direct, mais ta tuque est laide en torrieu!",
                         "**Nom :** Ça fait trois beignes qu'il me vole, le torrieu!",
                         "**Adjectif : Je vous souhaite une torrieuse de belle Saint-Jean!** "]),
    
    Expression(text: "vierge",
               type: .blasphemyOrigin,
               definition: """
                Terme aux significations multiples, souvent associé à l'idée de pureté, d'innocence ou de virginité. Dans un contexte religieux, il peut faire référence à Marie, la mère de Jésus, souvent appelée la Vierge Marie ou la Sainte Vierge en raison de sa conception virginale selon la tradition chrétienne. Le terme peut également être utilisé pour décrire une personne qui n'a pas encore eu de relations sexuelles. Au-delà de sa connotation sexuelle, le mot vierge peut aussi être utilisé pour décrire quelque chose d'inexploré, de non altéré ou de non contaminé.
                """,
               phonetic: "vjèrZ",
               profanityLevel: 0,
               frequency: 0,
               origin: "Du latin *virgo*, ‘fille vierge‘.",
               example: ["**Adjectif :** Selon les règles de sa religion archaïque, la femme doit encore être vierge pour se marier. Avec l'hymen pis toute!",
                         "**Nom :** Dans mes grosses années au cégep, disons que je n'étais pas une Sainte Vierge."]),
    
    Expression(text: "viarge",
               type: .blasphemy,
               definition: "Juron.",
               phonetic: "vjarZ",
               profanityLevel: 5,
               frequency: 6,
               origin: "De @vierge_origin.",
               example: ["**Interjection :** Viarge que ta poignée de main feel comme une truite!", 
                         "**Nom :** Il aurait pu mettre son crisse de clignotant, bout de viarge!"]),
    
]
