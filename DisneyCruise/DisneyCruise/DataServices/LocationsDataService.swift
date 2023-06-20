import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "Auckland Port",
            cityName: "Auckland",
            coordinates: CLLocationCoordinate2D(latitude: -36.8438, longitude: 174.7769),
            description: "The Port of Auckland is the largest container and international trade port in New Zealand. The port is located between Waitemata Harbour and the Manukau Harbour. The port currently serves vessels with a maximum carrying capacity of 4,100TEUs. The port has two terminals.",
            imageNames: [
                "auckland-1",
                "auckland-2",
                "auckland-3",
            ],
            link: "https://en.wikipedia.org/wiki/Colosseum",
            price: 25000.00),
        Location(
            name: "Park Guell",
            cityName: "Barcelona",
            coordinates: CLLocationCoordinate2D(latitude: 41.4145, longitude: 2.1527),
            description: "Park Güell is a privatized park system composed of gardens and architectural elements located on Carmel Hill, in Barcelona, Catalonia, Spain. Carmel Hill belongs to the mountain range of Collserola – the Parc del Carmel is located on the northern face.",
            imageNames: [
                "barcelona-1",
                "barcelona-2",
                "barcelona-3",
            ],
            link: "https://en.wikipedia.org/wiki/Pantheon,_Rome",
            price: 17000.00),
        Location(
            name: "Miami Beach",
            cityName: "Miami",
            coordinates: CLLocationCoordinate2D(latitude: 25.7907, longitude: -80.1300),
            description: "Miami Beach is a south Florida island city, connected by bridges to mainland Miami. Wide beaches stretch from North Shore Open Space Park, past palm-lined Lummus Park to South Pointe Park. The southern end, South Beach, is known for its international cachet with models and celebrities, and its early-20th-century architecture in the Art Deco Historic district with pastel-colored buildings, especially on Ocean Drive.",
            imageNames: [
                "miami-1",
                "miami-2",
                "miami-3",
            ],
            link: "https://en.wikipedia.org/wiki/Trevi_Fountain",
            price: 19999.00),
        Location(
            name: "Sandiago",
            cityName: "California",
            coordinates: CLLocationCoordinate2D(latitude: 32.7157, longitude: -117.1611),
            description: "San Diego is a city on the Pacific coast of California known for its beaches, parks and warm climate. Immense Balboa Park is the site of the renowned San Diego Zoo, as well as numerous art galleries, artist studios, museums and gardens. A deep harbor is home to a large active naval fleet, with the USS Midway, an aircraft-carrier-turned-museum, open to the public.",
            imageNames: [
                "sandiago-1",
                "sandiago-2",
                "sandiago-3",
            ],
            link: "https://en.wikipedia.org/wiki/Eiffel_Tower",
            price: 21500.00),
        Location(
            name: "Sydney Opera House",
            cityName: "Sydney",
            coordinates: CLLocationCoordinate2D(latitude: -33.8568, longitude: 151.2153),
            description: "The Sydney Opera House is a multi-venue performing arts centre in Sydney. Located on the foreshore of Sydney Harbour, it is widely regarded as one of the world's most famous and distinctive buildings and a masterpiece of 20th-century architecture.",
            imageNames: [
                "sydney-1",
                "sydney-2",
                "sydney-3",
            ],
            link: "https://en.wikipedia.org/wiki/Louvre",
            price: 14890.00),
    ]
    
}
