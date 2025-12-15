// lib/data/mock_database.dart

import '../models/team_model.dart';
import '../models/city_model.dart';
import '../models/place_model.dart';


final List<Team> mockTeams = [
  // === GROUPE A ===
  Team(
    id: 'ma',
    name: 'Morocco',
    flagPath: 'assets/flags/maroc.png',
    group: 'A',
    titles: 1,
    starPlayer: 'Achraf Hakimi',
  ),
  Team(
    id: 'ml',
    name: 'Mali',
    flagPath: 'assets/flags/ml.png',
    group: 'A',
    titles: 0,
    starPlayer: 'Yves Bissouma',
  ),
  Team(
    id: 'zm',
    name: 'Zambia',
    flagPath: 'assets/flags/zm.png',
    group: 'A',
    titles: 1,
    starPlayer: 'Patson Daka',
  ),
  Team(
    id: 'km',
    name: 'Comoros',
    flagPath: 'assets/flags/km.png',
    group: 'A',
    titles: 0,
    starPlayer: "Youssouf M'Changama",
  ),

  // === GROUPE B ===
  Team(
    id: 'eg',
    name: 'Egypt',
    flagPath: 'assets/flags/eg.png',
    group: 'B',
    titles: 7,
    starPlayer: 'Mohamed Salah',
  ),
  Team(
    id: 'za',
    name: 'South Africa',
    flagPath: 'assets/flags/za.png',
    group: 'B',
    titles: 1,
    starPlayer: 'Percy Tau',
  ),
  Team(
    id: 'ao',
    name: 'Angola',
    flagPath: 'assets/flags/ao.png',
    group: 'B',
    titles: 0,
    starPlayer: 'Gelson Dala',
  ),
  Team(
    id: 'zw',
    name: 'Zimbabwe',
    flagPath: 'assets/flags/zw.png',
    group: 'B',
    titles: 0,
    starPlayer: 'Tino Kadewere',
  ),

  // === GROUPE C ===
  Team(
    id: 'ng',
    name: 'Nigeria',
    flagPath: 'assets/flags/ng.png',
    group: 'C',
    titles: 3,
    starPlayer: 'Victor Osimhen',
  ),
  Team(
    id: 'tn',
    name: 'Tunisia',
    flagPath: 'assets/flags/tn.png',
    group: 'C',
    titles: 1,
    starPlayer: 'Ellyes Skhiri',
  ),
  Team(
    id: 'ug',
    name: 'Uganda',
    flagPath: 'assets/flags/ug.png',
    group: 'C',
    titles: 0,
    starPlayer: 'Fahad Bayo',
  ),
  Team(
    id: 'tz',
    name: 'Tanzania',
    flagPath: 'assets/flags/tz.png',
    group: 'C',
    titles: 0,
    starPlayer: 'Mbwana Samatta',
  ),

  // === GROUPE D ===
  Team(
    id: 'sn',
    name: 'Senegal',
    flagPath: 'assets/flags/sn.png',
    group: 'D',
    titles: 1,
    starPlayer: 'Sadio Mané',
  ),
  Team(
    id: 'cd',
    name: 'DR Congo',
    flagPath: 'assets/flags/cd.png',
    group: 'D',
    titles: 2,
    starPlayer: 'Yoane Wissa',
  ),
  Team(
    id: 'bj',
    name: 'Benin',
    flagPath: 'assets/flags/bj.png',
    group: 'D',
    titles: 0,
    starPlayer: 'Steve Mounié',
  ), // Assure-toi d'avoir benin.png ou change le nom
  Team(
    id: 'bw',
    name: 'Botswana',
    flagPath: 'assets/flags/bw.png',
    group: 'D',
    titles: 0,
    starPlayer: 'Thatayaone Kgamanyane',
  ), // Idem pour botswana.png
  // === GROUPE E ===
  Team(
    id: 'dz',
    name: 'Algeria',
    flagPath: 'assets/flags/dz.png',
    group: 'E',
    titles: 2,
    starPlayer: 'Riyad Mahrez',
  ),
  Team(
    id: 'bf',
    name: 'Burkina Faso',
    flagPath: 'assets/flags/bf.png',
    group: 'E',
    titles: 0,
    starPlayer: 'Edmond Tapsoba',
  ),
  Team(
    id: 'gq',
    name: 'Eq. Guinea',
    flagPath: 'assets/flags/gq.png',
    group: 'E',
    titles: 0,
    starPlayer: 'Emilio Nsue',
  ),
  Team(
    id: 'sd',
    name: 'Sudan',
    flagPath: 'assets/flags/sd.png',
    group: 'E',
    titles: 1,
    starPlayer: 'Waleed Bakhet',
  ), // Idem pour soudan.png
  // === GROUPE F ===
  Team(
    id: 'ci',
    name: 'Ivory Coast',
    flagPath: 'assets/flags/ci.png',
    group: 'F',
    titles: 3,
    starPlayer: 'Franck Kessié',
  ),
  Team(
    id: 'cm',
    name: 'Cameroon',
    flagPath: 'assets/flags/cm.png',
    group: 'F',
    titles: 5,
    starPlayer: 'André Onana',
  ),
  Team(
    id: 'ga',
    name: 'Gabon',
    flagPath: 'assets/flags/ga.png',
    group: 'F',
    titles: 0,
    starPlayer: 'Aubameyang',
  ),
  Team(
    id: 'mz',
    name: 'Mozambique',
    flagPath: 'assets/flags/mz.png',
    group: 'F',
    titles: 0,
    starPlayer: 'Reinildo Mandava',
  ),
];



final List<City> mockCities = [
  // TANGER 
  City(
    id: 'tng',
    name: 'Tanger',
    imagePath: 'assets/places/tanger.jpg',
    stadiumName: 'Grand Stade de Tanger (Ibn Batouta)',
    stadiumImage: 'assets/stadiums/Le-Grand-Stade-de-FIFA-2030.jpg',
    stadiumDescription:
        "Inauguré en 2011, d'une capacité de 65 000 places, c'est l'un des plus grands stades du Maroc. Il est situé au sud-ouest de la ville, facilement accessible via l'autoroute et proche de l'aéroport. Prévoyez d'arriver au moins 2h avant le match.",
    stadiumMapUrl: "https://goo.gl/maps/LienStadeTanger",
    
  hotels: [
    Place(id: 'h_tng_1', name: 'Hilton Tanger City Center', type: PlaceType.hotel, imagePath: 'assets/places/h_tng_1.jpg', description: 'Luxury hotel with panoramic views over the bay.', locationInfo: 'Route Malabata', rating: 4.6, phoneNumber: "+212539309000", mapUrl: "https://goo.gl/maps/HiltonTanger"),
    Place(id: 'h_tng_2', name: 'Royal Tulip City Center', type: PlaceType.hotel, imagePath: 'assets/places/h_tng_2.jpg', description: '5-star hotel near the new business district.', locationInfo: 'Avenue Mohammed VI', rating: 4.5, phoneNumber: "+212539309999", mapUrl: "https://goo.gl/maps/RoyalTulipTanger"),
    Place(id: 'h_tng_3', name: 'Mövenpick Hotel & Casino Malabata', type: PlaceType.hotel, imagePath: 'assets/places/h_tng_3.jpg', description: 'Hotel with private beach and Mediterranean views.', locationInfo: 'Avenue Mohamed VI', rating: 4.4, phoneNumber: "+212539329300", mapUrl: "https://goo.gl/maps/MovenpickTanger"),
    Place(id: 'h_tng_4', name: 'Barceló Tanger', type: PlaceType.hotel, imagePath: 'assets/places/h_tng_4.jpg', description: 'Modern hotel overlooking the port and the bay.', locationInfo: 'Avenue Mohamed VI', rating: 4.3, phoneNumber: "+212539948000", mapUrl: "https://goo.gl/maps/BarceloTanger"),
    Place(id: 'h_tng_5', name: 'Marina Bay Tanger', type: PlaceType.hotel, imagePath: 'assets/places/h_tng_5.jpg', description: 'Charming boutique hotel near Marina Bay.', locationInfo: 'Avenue Mohammed VI', rating: 4.4, phoneNumber: "+212539333111", mapUrl: "https://goo.gl/maps/MarinaBayTanger"),
  ],

  restaurants: [
    Place(id: 'r_tng_1', name: 'Restaurant El Tangerino', type: PlaceType.restaurant, imagePath: 'assets/places/r_tng_1.jpg', description: 'Seafood restaurant facing the Mediterranean.', locationInfo: 'Avenue Mohamed VI', rating: 4.5, phoneNumber: "+212539320303", mapUrl: "https://goo.gl/maps/ElTangerino"),
    Place(id: 'r_tng_2', name: 'Le Saveur du Poisson', type: PlaceType.restaurant, imagePath: 'assets/places/r_tng_2.jpg', description: 'Legendary small restaurant famous for its fish menu.', locationInfo: 'Rue de la Liberté', rating: 4.7, phoneNumber: "+212539333333", mapUrl: "https://goo.gl/maps/SaveurPoisson"),
    Place(id: 'r_tng_3', name: 'Anna & Paolo', type: PlaceType.restaurant, imagePath: 'assets/places/r_tng_3.jpg', description: 'Italian restaurant with a cozy ambiance.', locationInfo: 'Avenue Youssef Ben Tachfine', rating: 4.5, phoneNumber: "+212539380658", mapUrl: "https://goo.gl/maps/AnnaPaolo"),
    Place(id: 'r_tng_4', name: 'Le Mirage', type: PlaceType.restaurant, imagePath: 'assets/places/r_tng_4.jpg', description: 'Luxury restaurant on top of cliffs facing the ocean.', locationInfo: 'Route des Grottes d’Hercule', rating: 4.6, phoneNumber: "+212539935000", mapUrl: "https://goo.gl/maps/LeMirageTanger"),
    Place(id: 'r_tng_5', name: 'Café Hafa', type: PlaceType.restaurant, imagePath: 'assets/places/r_tng_5.jpg', description: 'Historic café with unbeatable views of the Strait of Gibraltar.', locationInfo: 'Marshan, Tanger', rating: 4.3, phoneNumber: "+212539933106", mapUrl: "https://goo.gl/maps/CafeHafa"),
  ],

  attractions: [
    Place(id: 'a_tng_1', name: 'Cap Spartel', type: PlaceType.attraction, imagePath: 'assets/places/a_tng_1.jpg', description: 'Cape where the Atlantic meets the Mediterranean.', locationInfo: 'Cap Spartel, Tanger', rating: 4.8, mapUrl: "https://goo.gl/maps/CapSpartel"),
    Place(id: 'a_tng_2', name: 'Hercules Caves', type: PlaceType.attraction, imagePath: 'assets/places/a_tng_2.jpg', description: 'Ancient caves overlooking the ocean.', locationInfo: 'Route Achakar', rating: 4.7, mapUrl: "https://goo.gl/maps/HerculesCaves"),
    Place(id: 'a_tng_3', name: 'Tanger Medina', type: PlaceType.attraction, imagePath: 'assets/places/a_tng_3.jpg', description: 'Old Medina with shops, cafés, and local crafts.', locationInfo: 'Medina, Tanger', rating: 4.6, mapUrl: "https://goo.gl/maps/MedinaTanger"),
    Place(id: 'a_tng_4', name: 'Marina Bay Tanger', type: PlaceType.attraction, imagePath: 'assets/places/a_tng_4.jpg', description: 'Modern marina with cafés and luxurious yachts.', locationInfo: 'Avenue Mohammed VI', rating: 4.7, mapUrl: "https://goo.gl/maps/MarinaTanger"),
    Place(id: 'a_tng_5', name: 'Kasbah Museum', type: PlaceType.attraction, imagePath: 'assets/places/a_tng_5.jpg', description: 'Historic palace showcasing art and artifacts.', locationInfo: 'Kasbah, Tanger', rating: 4.6, mapUrl: "https://goo.gl/maps/KasbahMuseum"),
  ],
  transports : [
  Place(
    id: 't_tan_1',
    name: 'Ibn Batouta Airport',
    type: PlaceType.transport,
    imagePath: 'assets/places/tanger_airport.jpg', // Trouve une image d'avion/aéroport
    description: 'International airport serving Tangier. Located 10km from the city center.',
    locationInfo: 'Route de l\'Aéroport, Tanger',
    rating: 4.2,
    phoneNumber: "+212539393720",
    mapUrl: "https://goo.gl/maps/TangerAirport",
  ),
  Place(
    id: 't_tan_2',
    name: 'TGV Station (Al Boraq)',
    type: PlaceType.transport,
    imagePath: 'assets/places/tanger_gare.jpg', // Trouve une image de train
    description: 'High-speed train station connecting Tangier to Casablanca in 2 hours.',
    locationInfo: 'Place de la Ligue Arabe, Tanger',
    rating: 4.8,
    mapUrl: "https://goo.gl/maps/TangerVilleStation",
  ),
  Place(
    id: 't_tan_3',
    name: 'Careem / Petit Taxi',
    type: PlaceType.transport,
    imagePath: 'assets/places/tanger_taxi.jpg',
    description: 'Blue petit taxis are the best way to move around. Careem app is also available.',
    locationInfo: 'Available everywhere in the city',
    rating: 4.0,
  ),
],
  ),
//  RABAT
  City(
    id: 'rab',
    name: 'Rabat',
    imagePath: 'assets/cities/rabat.png',
    stadiumName: 'Complexe Prince Moulay Abdellah',
    stadiumImage: 'assets/stadiums/Complexe-Moulay-Abdellah.png',
    stadiumDescription:
        "The capital's stadium, rich in history and recently renovated to meet international standards for AFCON 2025.",
    stadiumMapUrl: "https://goo.gl/maps/StadeRabat",

    hotels: [
      Place(
        id: 'h_rab_1',
        name: 'Sofitel Rabat Jardin des Roses',
        type: PlaceType.hotel,
        imagePath: 'assets/places/Sofitel_Rabat.png',
        description:
            'A palace in the heart of the capital surrounded by Andalusian gardens.',
        locationInfo: 'Impasse Souissi, Rabat',
        rating: 4.7,
        phoneNumber: "+212537675656",
        mapUrl: "https://goo.gl/maps/SofitelRabat",
      ),
      Place(
        id: 'h_rab_2',
        name: 'La Tour Hassan Palace',
        type: PlaceType.hotel,
        imagePath: 'assets/places/Hassan_Palace.png',
        description:
            'A tribute to Moorish architecture, offering luxury and tradition.',
        locationInfo: '26 Rue Chellah, Rabat',
        rating: 4.6,
        phoneNumber: "+212537239000",
        mapUrl: "https://goo.gl/maps/TourHassanHotel",
      ),
      Place(
        id: 'h_rab_3',
        name: 'Hotel Rabat',
        type: PlaceType.hotel,
        imagePath: 'assets/places/HotelRabat.png',
        description: 'Modern hotel located in the administrative district.',
        locationInfo: '21 Avenue Chellah, Rabat',
        rating: 4.2,
        phoneNumber: "+212537201226",
        mapUrl: "https://goo.gl/maps/HotelRabat",
      ),
      Place(
        id: 'h_rab_4',
        name: 'ONOMO Hotel Rabat Terminus',
        type: PlaceType.hotel,
        imagePath: 'assets/places/ONOMO_Hotel.png',
        description: 'A stylish hotel near the train station with city views.',
        locationInfo: 'Avenue Mohamed V, Rabat',
        rating: 4.3,
        phoneNumber: "+212537703030",
        mapUrl: "https://goo.gl/maps/OnomoRabat",
      ),
      Place(
        id: 'h_rab_5',
        name: 'The View Hotel Rabat',
        type: PlaceType.hotel,
        imagePath: 'assets/places/TheView_Hotel.png',
        description: 'Luxury tower hotel offering panoramic views of Rabat.',
        locationInfo: 'Avenue Annakhil, Hay Riad',
        rating: 4.7,
        phoneNumber: "+212538008000",
        mapUrl: "https://goo.gl/maps/TheViewRabat",
      ),
    ],

    restaurants: [
      Place(
        id: 'r_rab_1',
        name: 'Dar Naji',
        type: PlaceType.restaurant,
        imagePath: 'assets/places/rabat_resto1.jpg',
        description: 'Traditional Moroccan cuisine in an authentic setting.',
        locationInfo: 'Avenue Jazirat Al Arab, Rabat',
        rating: 4.5,
        phoneNumber: "+212537727272",
        mapUrl: "https://goo.gl/maps/DarNaji",
      ),
      Place(
        id: 'r_rab_2',
        name: 'Le Dhow',
        type: PlaceType.restaurant,
        imagePath: 'assets/places/Le_Dhow.png',
        description: 'Dining experience on a boat on the Bouregreg river.',
        locationInfo: 'Quai de Bouregreg, Rabat',
        rating: 4.4,
        phoneNumber: "+212537702302",
        mapUrl: "https://goo.gl/maps/LeDhow",
      ),
      Place(
        id: 'r_rab_3',
        name: 'Le Petit Beur',
        type: PlaceType.restaurant,
        imagePath: 'assets/places/Petit_Beur.png',
        description: 'Popular traditional restaurant with live music.',
        locationInfo: 'Rue de Tunis, Rabat',
        rating: 4.5,
        phoneNumber: "+212537708070",
        mapUrl: "https://goo.gl/maps/LePetitBeur",
      ),
      Place(
        id: 'r_rab_4',
        name: 'Ty Potes',
        type: PlaceType.restaurant,
        imagePath: 'assets/places/Ty_Potes.png',
        description: 'French-style bistro highly appreciated by locals.',
        locationInfo: 'Avenue Fal Ould Oumeir',
        rating: 4.4,
        phoneNumber: "+212537682232",
        mapUrl: "https://goo.gl/maps/TyPotes",
      ),
      Place(
        id: 'r_rab_5',
        name: 'Il Giardino',
        type: PlaceType.restaurant,
        imagePath: 'assets/places/Giardino.png',
        description: 'One of the best Italian restaurants in the capital.',
        locationInfo: 'Avenue Mehdi Ben Barka',
        rating: 4.6,
        phoneNumber: "+212537650404",
        mapUrl: "https://goo.gl/maps/IlGiardinoRabat",
      ),
    ],

    attractions: [
      Place(
        id: 'a_rab_1',
        name: 'Hassan Tower',
        type: PlaceType.attraction,
        imagePath: 'assets/places/Hassan_Tower.png',
        description: 'Symbol of Rabat.',
        locationInfo: 'Boulevard Mohamed Lyazidi, Rabat',
        rating: 4.7,
        mapUrl: "https://goo.gl/maps/HassanTower",
      ),
      Place(
        id: 'a_rab_2',
        name: 'Kasbah of the Udayas',
        type: PlaceType.attraction,
        imagePath: 'assets/places/Kasbah_Udayas.png',
        description: 'Blue-and-white fortress with ocean views.',
        locationInfo: 'Rabat Medina',
        rating: 4.8,
        mapUrl: "https://goo.gl/maps/KasbahUdayas",
      ),
      Place(
        id: 'a_rab_3',
        name: 'Chellah Necropolis',
        type: PlaceType.attraction,
        imagePath: 'assets/places/Chellah_Necropolis.png',
        description: 'Ancient Roman ruins and gardens.',
        locationInfo: 'Rabat-Salé',
        rating: 4.7,
        mapUrl: "https://goo.gl/maps/Chellah",
      ),
      Place(
        id: 'a_rab_4',
        name: 'Mohammed VI Museum of Modern Art',
        type: PlaceType.attraction,
        imagePath: 'assets/places/Mohammed_Museum_Modern_Art.png',
        description: 'Modern arts museum with permanent collections.',
        locationInfo: 'Avenue Moulay Hassan',
        rating: 4.6,
        mapUrl: "https://goo.gl/maps/MMVIRabat",
      ),
      Place(
        id: 'a_rab_5',
        name: 'Bouregreg Marina',
        type: PlaceType.attraction,
        imagePath: 'assets/places/Bouregreg_Marina.png',
        description: 'Modern marina between Rabat and Salé.',
        locationInfo: 'Bouregreg River',
        rating: 4.7,
        mapUrl: "https://goo.gl/maps/BouregregMarina",
      ),
    ],
transports : [
  Place(
    id: 't_rab_1',
    name: 'Rabat Salé Airport',
    type: PlaceType.transport,
    imagePath: 'assets/places/rabat_airport.jpg',
    description: 'International airport serving Rabat and Salé. 20 minutes from the city center.',
    locationInfo: 'Avenue Ouali Al Had, Salé',
    rating: 4.3,
    phoneNumber: "+212537808656",
    mapUrl: "https://goo.gl/maps/RabatAirport",
  ),
  Place(
    id: 't_rab_2',
    name: 'Rabat Ville Train Station',
    type: PlaceType.transport,
    imagePath: 'assets/places/rabat_train.jpg',
    description: 'Central station connecting Rabat to Casablanca, Tanger, Fès et Marrakech.',
    locationInfo: 'Avenue Mohammed V, Rabat',
    rating: 4.6,
    mapUrl: "https://goo.gl/maps/RabatVilleStation",
  ),
  Place(
    id: 't_rab_3',
    name: 'Tramway Rabat-Salé',
    type: PlaceType.transport,
    imagePath: 'assets/places/rabat_tram.jpg',
    description: 'Modern tramway serving Rabat and Salé. Fast, cheap and clean transport.',
    locationInfo: 'Circulates across Rabat-Salé',
    rating: 4.7,
  ),
],
// CASABLANCA
  ),
  City(
  id: 'cas',
  name: 'Casablanca',
  imagePath: 'assets/cities/casa.jpg',
  stadiumName: 'Stade Mohammed V',
  stadiumImage: 'assets/stadiums/casa.jpg',
  stadiumDescription:
      "Nicknamed 'The Cauldron', this mythical stadium is the beating heart of Moroccan football and home to Raja and Wydad.",
  stadiumMapUrl: "https://goo.gl/maps/StadeCasa",

  hotels: [
    Place(id: 'h_cas_1', name: 'Four Seasons Casablanca', type: PlaceType.hotel, imagePath: 'assets/places/h_cas_1.jpg', description: 'Oceanfront luxury hotel with premium amenities.', locationInfo: 'Anfa Place, Casablanca', rating: 4.7, phoneNumber: "+212529073700", mapUrl: "https://goo.gl/maps/FourSeasonsCasa"),
    Place(id: 'h_cas_2', name: 'Hyatt Regency Casablanca', type: PlaceType.hotel, imagePath: 'assets/places/h_cas_2.jpg', description: 'Modern 5-star hotel in the city center.', locationInfo: 'Place des Nations Unies, Casablanca', rating: 4.5, phoneNumber: "+212522431234", mapUrl: "https://goo.gl/maps/HyattCasa"),
    Place(id: 'h_cas_3', name: 'Sofitel Casablanca Tour Blanche', type: PlaceType.hotel, imagePath: 'assets/places/h_cas_3.jpg', description: 'Luxury hotel with spa and panoramic views.', locationInfo: 'Rue Sidi Belyout', rating: 4.4, phoneNumber: "+212522456200", mapUrl: "https://goo.gl/maps/SofitelCasa"),
    Place(id: 'h_cas_4', name: 'Mövenpick Casablanca', type: PlaceType.hotel, imagePath: 'assets/places/h_cas_4.jpg.jpg', description: 'Modern hotel located near Casa Port.', locationInfo: 'Rond-Point Zerktouni', rating: 4.3, phoneNumber: "+212522480000", mapUrl: "https://goo.gl/maps/MovenpickCasa"),
    Place(id: 'h_cas_5', name: 'Barcelo Anfa Casablanca', type: PlaceType.hotel, imagePath: 'assets/places/h_cas_5.jpg', description: 'Stylish boutique hotel with Art Deco vibes.', locationInfo: '44 Boulevard d’Anfa', rating: 4.6, phoneNumber: "+212522204242", mapUrl: "https://goo.gl/maps/BarceloCasa"),
  ],

  restaurants: [
    Place(id: 'r_cas_1', name: 'La Sqala', type: PlaceType.restaurant, imagePath: 'assets/places/r_cas_1.jpg', description: 'Traditional Moroccan cuisine in a historic fortress.', locationInfo: 'Boulevard des Almohades', rating: 4.5, phoneNumber: "+212522267321", mapUrl: "https://goo.gl/maps/LaSqala"),
    Place(id: 'r_cas_2', name: 'Le Cabestan', type: PlaceType.restaurant, imagePath: 'assets/places/r_cas_2.jpg', description: 'Iconic seafood restaurant with ocean views.', locationInfo: 'Boulevard de la Corniche', rating: 4.4, phoneNumber: "+212522397499", mapUrl: "https://goo.gl/maps/Cabestan"),
    Place(id: 'r_cas_3', name: 'Rick\'s Café', type: PlaceType.restaurant, imagePath: 'assets/places/r_cas_3.jpg', description: 'Famous Casablanca movie-inspired restaurant.', locationInfo: '248 Boulevard Sour Jdid', rating: 4.6, phoneNumber: "+212522274286", mapUrl: "https://goo.gl/maps/RicksCafe"),
    Place(id: 'r_cas_4', name: 'Oncle Blend', type: PlaceType.restaurant, imagePath: 'assets/places/r_cas_4.jpg', description: 'Best gourmet burgers in Casablanca.', locationInfo: 'Boulevard Anfa', rating: 4.5, phoneNumber: "+212522397760", mapUrl: "https://goo.gl/maps/OncleBlend"),
    Place(id: 'r_cas_5', name: 'Tula Moroccan Restaurant', type: PlaceType.restaurant, imagePath: 'assets/places/r_cas_5.jpg', description: 'Authentic Moroccan dishes with a modern twist.', locationInfo: 'Maarif Casablanca', rating: 4.6, phoneNumber: "+212522225533", mapUrl: "https://goo.gl/maps/TulaCasa"),
  ],

  attractions: [
    Place(id: 'a_cas_1', name: 'Hassan II Mosque', type: PlaceType.attraction, imagePath: 'assets/places/a_cas_1.jpg', description: 'One of the largest mosques in the world.', locationInfo: 'Boulevard Sidi Mohamed Ben Abdellah', rating: 4.8, mapUrl: "https://goo.gl/maps/Hassan2Mosque"),
    Place(id: 'a_cas_2', name: 'Morocco Mall', type: PlaceType.attraction, imagePath: 'assets/places/a_cas_2.jpg', description: 'One of Africa’s biggest malls with an aquarium.', locationInfo: 'Boulevard de la Corniche', rating: 4.7, mapUrl: "https://goo.gl/maps/MoroccoMall"),
    Place(id: 'a_cas_3', name: 'Ain Diab Beach', type: PlaceType.attraction, imagePath: 'assets/places/a_cas_3.jpg', description: 'Popular beach and leisure zone.', locationInfo: 'Corniche Ain Diab', rating: 4.6, mapUrl: "https://goo.gl/maps/AinDiab"),
    Place(id: 'a_cas_4', name: 'Old Medina of Casablanca', type: PlaceType.attraction, imagePath: 'assets/places/a_cas_4.jpg', description: 'Historic district with bazaars and small shops.', locationInfo: 'Near Port of Casablanca', rating: 4.5, mapUrl: "https://goo.gl/maps/OldMedinaCasa"),
    Place(id: 'a_cas_5', name: 'Arab League Park', type: PlaceType.attraction, imagePath: 'assets/places/a_cas_5.jpg', description: 'Large urban park ideal for walking.', locationInfo: 'Boulevard Rachidi', rating: 4.6, mapUrl: "https://goo.gl/maps/ArabLeaguePark"),
  ],

  transports : [
  Place(
    id: 't_casa_1',
    name: 'Mohammed V Airport',
    type: PlaceType.transport,
    imagePath: 'assets/places/casa_airport.jpg',
    description: 'Largest airport in Morocco with international connections worldwide.',
    locationInfo: 'Nouaceur, Casablanca',
    rating: 4.1,
    phoneNumber: "+212522539040",
    mapUrl: "https://goo.gl/maps/CasaAirport",
  ),
  Place(
    id: 't_casa_2',
    name: 'Casa Voyageurs Station',
    type: PlaceType.transport,
    imagePath: 'assets/places/casa_voyageurs.jpg',
    description: 'Main train station including TGV Al Boraq to Tangier.',
    locationInfo: 'Boulevard Bahmad, Casablanca',
    rating: 4.7,
    mapUrl: "https://goo.gl/maps/CasaVoyageurs",
  ),
  Place(
    id: 't_casa_3',
    name: 'Casa Tramway',
    type: PlaceType.transport,
    imagePath: 'assets/places/casa_tram.jpg',
    description: 'Modern tramway connecting the main districts of Casablanca.',
    locationInfo: 'All across the city',
    rating: 4.5,
  ),
],
),

// MARRAKECH

City(
  id: 'mar',
  name: 'Marrakech',
  imagePath: 'assets/cities/marrackch.png',
  stadiumName: 'Grand Stade de Marrakech',
  stadiumImage: 'assets/stadiums/Marrakesh Grand Stadium.jpg',
  stadiumDescription:
      "Inspired by the ramparts of the ochre city, offering a breathtaking view of the Atlas Mountains.",
  stadiumMapUrl: "https://goo.gl/maps/StadeMarrakech",

  hotels: [
    Place(id: 'h_mar_1', name: 'La Mamounia', type: PlaceType.hotel, imagePath: 'assets/places/h_mar_1.jpg', description: 'One of the most luxurious hotels in the world.', locationInfo: 'Avenue Bab Jdid', rating: 4.8, phoneNumber: "+212524388600", mapUrl: "https://goo.gl/maps/LaMamounia"),
    Place(id: 'h_mar_2', name: 'Royal Mansour Marrakech', type: PlaceType.hotel, imagePath: 'assets/places/h_mar_2.jpg', description: 'Ultra-luxury palaces with private riads.', locationInfo: 'Rue Abou Abbas El Sebti', rating: 5.0, phoneNumber: "+212529808080", mapUrl: "https://goo.gl/maps/RoyalMansour"),
    Place(id: 'h_mar_3', name: 'Savoy Le Grand Hotel', type: PlaceType.hotel, imagePath: 'assets/places/h_mar_3.jpg', description: 'Large resort near M Avenue.', locationInfo: 'Avenue de la Ménara', rating: 4.5, phoneNumber: "+212525352000", mapUrl: "https://goo.gl/maps/SavoyMarrakech"),
    Place(id: 'h_mar_4', name: 'Mövenpick Hotel Mansour Eddahbi', type: PlaceType.hotel, imagePath: 'assets/places/h_mar_4.jpg', description: 'Huge 5-star resort next to the Congress Center.', locationInfo: 'Avenue Mohamed VI', rating: 4.4, phoneNumber: "+212524339100", mapUrl: "https://goo.gl/maps/MovenpickMarrakech"),
    Place(id: 'h_mar_5', name: 'Kenzi Rose Garden', type: PlaceType.hotel, imagePath: 'assets/places/h_mar_5.jpg', description: 'Newly renovated hotel in Hivernage.', locationInfo: 'Avenue du Président Kennedy', rating: 4.3, phoneNumber: "+212524448200", mapUrl: "https://goo.gl/maps/KenziRoseGarden"),
  ],

  restaurants: [
    Place(id: 'r_mar_1', name: 'Nomad', type: PlaceType.restaurant, imagePath: 'assets/places/r_mar_1.jpg', description: 'Trendy rooftop with modern Moroccan cuisine.', locationInfo: 'Rahba Lakdima', rating: 4.6, phoneNumber: "+212524381609", mapUrl: "https://goo.gl/maps/Nomad"),
    Place(id: 'r_mar_2', name: 'Le Jardin', type: PlaceType.restaurant, imagePath: 'assets/places/r_mar_2.jpg', description: 'Green paradise hidden inside the Medina.', locationInfo: '32 Souk El Jeld', rating: 4.5, phoneNumber: "+212524378295", mapUrl: "https://goo.gl/maps/LeJardinMarrakech"),
    Place(id: 'r_mar_3', name: 'Al Fassia', type: PlaceType.restaurant, imagePath: 'assets/places/r_mar_3.jpg', description: 'Legendary restaurant managed by women.', locationInfo: 'Gueliz, Marrakech', rating: 4.7, phoneNumber: "+212524434060", mapUrl: "https://goo.gl/maps/AlFassia"),
    Place(id: 'r_mar_4', name: 'Comptoir Darna', type: PlaceType.restaurant, imagePath: 'assets/places/r_mar_4.jpg', description: 'Dinner-show with Moroccan cuisine.', locationInfo: 'Avenue Echouhada', rating: 4.6, phoneNumber: "+212524377202", mapUrl: "https://goo.gl/maps/ComptoirDarna"),
    Place(id: 'r_mar_5', name: 'BOZIN', type: PlaceType.restaurant, imagePath: 'assets/places/r_mar_5.jpg', description: 'Chic lounge restaurant outside the city.', locationInfo: 'Route de l’Ourika', rating: 4.5, phoneNumber: "+212524388027", mapUrl: "https://goo.gl/maps/BoZin"),
  ],

  attractions: [
    Place(id: 'a_mar_1', name: 'Jemaa el-Fnaa', type: PlaceType.attraction, imagePath: 'assets/places/a_mar_1.jpg', description: 'World-famous square with performers and markets.', locationInfo: 'Medina, Marrakech', rating: 4.8, mapUrl: "https://goo.gl/maps/JemaaElFnaa"),
    Place(id: 'a_mar_2', name: 'Majorelle Garden', type: PlaceType.attraction, imagePath: 'assets/places/a_mar_2.jpg', description: 'Beautiful gardens owned by Yves Saint Laurent.', locationInfo: 'Rue Yves Saint Laurent', rating: 4.7, mapUrl: "https://goo.gl/maps/Majorelle"),
    Place(id: 'a_mar_3', name: 'Koutoubia Mosque', type: PlaceType.attraction, imagePath: 'assets/places/a_mar_3.jpg', description: 'Iconic landmark of Marrakech.', locationInfo: 'Avenue Mohammed V', rating: 4.7, mapUrl: "https://goo.gl/maps/Koutoubia"),
    Place(id: 'a_mar_4', name: 'Bahia Palace', type: PlaceType.attraction, imagePath: 'assets/places/a_mar_4.jpg', description: 'Masterpiece of Moroccan architecture.', locationInfo: 'Rue Riad Zitoun', rating: 4.6, mapUrl: "https://goo.gl/maps/BahiaPalace"),
    Place(id: 'a_mar_5', name: 'Menara Gardens', type: PlaceType.attraction, imagePath: 'assets/places/a_mar_5.jpg', description: 'Peaceful gardens with Atlas Mountain views.', locationInfo: 'Menara, Marrakech', rating: 4.6, mapUrl: "https://goo.gl/maps/Menara"),
  ],
transports : [
  Place(
    id: 't_mar_1',
    name: 'Marrakech Menara Airport',
    type: PlaceType.transport,
    imagePath: 'assets/places/marrakech_airport.jpg',
    description: 'Major international airport with modern terminals.',
    locationInfo: 'Menara, Marrakech',
    rating: 4.6,
    phoneNumber: "+212524447910",
    mapUrl: "https://goo.gl/maps/MarrakechAirport",
  ),
  Place(
    id: 't_mar_2',
    name: 'Marrakech Train Station',
    type: PlaceType.transport,
    imagePath: 'assets/places/marrakech_train.jpg',
    description: 'Modern train station with connections to Casablanca, Rabat and Fès.',
    locationInfo: 'Avenue Hassan II, Marrakech',
    rating: 4.7,
    mapUrl: "https://goo.gl/maps/MarrakechStation",
  ),
  Place(
    id: 't_mar_3',
    name: 'Marrakech Taxis',
    type: PlaceType.transport,
    imagePath: 'assets/places/marrakech_taxi.jpg',
    description: 'Orange petit taxis and grand taxis are available 24/7.',
    locationInfo: 'Available everywhere',
    rating: 4.1,
  ),
],
// AGADIR

),
City(
  id: 'aga',
  name: 'Agadir',
  imagePath: 'assets/cities/agadir.jpg',
  stadiumName: 'Grand Stade d\'Agadir',
  stadiumImage: 'assets/stadiums/agadirjpg.jpg',
  stadiumDescription:
      "A modern architectural jewel located at the foot of the mountains, facing the ocean.",
  stadiumMapUrl: "https://goo.gl/maps/StadeAgadir",

  hotels: [
    Place(id: 'h_aga_1', name: 'Sofitel Agadir Thalassa', type: PlaceType.hotel, imagePath: 'assets/places/h_aga_1.jpg', description: 'Luxury beachfront hotel.', locationInfo: 'Baie des Palmiers', rating: 4.7, phoneNumber: "+212528388000", mapUrl: "https://goo.gl/maps/SofitelAgadir"),
    Place(id: 'h_aga_2', name: 'Royal Atlas & Spa', type: PlaceType.hotel, imagePath: 'assets/places/h_aga_2.jpg', description: 'Huge resort located on the beach.', locationInfo: 'Boulevard 20 Août', rating: 4.4, phoneNumber: "+212528294949", mapUrl: "https://goo.gl/maps/RoyalAtlas"),
    Place(id: 'h_aga_3', name: 'Iberostar Founty Beach', type: PlaceType.hotel, imagePath: 'assets/places/h_aga_3.jpg', description: 'Popular all-inclusive hotel.', locationInfo: 'Agadir Beach', rating: 4.5, phoneNumber: "+212528227500", mapUrl: "https://goo.gl/maps/IberostarAgadir"),
    Place(id: 'h_aga_4', name: 'Tikida Golf Palace', type: PlaceType.hotel, imagePath: 'assets/places/h_aga_4.jpg', description: 'Luxury hotel in the golf area.', locationInfo: 'Golf du Soleil', rating: 4.6, phoneNumber: "+212528338400", mapUrl: "https://goo.gl/maps/TikidaGolf"),
    Place(id: 'h_aga_5', name: 'Atlantic Hotel', type: PlaceType.hotel, imagePath: 'assets/places/h_aga_5.jpg', description: 'Charming riad-style hotel.', locationInfo: 'Avenue Hassan II', rating: 4.4, phoneNumber: "+212528822016", mapUrl: "https://goo.gl/maps/AtlanticAgadir"),
  ],

  restaurants: [
    Place(id: 'r_aga_1', name: 'Pure Passion', type: PlaceType.restaurant, imagePath: 'assets/places/r_aga_1.jpg', description: 'Best-rated restaurant in the marina.', locationInfo: 'Marina Agadir', rating: 4.7, phoneNumber: "+212528840132", mapUrl: "https://goo.gl/maps/PurePassion"),
    Place(id: 'r_aga_2', name: 'Le Jardin d’Eau', type: PlaceType.restaurant, imagePath: 'assets/places/r_aga_2.jpg', description: 'Beautiful Moroccan restaurant.', locationInfo: 'Boulevard du 20 Août', rating: 4.6, phoneNumber: "+212528843333", mapUrl: "https://goo.gl/maps/JardinEau"),
    Place(id: 'r_aga_3', name: 'Le Mauresque', type: PlaceType.restaurant, imagePath: 'assets/places/r_aga_3.jpg', description: 'Moroccan and Mediterranean cuisine.', locationInfo: 'Avenue Hassan II', rating: 4.6, phoneNumber: "+212528840782", mapUrl: "https://goo.gl/maps/MauresqueAgadir"),
    Place(id: 'r_aga_4', name: 'Les Blancs', type: PlaceType.restaurant, imagePath: 'assets/places/r_aga_4.jpg', description: 'Spanish restaurant with sea views.', locationInfo: 'Marina Agadir', rating: 4.5, phoneNumber: "+212528840502", mapUrl: "https://goo.gl/maps/LesBlancs"),
    Place(id: 'r_aga_5', name: 'Forty40', type: PlaceType.restaurant, imagePath: 'assets/places/r_aga_5.jpg', description: 'Sports bar and restaurant.', locationInfo: 'Avenue Tawada', rating: 4.4, phoneNumber: "+212528840606", mapUrl: "https://goo.gl/maps/Forty40"),
  ],

  attractions: [
    Place(id: 'a_aga_1', name: 'Agadir Oufella', type: PlaceType.attraction, imagePath: 'assets/places/a_aga_1.jpg', description: 'Hilltop ruins with panoramic views.', locationInfo: 'Agadir Oufella', rating: 4.7, mapUrl: "https://goo.gl/maps/Oufella"),
    Place(id: 'a_aga_2', name: 'Agadir Beach', type: PlaceType.attraction, imagePath: 'assets/places/a_aga_2.jpg', description: 'Long sandy beach.', locationInfo: 'Agadir Coast', rating: 4.8, mapUrl: "https://goo.gl/maps/AgadirBeach"),
    Place(id: 'a_aga_3', name: 'Souk El Had', type: PlaceType.attraction, imagePath: 'assets/places/a_aga_3.jpg', description: 'Huge market with 3000 shops.', locationInfo: 'Quartier Industriel', rating: 4.6, mapUrl: "https://goo.gl/maps/SoukElHad"),
    Place(id: 'a_aga_4', name: 'Crocoparc', type: PlaceType.attraction, imagePath: 'assets/places/a_aga_4.jpg', description: 'Crocodile park with botanical gardens.', locationInfo: 'Route de Marrakech', rating: 4.7, mapUrl: "https://goo.gl/maps/Crocoparc"),
    Place(id: 'a_aga_5', name: 'Agadir Marina', type: PlaceType.attraction, imagePath: 'assets/places/a_aga_5.jpg', description: 'Luxury marina with shops.', locationInfo: 'Marina Agadir', rating: 4.7, mapUrl: "https://goo.gl/maps/AgadirMarina"),
  ],
transports : [
  Place(
    id: 't_aga_1',
    name: 'Agadir Al-Massira Airport',
    type: PlaceType.transport,
    imagePath: 'assets/places/agadir_airport.jpg',
    description: 'International airport located 25km from Agadir city center.',
    locationInfo: 'Route de l\'Aéroport, Agadir',
    rating: 4.2,
    phoneNumber: "+212528839091",
    mapUrl: "https://goo.gl/maps/AgadirAirport",
  ),
  Place(
    id: 't_aga_2',
    name: 'Agadir Bus Terminal (Gare Routière)',
    type: PlaceType.transport,
    imagePath: 'assets/places/agadir_bus.jpg',
    description: 'Main bus terminal with connections across the country.',
    locationInfo: 'Quartier Industriel, Agadir',
    rating: 4.3,
    mapUrl: "https://goo.gl/maps/AgadirGareRoutiere",
  ),
  Place(
    id: 't_aga_3',
    name: 'Petit Taxi Agadir',
    type: PlaceType.transport,
    imagePath: 'assets/places/agadir_taxi.jpg',
    description: 'Blue petit taxis providing easy access to beaches and hotels.',
    locationInfo: 'Everywhere in the city',
    rating: 4.0,
  ),
],

// FES

),
City(
  id: 'fes',
  name: 'Fes',
  imagePath: 'assets/cities/fes.jpg',
  stadiumName: 'Complexe Sportif de Fès',
  stadiumImage: 'assets/stadiums/complexe-sportif-de-fes.jpg',
  stadiumDescription:
      "Located in the spiritual capital, a stadium ready for major events. Known for its beautiful design.",
  stadiumMapUrl: "https://goo.gl/maps/StadeFes",

  hotels: [
    Place(id: 'h_fes_1', name: 'Fes Marriott Jnan Palace', type: PlaceType.hotel, imagePath: 'assets/places/h_fes_1.jpg', description: 'Luxury hotel with huge gardens.', locationInfo: 'Avenue Ahmed Chaouki', rating: 4.7, phoneNumber: "+212535930800", mapUrl: "https://goo.gl/maps/MarriottFes"),
    Place(id: 'h_fes_2', name: 'Palais Faraj Suites & Spa', type: PlaceType.hotel, imagePath: 'assets/places/h_fes_2.jpg', description: 'Stunning palace overlooking the Medina.', locationInfo: 'Ziat, Fès', rating: 4.8, phoneNumber: "+212535635356", mapUrl: "https://goo.gl/maps/PalaisFaraj"),
    Place(id: 'h_fes_3', name: 'Riad Fes Relais & Châteaux', type: PlaceType.hotel, imagePath: 'assets/places/h_fes_3.jpg', description: 'Award-winning riad with traditional decor.', locationInfo: 'Derb Zerbtana', rating: 4.7, phoneNumber: "+212535741943", mapUrl: "https://goo.gl/maps/RiadFes"),
    Place(id: 'h_fes_4', name: 'Hotel Sahrai', type: PlaceType.hotel, imagePath: 'assets/places/h_fes_4.jpg', description: 'Modern luxury hotel with infinity pool.', locationInfo: 'Avenue Mohammed VI', rating: 4.5, phoneNumber: "+212535940332", mapUrl: "https://goo.gl/maps/HotelSahrai"),
    Place(id: 'h_fes_5', name: 'Barcelo Fes Medina', type: PlaceType.hotel, imagePath: 'assets/places/h_fes_5.jpg', description: 'Modern hotel near downtown.', locationInfo: 'Avenue Hassan II', rating: 4.3, phoneNumber: "+212535948800", mapUrl: "https://goo.gl/maps/BarceloFes"),
  ],

  restaurants: [
    Place(id: 'r_fes_1', name: 'Dar Hatim', type: PlaceType.restaurant, imagePath: 'assets/places/r_fes_1.jpg', description: 'Family-run Moroccan restaurant inside the Medina.', locationInfo: 'Ain Azliten', rating: 4.8, phoneNumber: "+212610139790", mapUrl: "https://goo.gl/maps/DarHatim"),
    Place(id: 'r_fes_2', name: 'The Ruined Garden', type: PlaceType.restaurant, imagePath: 'assets/places/r_fes_2.jpg', description: 'Charming garden restaurant.', locationInfo: 'Sidi Ahmed Chaoui', rating: 4.7, phoneNumber: "+212535633596", mapUrl: "https://goo.gl/maps/RuinedGarden"),
    Place(id: 'r_fes_3', name: 'Medina Social Club', type: PlaceType.restaurant, imagePath: 'assets/places/r_fes_3.jpg', description: 'Beautiful rooftop restaurant.', locationInfo: 'Derb Sidi Safi', rating: 4.6, phoneNumber: "+212642726533", mapUrl: "https://goo.gl/maps/MedinaSocial"),
    Place(id: 'r_fes_4', name: 'Riad Rcif', type: PlaceType.restaurant, imagePath: 'assets/places/r_fes_4.jpg', description: 'Royal Moroccan dishes in a palace.', locationInfo: 'Derb Ahl Tadla', rating: 4.7, phoneNumber: "+212613614669", mapUrl: "https://goo.gl/maps/RiadRcif"),
    Place(id: 'r_fes_5', name: 'Chez Rachid', type: PlaceType.restaurant, imagePath: 'assets/places/r_fes_5.jpg', description: 'Affordable Moroccan dishes inside the Medina.', locationInfo: 'Bab Boujloud', rating: 4.4, phoneNumber: "+212535638119", mapUrl: "https://goo.gl/maps/ChezRachidFez"),
  ],

  attractions: [
    Place(id: 'a_fes_1', name: 'Bab Boujloud', type: PlaceType.attraction, imagePath: 'assets/places/a_fes_1.jpg', description: 'Blue gate and iconic entrance to the Medina.', locationInfo: 'Fès Medina', rating: 4.7, mapUrl: "https://goo.gl/maps/BabBoujloud"),
    Place(id: 'a_fes_2', name: 'Al Quaraouiyine University', type: PlaceType.attraction, imagePath: 'assets/places/a_fes_2.jpg', description: 'Oldest university in the world.', locationInfo: 'Medina, Fès', rating: 4.8, mapUrl: "https://goo.gl/maps/Karaouine"),
    Place(id: 'a_fes_3', name: 'Chouara Tannery', type: PlaceType.attraction, imagePath: 'assets/places/a_fes_3.jpg', description: 'Famous leather tannery.', locationInfo: 'Medina, Fès', rating: 4.6, mapUrl: "https://goo.gl/maps/TanneryFes"),
    Place(id: 'a_fes_4', name: 'Jnan Sbil Garden', type: PlaceType.attraction, imagePath: 'assets/places/a_fes_4.jpg', description: 'Beautiful gardens ideal for walking.', locationInfo: 'Boujloud', rating: 4.7, mapUrl: "https://goo.gl/maps/JnanSbil"),
    Place(id: 'a_fes_5', name: 'Merenid Tombs', type: PlaceType.attraction, imagePath: 'assets/places/a_fes_5.jpg', description: 'Hilltop ruins overlooking the city.', locationInfo: 'North Fès', rating: 4.6, mapUrl: "https://goo.gl/maps/MerenidTombs"),
  ],
transports : [
  Place(
    id: 't_fes_1',
    name: 'Fes Saïss Airport',
    type: PlaceType.transport,
    imagePath: 'assets/places/fes_airport.jpg',
    description: 'International airport serving the Fes-Meknes region.',
    locationInfo: 'Route de Sefrou, Fes',
    rating: 4.4,
    phoneNumber: "+212535612222",
    mapUrl: "https://goo.gl/maps/FesAirport",
  ),
  Place(
    id: 't_fes_2',
    name: 'Fes Train Station',
    type: PlaceType.transport,
    imagePath: 'assets/places/fes_train.jpg',
    description: 'Train station connecting Fes with Rabat, Casablanca, Tangier and Oujda.',
    locationInfo: 'Avenue Mohammed VI, Fes',
    rating: 4.6,
    mapUrl: "https://goo.gl/maps/FesStation",
  ),
  Place(
    id: 't_fes_3',
    name: 'Petit Taxi Fes',
    type: PlaceType.transport,
    imagePath: 'assets/places/fes_taxi.jpg',
    description: 'Red petit taxis operating everywhere in Fes.',
    locationInfo: 'Throughout Fes',
    rating: 4.1,
  ),
],

),

];
