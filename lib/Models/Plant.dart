class Plant{
  int id;
  String name;
  String about;
  String humidity;
  double max_height;
  String temperature;
  String image_path;
  
  Plant({
    required this.id,
    required this.name,
    required this.about,
    required this.humidity,
    required this.max_height,
    required this.temperature,
    required this.image_path
    });

}

List<Plant> Plants=[
Plant(
  id: 0,
  name: "Astilbe",
  about: """
    Astilbe is a perennial plant celebrated for its elegant plume-like flowers and delicate, fern-like leaves. Belonging to the Saxifragaceae family, Astilbe thrives in shaded, moist conditions, making it an ideal choice for enchanting garden landscapes. Its versatility is showcased through various species and cultivars, offering a rich palette of colors, including pristine white, romantic pink, bold red, and calming lavender.

    These low-maintenance plants not only bring vibrant bursts of color but also contribute unique textures to shaded environments. The distinctive plumes, resembling feathery wands, create a visual spectacle that adds a touch of sophistication to any garden.

    Astilbes prefer moderate to high humidity levels, creating an environment reminiscent of their native woodlands. With a maximum height reaching up to 120 centimeters, these plants establish a graceful presence in garden beds and borders.

    The moderate temperature requirements of Astilbes make them well-suited for various climates, providing gardeners with an adaptable and resilient perennial option. Whether planted as standalone features or combined with other shade-loving companions, Astilbes elevate the aesthetics of outdoor spaces, inviting a sense of tranquility and charm.
  """,
  humidity: "Moderate to high",
  max_height: 120,
  temperature: "Moderate",
  image_path : "assets/flowers/astilbe.jpg"
),


  Plant(
  id: 1,
  name: "Bellflower",
  about: """
    Bellflowers, scientifically known as Campanula, enchant gardens with their perennial beauty, showcasing charming bell-shaped flowers. Available in a delightful spectrum of colors, including serene blue, regal purple, and pure white, Bellflowers add a touch of whimsy and elegance to outdoor spaces. 

    Thriving in well-drained soil, these resilient plants exhibit a preference for environments that receive full sun to partial shade. This adaptability makes Bellflowers suitable for a variety of garden settings, from sunny borders to partially shaded corners.

    With a moderate humidity requirement, Bellflowers are well-suited for climates that provide a balanced moisture level. The maximum height of Bellflowers reaches up to 60 centimeters, offering a compact yet impactful presence in garden beds or containers.

    Bellflowers are easy to integrate into garden designs, whether as focal points or as part of mixed plantings. Their moderate temperature preferences make them versatile and adaptable to various climatic conditions. Embrace the enchanting allure of Bellflowers as they bloom and sway, bringing a sense of grace and sophistication to your outdoor haven.
  """,
  humidity: "Moderate",
  max_height: 60.0,
  temperature: "Moderate",
  image_path : "assets/flowers/bellflower.jpg"
),


Plant(
  id: 2,
  name: "Black-Eyed Susan",
  about: """
    Black-Eyed Susan, scientifically known as Rudbeckia, graces gardens with its radiant presence. This flowering perennial boasts bright yellow, daisy-like flowers adorned with a captivating dark central cone. A sun-loving beauty, Black-Eyed Susans thrive in full sunlight and well-drained soil, making them a cherished choice for garden enthusiasts.

    Standing proud with a maximum height reaching up to 90 centimeters, these perennials create a striking visual impact in borders and flower beds. The vibrant and long-lasting blooms of Black-Eyed Susans not only add a burst of color to the landscape but also attract a variety of pollinators, contributing to the overall health and biodiversity of the garden.

    With a preference for moderate humidity levels, Black-Eyed Susans are well-suited for a range of climates. Their versatility extends to temperature requirements, thriving in moderate to warm conditions. This adaptability makes them a reliable and resilient addition to gardens, providing a source of joy with their cheerful blooms throughout the growing season.

    Embrace the charm and natural allure of Black-Eyed Susans as they paint your garden with hues of yellow, inviting nature to dance and flourish in your outdoor sanctuary.
  """,
  humidity: "Moderate",
  max_height: 90.0, // Replace with the actual max height in centimeters
  temperature: "Moderate to warm",
  image_path : "assets/flowers/black_eyed_susan.jpg"
),



Plant(
  id: 3,
  name: "Calendula",
  about: """
    Calendula, affectionately known as pot marigold, graces gardens as an annual flowering plant adorned with bright orange or yellow blooms. Beyond its visual appeal, Calendula holds a special place for its valued medicinal properties, often harnessed in herbal remedies and skincare products.

    Flourishing in well-drained soil and basking in the warmth of full sun, Calendula becomes a radiant presence in gardens. Reaching a maximum height of approximately 45 centimeters, this annual beauty adds a touch of sunshine to borders, containers, and herb gardens.

    Calendula's continuous blooms throughout the growing season not only elevate the aesthetic charm of the garden but also provide a versatile resource for those interested in herbal medicine. The moderate humidity requirements of Calendula make it adaptable to various climates, while its preference for moderate temperatures ensures reliable performance in diverse environmental conditions.

    Embrace the beauty and functionality of Calendula as it weaves its golden hues into your garden, offering both visual delight and the potential for natural well-being.
  """,
  humidity: "Moderate",
  max_height: 45.0, // Replace with the actual max height in centimeters
  temperature: "Moderate",
  image_path : "assets/flowers/calendula.jpg"
),


 Plant(
  id: 4,
  name: "California Poppy",
  about: """
    California Poppy, a symbol of vibrancy and resilience, is a dazzling and drought-tolerant annual that graces gardens with its feathery, fern-like foliage and cup-shaped flowers in hues of orange, yellow, or red. Though native to California, its adaptable nature allows it to thrive in various regions, bringing its cheerful touch to gardens around the world.

    Flourishing under the embrace of full sun and in well-drained soil, California Poppies boast not only visual allure but also a remarkable ability to withstand periods of drought. Reaching a maximum height of around 30 centimeters, these annuals are perfect for borders, rock gardens, and containers, adding a burst of color and texture to any landscape.

    With a preference for low to moderate humidity levels, California Poppies are well-suited for arid and semi-arid climates. Their resilience extends to a range of temperatures from moderate to warm, making them a reliable choice for gardeners seeking both beauty and adaptability.

    Embrace the lively spirit of California Poppies as they dance in the sunlight, bringing a vibrant and enduring charm to your garden.
  """,
  humidity: "Low to moderate",
  max_height: 30.0, // Replace with the actual max height in centimeters
  temperature: "Moderate to warm",
  image_path : "assets/flowers/california_poppy.jpg"
),


 Plant(
  id: 5,
  name: "Carnation",
  about: """
    Carnation, scientifically known as Dianthus caryophyllus, is a beloved perennial celebrated for its fragrant and vibrant flowers. Adorning gardens in a spectrum of colors, including enchanting red, delicate pink, pure white, and sunny yellow, Carnations hold a special place in floral arrangements and carry symbolic meanings of love and fascination.

    Thriving in well-drained soil and basking in the glow of partial to full sun, Carnations showcase their elegance in various garden settings. Reaching a maximum height of approximately 60 centimeters, these perennials make a delightful addition to borders, flower beds, and cutting gardens.

    The moderate humidity requirements of Carnations make them adaptable to different climates, while their preference for moderate temperatures ensures consistent and reliable blooms. Known for their versatility, Carnations are not only visually captivating but also a cherished choice for expressing sentiments in bouquets and arrangements.

    Embrace the beauty and sentimentality of Carnations as they grace your garden with their delightful fragrance and a kaleidoscope of colors, creating an atmosphere of love and fascination.
  """,
  humidity: "Moderate",
  max_height: 60.0, // Replace with the actual max height in centimeters
  temperature: "Moderate",
  image_path : "assets/flowers/carnation.jpg"
),


  Plant(
  id: 6,
  name: "Common Daisy",
  about: """
    Common Daisy, scientifically named Bellis perennis, is a resilient perennial adorned with charming white or pink daisy-like flowers featuring a sunny yellow center. Renowned for its low-growing habit, Common Daisies are often discovered gracing lawns and meadows, adding a touch of simplicity and beauty to natural landscapes.

    Flourishing in well-drained soil and embracing the warmth of full sun to partial shade, Common Daisies demonstrate their adaptability in various environments. With a modest maximum height of around 15 centimeters, these perennials create a carpet of blooms that captures the essence of a classic, timeless garden.

    The moderate humidity requirements of Common Daisies make them well-suited for a range of climates, while their preference for moderate temperatures ensures consistent growth and bloom. Whether scattered in a meadow or incorporated into a garden border, Common Daisies bring a sense of charm and tranquility to outdoor spaces.

    Embrace the enduring allure of Common Daisies as they carpet your landscape with their dainty blooms, inviting a touch of timeless beauty to your outdoor haven.
  """,
  humidity: "Moderate",
  max_height: 15.0, // Replace with the actual max height in centimeters
  temperature: "Moderate",
  image_path : "assets/flowers/common_daisy.jpg"
),
Plant(
  id: 7,
  name: "Coreopsis",
  about: """
    Coreopsis, affectionately known as tickseed, is a perennial that brings bright and cheerful vibes to gardens with its daisy-like flowers, painted in hues of yellow, orange, and red. Celebrated for its resilience, Coreopsis is drought-tolerant and serves as a magnet for pollinators, enhancing the biodiversity of your garden.

    Flourishing in well-drained soil and basking in the warmth of full sun, Coreopsis stands out as a popular choice for landscaping, contributing vibrant colors and dynamic energy to outdoor spaces. Reaching a maximum height of approximately 60 centimeters, these perennials add a delightful vertical dimension to borders, containers, and flower beds.

    With a preference for low to moderate humidity levels, Coreopsis is well-suited for arid and semi-arid climates. Its adaptability extends to a range of temperatures, thriving in moderate to warm conditions. This makes Coreopsis a reliable and resilient addition to gardens, offering continuous blooms and attracting a flurry of pollinators throughout the growing season.

    Embrace the joyful and lively spirit of Coreopsis as it transforms your garden into a haven of color and activity, creating a welcoming space for both you and nature.
  """,
  humidity: "Low to moderate",
  max_height: 60.0, // Replace with the actual max height in centimeters
  temperature: "Moderate to warm",
  image_path : "assets/flowers/coreopsis.jpg"
),

Plant(
  id: 8,
  name: "Daffodil",
  about: """
    Daffodil, scientifically known as Narcissus, heralds the arrival of spring with its enchanting, trumpet-shaped flowers that come in shades of yellow and white. Symbolizing rebirth and new beginnings, Daffodils captivate the senses with their vibrant colors and distinctive floral form.

    Flourishing as a bulbous perennial, Daffodils add a touch of elegance to gardens, landscapes, and springtime celebrations. Thriving in well-drained soil and basking in the glow of full to partial sunlight, these perennials reach a maximum height of approximately 40 centimeters, making them a delightful addition to borders, beds, and naturalized areas.

    The moderate humidity requirements of Daffodils make them adaptable to various climates, and their preference for moderate temperatures ensures a reliable and consistent display of blooms. Whether planted in clusters or scattered throughout the garden, Daffodils bring a sense of renewal and joy to outdoor spaces.

    Embrace the arrival of spring with the timeless beauty of Daffodils, as they paint your landscape with the promise of new beginnings and the vibrant colors of nature.
  """,
  humidity: "Low to moderate",
  max_height: 40.0, // Replace with the actual max height in centimeters
  temperature: "Moderate",
  image_path : "assets/flowers/daffodil.jpg"
),

Plant(
  id: 9,
  name: "Dandelion",
  about: """
    Dandelion, scientifically named Taraxacum officinale, stands as a common yet remarkable perennial weed, displaying distinctive yellow flowers and fluffy seed heads. Beyond its reputation as a garden intruder, the Dandelion boasts medicinal properties and is a surprisingly versatile addition to the edible landscape.

    Thriving in various conditions, including well-drained soil, Dandelions can be found flourishing in lawns, meadows, and gardens alike. With a modest maximum height of approximately 30 centimeters, these perennials contribute to the natural tapestry of outdoor spaces.

    The low to moderate humidity requirements of Dandelions make them resilient in different climates, while their adaptability to moderate temperatures ensures their widespread presence. Embraced for both their tenacity and utility, Dandelions serve as a reminder of nature's resilience and the hidden treasures found in common plants.

    Explore the multifaceted nature of Dandelions as they bring not only a touch of yellow to your surroundings but also potential health benefits and culinary intrigue, inviting you to appreciate the beauty in the ordinary.
  """,
  humidity: "Low to moderate",
  max_height: 30.0, // Replace with the actual max height in centimeters
  temperature: "Moderate",
  image_path : "assets/flowers/dandelion.jpg"
),


Plant(
  id: 10,
  name: "Iris",
  about: """
    Iris, a captivating perennial, earns its distinction through striking and intricate flowers that unfold in a breathtaking display. With a vast array of colors and mesmerizing patterns, Iris graces gardens and landscapes, making its presence known during the enchanting seasons of spring and early summer.

    Sporting sword-shaped leaves, Iris stands tall as a symbol of elegance and beauty. Thriving in well-drained soil and basking in the warmth of full sun, these perennials reach a majestic height of approximately 80 centimeters, adding vertical drama to borders, beds, and floral arrangements.

    The moderate humidity requirements of Iris make it adaptable to various climates, while its preference for moderate temperatures ensures a splendid bloom in diverse environments. Valued not only for its aesthetic appeal but also for its versatility, Iris stands as a popular choice for both gardens and floral artistry, where its exquisite blooms can be showcased and admired.

    Embrace the allure of Iris as it graces your outdoor haven, bringing a touch of sophistication and artistic brilliance to your garden canvas.
  """,
  humidity: "Moderate",
  max_height: 80.0, // Replace with the actual max height in centimeters
  temperature: "Moderate",
  image_path : "assets/flowers/iris.jpg"
),


Plant(
  id: 11,
  name: "Magnolia",
  about: """
    Magnolia, a botanical masterpiece, graces landscapes as a beautiful flowering tree or shrub renowned for its grandeur. Adorned with large, fragrant flowers and glossy green leaves, Magnolias captivate the senses with their enchanting presence. The diverse array of species and hybrids offer a palette of blooms ranging from pristine white to delicate pink and regal purple.

    Flourishing in well-drained, slightly acidic soil, Magnolias become a focal point in gardens, parks, and natural settings. Thriving under the embrace of full to partial sun, these botanical wonders reach towering heights, with some species soaring up to a majestic 800 centimeters.

    The moderate humidity requirements of Magnolias make them adaptable to various climates, while their preference for moderate temperatures ensures a splendid bloom in diverse environmental conditions. Magnolias stand as a testament to timeless elegance and are cherished for their role in creating visually stunning and fragrant landscapes.

    Embrace the grandeur of Magnolias as they bloom in all their glory, transforming your outdoor space into a sanctuary of natural beauty and timeless charm.
  """,
  humidity: "Moderate",
  max_height: 800.0, // Replace with the actual max height in centimeters
  temperature: "Moderate",
  image_path : "assets/flowers/magnolia.jpg"
),


 Plant(
  id: 12,
  name: "Rose",
  about: """
    The Rose, a timeless and beloved flowering shrub, takes center stage with its diverse array of colors and captivating fragrances. Renowned for its romantic symbolism, Roses weave a tale of love and beauty that transcends generations. Thriving in well-drained soil and basking in the glow of full sun, Roses stand as a symbol of elegance and grace.

    With a maximum height that can reach up to 150 centimeters, these classic blooms create a stunning presence in gardens, bouquets, and landscaping. The versatility of Roses, coupled with their moderate humidity requirements and preference for moderate temperatures, makes them a cherished choice for a wide range of climates and environments.

    Embraced for their beauty and timeless appeal, Roses continue to be a symbol of affection, making them a popular selection for expressing emotions and enhancing the aesthetics of outdoor spaces. Whether adorning a garden or gracing a special occasion, Roses remain an enduring symbol of love and elegance.

    Cultivate the elegance and romance of Roses in your own haven, where their blooms tell a story of enduring love and natural splendor.
  """,
  humidity: "Moderate",
  max_height: 150.0, // Replace with the actual max height in centimeters
  temperature: "Moderate",
  image_path : "assets/flowers/rose.jpg"
),


Plant(
  id: 13,
  name: "Sunflower",
  about: """
    Sunflower, scientifically known as Helianthus, stands as a vibrant and iconic annual, celebrated for its large and brilliant yellow flower heads. With a heliotropic nature that sees them turning to face the sun, Sunflowers exude a cheerful and radiant presence in gardens and floral arrangements.

    Thriving in well-drained soil and basking in the warmth of full sun, Sunflowers reach towering heights, with a maximum height that can soar up to 300 centimeters. This characteristic not only makes them a striking focal point in gardens but also a popular choice as cut flowers, bringing their sunny disposition indoors.

    With a preference for low to moderate humidity levels, Sunflowers showcase their resilience in a variety of climates. Their love for warm temperatures further enhances their adaptability, making them a reliable choice for gardeners seeking a burst of color and joy in their outdoor spaces.

    Embrace the uplifting presence of Sunflowers as they stand tall in your garden, reflecting the sun's warmth and radiating happiness throughout the growing season.
  """,
  humidity: "Low to moderate",
  max_height: 300.0, // Replace with the actual max height in centimeters
  temperature: "Warm",
  image_path : "assets/flowers/sunflower.jpg"
),


Plant(
  id: 14,
  name: "Tulip",
  about: """
    Tulip, the epitome of springtime elegance, graces gardens as a bulbous perennial with a stunning variety of colors and shapes. Known for its simplicity and timeless charm, the Tulip is a favorite for both garden enthusiasts and floral designers alike. Thriving in well-drained soil and seeking the embrace of full to partial sun, Tulips paint the landscape with their captivating hues.

    With a modest maximum height of approximately 40 centimeters, Tulips create a symphony of color in borders, beds, and floral arrangements. The low to moderate humidity requirements of Tulips make them adaptable to various climates, and their preference for moderate temperatures ensures a splendid bloom in diverse environmental conditions.

    Embrace the delicate beauty and grace of Tulips as they herald the arrival of spring, bringing a sense of renewal and natural artistry to your outdoor sanctuary.
  """,
  humidity: "Low to moderate",
  max_height: 40.0, // Replace with the actual max height in centimeters
  temperature: "Moderate",
  image_path : "assets/flowers/tulip.jpg"
),


Plant(
  id: 15,
  name: "Water Lily",
  about: """
    Water Lily, scientifically known as Nymphaea, graces aquatic landscapes as a perennial plant with floating leaves and enchanting, fragrant flowers. Flourishing in ponds and calm waters, Water Lilies emerge as a symbol of serene beauty, adding a touch of tranquility to their surroundings.

    With a preference for still or slow-moving water, Water Lilies showcase their resilience in various aquatic environments. Reaching a maximum height of approximately 30 centimeters, these perennials create a floating masterpiece that captivates with both its visual and olfactory allure.

    The high humidity requirements of Water Lilies align with their aquatic habitat, making them an ideal choice for water features. Their adaptability to moderate temperatures ensures consistent growth and bloom, enhancing the peaceful ambiance of ponds and water gardens.

    Embrace the serenity and natural elegance of Water Lilies as they grace the waters, creating a haven of calm and beauty in your aquatic landscape.
  """,
  humidity: "High",
  max_height: 30.0, // Replace with the actual max height in centimeters
  temperature: "Moderate",
  image_path : "assets/flowers/water_lily.jpg"
),
];