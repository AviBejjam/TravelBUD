import 'package:demtrav/pages/chat/join.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: PlacesPage(),
    );
  }
}

class PlacesPage extends StatelessWidget {
  final List<Place> places = [

    Place(
      name: 'PARIS',
      description: 'Paris, often referred to as the "City of Love," is a vibrant metropolis known for its iconic landmarks, rich history, and artistic culture.',
      imageUrl: 'https://www.travellens.co/content/images/2019/10/Paris-eiffel-tower.jpg',
      itinerary: 'Day 1: Explore the Iconic Landmarks Morning: Visit the Eiffel Tower and take in panoramic views.Afternoon: Stroll along the Seine River and visit the Musée d Orsay.Evening: Have dinner in a charming Montmartre restaurant and explore the artistic neighborhood. Day 2: Art and Culture: Morning: Explore the Louvre Museum, home to the Mona Lisa .Afternoon: Visit Notre-Dame Cathedral and take a Seine River cruise.Evening: Enjoy a leisurely dinner at a traditional French bistro.Day 3: Palace and Gardens .Morning: Take a day trip to the Palace of Versailles. Afternoon: Explore the magnificent gardens of Versailles. Evening: Return to Paris and dine in the Latin Quarter.Day 4: Shopping and Farewell :Morning: Shop on the Champs-Élysées and visit Arc de Triomphe. Afternoon: Explore Montparnasse and visit Montparnasse Tower for panoramic views.Evening: Have a farewell dinner at a Michelin-starred restaurant.',

    ),
    Place(
      name: 'SHIMLA',
      description: 'Escape to the serene mountains and enjoy nature at its best.',
      imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.JXtQEDX3uIYpZc8OOnofWAHaEK&pid=Api&P=0&h=180%27',
      itinerary: 'Day 1: Explore Shimla Morning: Visit the historic Ridge and Mall Road, famous for shopping and scenic views.Afternoon: Explore Christ Church and Gaiety Theatre.Evening: Enjoy a leisurely walk on Mall Road and try local cuisine.',
    ),
    Place(
      name: 'HYDERABAD',
      description: 'Experience the vibrant life of the city with its hustle and bustle.',
      imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.7RgG8E58PfgB0UVU-R1tRwHaE8&pid=Api&P=0&h=180%27',
      itinerary: 'Day 1: Visit museums. Day 2: Explore the local cuisine and nightlife.',
    ),
    Place(
      name: 'DELHI',
      description: 'Delhi is India bustling capital, offers a rich tapestry of history, culture, and vibrant markets, perfect for group travel adventures.',
      imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.H_KeQ0PBWhS8EVqmY_7M8gHaE7&pid=Api&P=0&h=180',
      itinerary: 'Day 1: Historical Delhi: Visit the Red Fort, a UNESCO World Heritage site.Explore India Gate and take a leisurely walk around Connaught Place.Day 2: Cultural Delhi Explore the Swaminarayan Akshardham Temple, a magnificent complex showcasing Indian art and culture.Visit the nearby Laxmi Narayan Temple (Birla Mandir).',

    ),
    Place(
      name:'NEWYORK',
      description: 'New York is a bustling metropolis where diverse cultures, iconic landmarks, and relentless energy converge.',
      imageUrl: 'https://fthmb.tqn.com/N3NUYTkZt9loLIKpizw-aRvScE0=/3865x2576/filters:fill(auto,1)/manhattan-skyline-on-a-sunny-day-empire-state-building-on-the-right--new-york--united-states-846410892-5b11b34ffa6bcc0036e64b0c.jpg',
      itinerary: 'Visit Times Square and explore the nearby shops.Head to Central Park for a leisurely stroll and maybe rent a rowboat.Take a walk across the Brooklyn Bridge and explore DUMBO.',

    ),
    Place(
       name:'ITALY',
       description: 'Italy is a country in southern Europe known for its rich history, art, culture, and delicious cuisine.',
       imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.X39Ubyo3poIlh_ElgVugZwHaE5&pid=Api&P=0&h=180',
       itinerary: 'Explore the Colosseum and Roman Forum .Visit the Pantheon and Piazza Navona.Explore St. Marks Square and BasilicaTake a gondola ride on the canals .Visit the Doges Palace and Rialto Bridge',
       

    ),
    Place(
      name:'KERALA',
      description: 'Kerala is a lush, tropical state in southern India known for its natural beauty, diverse culture, and high literacy rate.',
      imageUrl: 'https://www.tripsavvy.com/thmb/XWHNxHT_xQfAqBuwM24wCsXHcE8=/2121x1414/filters:fill(auto,1)/GettyImages-530291126-5947dfbb3df78c537b39b0f8.jpg',
      itinerary: 'Arrive in Kochi (Cochin) and explore Fort Kochis historic sites like the Chinese fishing nets, St. Francis Church, and the Jewish Synagogue.Head to Alleppey and board a houseboat for a backwater cruise through the tranquil Kerala backwaters.Experience the serene beauty of the backwaters and enjoy a traditional Keralan meal on the houseboat.Return to Kochi for departure or extend your stay as desired',

    )
  ];

  PlacesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PLACES TO EXPLORE'),
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return PlaceCard(place: places[index]);
        },
      ),
    );
  }
}

class Place {
  final String name;
  final String description;
  final String imageUrl;
  final String itinerary;

  Place({required this.name, required this.description, required this.imageUrl, required this.itinerary});
}

class PlaceCard extends StatelessWidget {
  final Place place;

  const PlaceCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.network(
            place.imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  place.description,
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 16.0),
                ExpansionTile(
                  title: const Text('VIEW DETAILS'),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        place.itinerary,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                    TextButton(onPressed:(){
                      Navigator.push(
                       context,
                     MaterialPageRoute(
                    builder: (context) => Joinpage(),

                        
                  ),
                );
                },
                
                 child:Text('JOIN',),

                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}