// File: flutter_app/lib/data/slides_database_json.dart

class SlidesDatabaseJson {
  static const String databaseRawJson = r'''[
  {
    "id": "class-7",
    "name": "Class 7",
    "subjects": [
      {
        "id": "science",
        "name": "Science",
        "chapters": [
          {
            "id": "c7-s-1",
            "name": "Chapter 1: Nutrition in Plants",
            "description": "Autotrophic and heterotrophic modes of nutrition, photosynthesis mechanism, and soil nutrient replenishment.",
            "topics": [
              {
                "id": "c7-s-1-t1",
                "title": "Photosynthesis: Solar-Powered Food Factory",
                "description": "Deconstruct how chloroplasts, sunlight, carbon dioxide, and stomatal cells manufacture glucose.",
                "themeId": "forest-organic",
                "intro": {
                  "title": "Nutrition in Plants",
                  "subtitle": "The Biochemistry of Photosynthesis",
                  "content": "Plants are the ultimate primary producers. Through photosynthesis, they capture solar radiation and store it within high-energy covalent chemical bonds of sugar molecules, fueling the biosphere.",
                  "keyConcepts": ["Chlorophyll absorption properties", "Stomatal gas exchanges", "Water photolysis reactions", "Starch compound storage"]
                },
                "explanations": [
                  {
                    "title": "Stomatal Gatekeepers",
                    "subtitle": "How leaves breathes carbon dioxide",
                    "content": "Stomata are micro-pores guarded by curved kidney-shaped cells. When hydrated, they swell to open and pull in outer CO2, releasing oxygen byproducts cleanly.",
                    "interactiveWidget": {
                      "type": "diagram",
                      "title": "Turgor Pressure Gate Simulator",
                      "config": { "type": "stomata-state" }
                    }
                  },
                  {
                    "title": "The Solar Core",
                    "subtitle": "Light-Harvesting Antennas",
                    "content": "Chlorophyll pigment inside cellular chloroplast partitions acts like a mineral semiconductor, absorbing red and blue light fields while reflecting green, which colors forest canopies.",
                    "interactiveWidget": {
                      "type": "simulation",
                      "title": "Chloroplast Surface Catalyst",
                      "config": { "type": "surface-area-slider" }
                    }
                  },
                  {
                    "title": "Chemical Equation of Life",
                    "subtitle": "Balancing Carbon Dioxide and Water",
                    "content": "6 molecules of carbon dioxide fuse with 6 water molecules using sunlight to forge 1 glucose molecule and 6 oxygen molecules. Matter balances exactly.",
                    "interactiveWidget": {
                      "type": "simulation",
                      "title": "Photosynthetic Mass Equalizer",
                      "config": { "type": "chemical-equation" }
                    }
                  },
                  {
                    "title": "Leaf Axis Inclines",
                    "subtitle": "Optimizing Canopy Angle Shadows",
                    "content": "Leaf angles direct orientation matching solar pathways. Measure photosynthesis rates against branch tilt values.",
                    "interactiveWidget": {
                      "type": "simulation",
                      "title": "Solar Incline Path Slider",
                      "config": { "type": "angle-ratio-slider", "ratioType": "sine" }
                    }
                  }
                ],
                "youtubeId": "7m8vSreXW1s",
                "quizzes": [
                  {
                    "type": "conceptual",
                    "question": "Which specific compound gives green plant foliage its emerald characteristic?",
                    "options": ["Sodium chloride", "Chlorophyll", "Hemoglobin", "Iron oxide"],
                    "correctIndex": 1,
                    "explanation": "Chlorophyll is a magnesium-centered porphyrin ring that absorbs red and blue wavelengths, making leaves look green."
                  },
                  {
                    "type": "skill",
                    "question": "What happens to stomata guard cells when they lose water through transpiration?",
                    "options": ["They swell and expand", "They shrink and close the pore to check further loss", "They turn into wood fibers", "They burst instantly"],
                    "correctIndex": 1,
                    "explanation": "Losing water decreases turgor pressure inside the guard cells, causing them to collapse and close the stomatal pore."
                  },
                  {
                    "type": "hots",
                    "question": "If we mask a leaf with black card blocks, what occurs inside the covered region?",
                    "options": ["Oxygen levels spike", "Photosynthesis halts due to the lack of light, depleting starch reserves", "Glucose multiplies three-fold", "The leaf starts breathing nitrogen"],
                    "correctIndex": 1,
                    "explanation": "Light is mandatory to power chlorophyll reactions. Blocking light halts carbon assimilation, preventing starch synthesis."
                  },
                  {
                    "type": "application",
                    "question": "How do farmers cultivate greenhouse crops like tomatoes to maximize starch yields?",
                    "options": ["By spraying acid on soils", "Enriching the workspace with CO2 and lighting systems to accelerate Calvin cycles", "By limiting branch tilling completely", "Using sand irrigation"],
                    "correctIndex": 1,
                    "explanation": "Enriched carbon dioxide raises the baseline rate of carbon chemical capture during photosynthesis cycles."
                  }
                ],
                "summary": {
                  "title": "Nutrition Principles Recap",
                  "keyTakeaways": [
                    "Autotrophs forge chemical glucose from solar rays.",
                    "Stomata regulate crucial oxygen, carbon, and water levels.",
                    "Solar pigments capture precise photon frequencies.",
                    "Foliage angle spacing balances canopy shade ratios."
                  ],
                  "classroomActivity": "Place aquatic Hydrilla stems under glass funnels in sunlight and count bubbles of oxygen emitted!",
                  "quickFact": "Nearly 70% of the world's clean oxygen is created by tiny microscopic plants floating in standard marine ocean basins!"
                }
              }
            ]
          },
          { "id": "c7-s-2", "name": "Chapter 2: Nutrition in Animals", "description": "Process of digestion in humans, ruminants, and Amoeba.", "topics": [] },
          { "id": "c7-s-3", "name": "Chapter 3: Heat", "description": "Hot and cold, measuring temperature, and transfer of heat.", "topics": [] },
          { "id": "c7-s-4", "name": "Chapter 4: Acids, Bases and Salts", "description": "Natural indicators, neutralization, and salts in everyday life.", "topics": [] },
          { "id": "c7-s-5", "name": "Chapter 5: Physical and Chemical Changes", "description": "Crystallisation, rusting of iron, and chemical reaction types.", "topics": [] },
          { "id": "c7-s-6", "name": "Chapter 6: Respiration in Organisms", "description": "Aerobic and anaerobic respiration, breathing mechanisms.", "topics": [] },
          { "id": "c7-s-7", "name": "Chapter 7: Transportation in Animals and Plants", "description": "Circulatory system, excretion, and transport of substances.", "topics": [] },
          { "id": "c7-s-8", "name": "Chapter 8: Reproduction in Plants", "description": "Asexual and sexual reproduction, seed dispersal.", "topics": [] },
          { "id": "c7-s-9", "name": "Chapter 9: Motion and Time", "description": "Slow and fast motion, speed, and measurement of time.", "topics": [] },
          { "id": "c7-s-10", "name": "Chapter 10: Electric Current and its Effects", "description": "Heating and magnetic effects of current, electric fuse.", "topics": [] },
          { "id": "c7-s-11", "name": "Chapter 11: Light", "description": "Reflection, spherical mirrors, and lenses.", "topics": [] },
          { "id": "c7-s-12", "name": "Chapter 12: Forests: Our Lifeline", "description": "Forest products, food chains, and forest conservation.", "topics": [] },
          { "id": "c7-s-13", "name": "Chapter 13: Wastewater Story", "description": "Sewage treatment, alternative arrangements for sewage disposal.", "topics": [] }
        ]
      },
      {
        "id": "math",
        "name": "Mathematics",
        "chapters": [
          {
            "id": "c7-m-1",
            "name": "Chapter 1: Integers",
            "description": "Operations on integers, representation of number lines, and properties of absolute signs.",
            "topics": [
              {
                "id": "c7-m-1-t1",
                "title": "Operations on Integers",
                "description": "Master adding and subtracting positive and negative integer bounds on coordinate lines.",
                "themeId": "monochrome",
                "intro": {
                  "title": "Operations on Integers",
                  "subtitle": "Negative Values and Number Lines",
                  "content": "Integers are entire numbers containing negative lines, positive counters, and zero. We see them modeling ledger balances of bank debts or temperature drop coordinates.",
                  "keyConcepts": ["Absolute distance parameters", "Directional flips of signs", "Additive inverse coordinates", "Balanced sign multiplications"]
                },
                "explanations": [
                  {
                    "title": "Number Line Walks",
                    "subtitle": "Rightwards vs Leftwards Step Directions",
                    "content": "Adding positive values steps to the right. Subtracting negative variables works like double negative flips, moving you rightwards as well.",
                    "interactiveWidget": {
                      "type": "interactive-cards",
                      "title": "Operation Rules Index",
                      "config": {
                        "items": [
                          { "title": "Add Positive(+)", "desc": "Translate coordinates to the right of zero." },
                          { "title": "Subtract Negative(- (-x))", "desc": "Double inverse flips direct movement rightwards!" },
                          { "title": "Add Negative(+ (-x))", "desc": "Translate coordinates leftwards." }
                        ]
                      }
                    }
                  },
                  {
                    "title": "Additive Inversion Balance",
                    "subtitle": "Opposites Summing to Zero",
                    "content": "Every integer possesses its mirrored inverse partner. Combining them neutralizes coordinates entirely, mapping back to zero origin.",
                    "interactiveWidget": {
                      "type": "diagram",
                      "title": "Coordinate Inversion Map",
                      "config": { "type": "stomata-state" }
                    }
                  },
                  {
                    "title": "The Multiplication Grid",
                    "subtitle": "Solving Compound Integer Multipliers",
                    "content": "Multiplying similar sign integers yields positive outputs, while opposite poles output negative ratios.",
                    "interactiveWidget": {
                      "type": "simulation",
                      "title": "Product Sign Balancer",
                      "config": { "type": "chemical-equation" }
                    }
                  },
                  {
                    "title": "Trigonometric Inclines",
                    "subtitle": "Angle Shifts relative to Cardinal Coordinates",
                    "content": "Measure angle slopes and fraction values. Observe coordinate steps.",
                    "interactiveWidget": {
                      "type": "simulation",
                      "title": "Quadrant Angle Slider",
                      "config": { "type": "angle-ratio-slider", "ratioType": "cosine" }
                    }
                  }
                ],
                "youtubeId": "bSMYPr0I5LI",
                "quizzes": [
                  {
                    "type": "conceptual",
                    "question": "What is the product of multiplying -8 by -5?",
                    "options": ["-40", "+40", "-13", "+3"],
                    "correctIndex": 1,
                    "explanation": "Multiplying two negative signs cancels the orientation filters, providing a positive output product: +40."
                  },
                  {
                    "type": "skill",
                    "question": "Solve the algebraic integer walk: -15 + (-6) - (-10)",
                    "options": ["-31", "-11", "-1", "+1"],
                    "correctIndex": 1,
                    "explanation": "-15 plus -6 gets -21. Subtracting negative 10 flips to +10, giving: -21 + 10 = -11."
                  },
                  {
                    "type": "hots",
                    "question": "Why does multiplying any positive integer by negative one yield its additive inverse?",
                    "options": ["It scales the coordinates twice", "Negative one flips coordinate direction 180 degrees around the origin point", "It deletes the mass", "It is an unproven theory"],
                    "correctIndex": 1,
                    "explanation": "Multiplying by -1 translates a point to the direct opposite side of the origin line, conserving absolute distance."
                  },
                  {
                    "type": "application",
                    "question": "A sub crawls underneath ocean waves at -120 meters. If it ascends 45 meters, what is its new elevation coordinate?",
                    "options": ["-165 meters", "-75 meters", "+75 meters", "+165 meters"],
                    "correctIndex": 1,
                    "explanation": "Ascending climbs coordinates: -120 + 45 = -75 meters below sea level."
                  }
                ],
                "summary": {
                  "title": "Integer Principles Recap",
                  "keyTakeaways": [
                    "Integers are entire counters containing positive, negative, and zero values.",
                    "Sign multiplication operates on coordinate polarity rules.",
                    "Double negative coefficients cancel to create positive steps.",
                    "Inversion targets zero origin offsets."
                  ],
                  "classroomActivity": "Coordinate step lines across floors to walk steps manually!",
                  "quickFact": "Ancient Indian mathematicians first designed negative numbers for tracking trading debts, using standard red lines!"
                }
              }
            ]
          },
          { "id": "c7-m-2", "name": "Chapter 2: Fractions and Decimals", "description": "Operations on fractions, multiplication and division of decimals.", "topics": [] },
          { "id": "c7-m-3", "name": "Chapter 3: Data Handling", "description": "Mean, median, mode, and bar graphs.", "topics": [] },
          { "id": "c7-m-4", "name": "Chapter 4: Simple Equations", "description": "Setting up and solving simple algebraic equations.", "topics": [] },
          { "id": "c7-m-5", "name": "Chapter 5: Lines and Angles", "description": "Related angles, pairs of lines, and transversals.", "topics": [] },
          { "id": "c7-m-6", "name": "Chapter 6: The Triangle and its Properties", "description": "Median, altitude, and Pythagoras theorem.", "topics": [] },
          { "id": "c7-m-7", "name": "Chapter 7: Comparing Quantities", "description": "Ratios, percentages, and profit and loss.", "topics": [] },
          { "id": "c7-m-8", "name": "Chapter 8: Rational Numbers", "description": "Positive and negative rational numbers, operations on them.", "topics": [] },
          { "id": "c7-m-9", "name": "Chapter 9: Perimeter and Area", "description": "Squares, rectangles, circles, and parallelograms.", "topics": [] },
          { "id": "c7-m-10", "name": "Chapter 10: Algebraic Expressions", "description": "Addition, subtraction, and finding values of expressions.", "topics": [] },
          { "id": "c7-m-11", "name": "Chapter 11: Exponents and Powers", "description": "Laws of exponents, decimal number system.", "topics": [] },
          { "id": "c7-m-12", "name": "Chapter 12: Symmetry", "description": "Line symmetry and rotational symmetry.", "topics": [] },
          { "id": "c7-m-13", "name": "Chapter 13: Visualising Solid Shapes", "description": "Introduction to 2D and 3D shapes, nets for building 3D shapes.", "topics": [] }
        ]
      }
    ]
  },
  {
    "id": "class-8",
    "name": "Class 8",
    "subjects": [
      {
        "id": "science",
        "name": "Science",
        "chapters": [
          {
            "id": "c8-s-1",
            "name": "Chapter 1: Crop Production",
            "description": "Agricultural methods, modern irrigation practices, and weed protection techniques.",
            "topics": [
              {
                "id": "c8-s-1-t1",
                "title": "Methods of Crop Cultivation",
                "description": "Deconstruct seed planting, advanced drip arrays, nitrogen fertilizing, and safe silo preservation.",
                "themeId": "forest-organic",
                "intro": {
                  "title": "The Irrigation & Crop Sciences",
                  "subtitle": "How Modern Farms Sustain Populations",
                  "content": "Farming is a precise cycle of natural biology, chemistry, and hydrology. By prepping seed beds, controlling weeds, and utilizing rotation, we nourish massive local urban systems efficiently.",
                  "keyConcepts": ["Root tilling & leveling", "Seed drill placements", "Drip & Sprinkler layouts", "Pest silo control techniques"]
                },
                "explanations": [
                  {
                    "title": "Preparing Soil Structures",
                    "subtitle": "Why Aeration Fuels Germination",
                    "content": "Tilling loosens dense dirt horizons. This exposes micro-nutrients, lets oxygen pool around developing roots, and helps roots lock deep into soil structures easily.",
                    "interactiveWidget": {
                      "type": "interactive-cards",
                      "title": "Agronomy Machine Modules",
                      "config": {
                        "items": [
                          { "title": "Iron Tine Cultivators", "desc": "Slicing tools pulled by engines to break up dry clay particles cleanly." },
                          { "title": "Seed Drills", "desc": "Precision tubes that plant seeds at perfect linear distances to stop crowd starving." },
                          { "title": "Levelers", "desc": "Heavy flat panels that squash deep air bubbles, preserving soil moisture." }
                        ]
                      }
                    }
                  },
                  {
                    "title": "Modern Hydration Loops",
                    "subtitle": "Water Efficiencies of Drip Irrigation",
                    "content": "Flooding crops is highly wasteful. Drip pipes drop moisture directly onto roots. Sprinklers mimic natural rain overhead without soil erosion.",
                    "interactiveWidget": {
                      "type": "diagram",
                      "title": "Water valve controllers",
                      "config": { "type": "stomata-state" }
                    }
                  },
                  {
                    "title": "The Nitrogen Catalyst",
                    "subtitle": "Organic Manure vs Molecular Chemicals",
                    "content": "Chemical nitrogen pellets provide immediate nutrient release, while biological compost layers slowly decay, restoring safe soil texture permanently.",
                    "interactiveWidget": {
                      "type": "simulation",
                      "title": "Foliage Area Multiplier",
                      "config": { "type": "surface-area-slider" }
                    }
                  },
                  {
                    "title": "Chemical Sieve Balancing",
                    "subtitle": "Neutralizing Soil Over-Acidity",
                    "content": "Excessive chemical fertilizers leave land sour and acidic. Adding basic slaked lime restores safe crop chemistry balancing.",
                    "interactiveWidget": {
                      "type": "simulation",
                      "title": "Acid-Base Balancer",
                      "config": { "type": "chemical-equation" }
                    }
                  }
                ],
                "youtubeId": "7m8vSreXW1s",
                "quizzes": [
                  {
                    "type": "conceptual",
                    "question": "What is the principal benefit of planting using mechanical seed drills?",
                    "options": ["It changes the color of seeds", "It places seeds at uniform standard depths & distances to avoid overcrowding", "It does not require human operators", "It uses diesel to fertilize seed hulls"],
                    "correctIndex": 1,
                    "explanation": "Placing seeds uniformly guarantees every grain secures identical allocations of nutrient minerals, hydration levels, and light."
                  },
                  {
                    "type": "skill",
                    "question": "Which irrigation configuration limits evaporation while managing extreme arid landscapes?",
                    "options": ["Flooding canals", "Drip system", "Spitfire sprinklers", "Moated buckets"],
                    "correctIndex": 1,
                    "explanation": "Drip lines drop moisture straight onto individual root tips, mitigating evaporative loss completely."
                  },
                  {
                    "type": "hots",
                    "question": "Why must biological grains undergo thorough drying before storage inside warehouses?",
                    "options": ["To lighten the cargo weight", "High humidity feeds fungal decay, insects, and devastating rot spores", "Grains shrink and double count in silos", "Moisture keeps seeds too green to eat"],
                    "correctIndex": 1,
                    "explanation": "Uncontrolled seed humidity fosters mold growth. Lowering humidity levels stops spore germination and insect breeding."
                  },
                  {
                    "type": "application",
                    "question": "A farmer discovers their soil pH is highly acidic, stifling cotton maturation. What compound corrects this balance?",
                    "options": ["Hydrochloric acid", "Calcium hydroxide (slaked lime)", "Powdered graphite", "Distilled alcohol"],
                    "correctIndex": 1,
                    "explanation": "Acidic, low pH horizons are neutralized using alkaline components like slaked lime, ensuring healthy absorption matrices."
                  }
                ],
                "summary": {
                  "title": "Agricultural Science Recaps",
                  "keyTakeaways": [
                    "Crop cycles begin with tilling soils to maximize gas circulation.",
                    "Drills place seeds at appropriate margins to allow healthy canopy expansion.",
                    "Drip networks conserve major aquiferous wells.",
                    "Drying and storing grains inside tall steel silos blocks pest contamination."
                  ],
                  "classroomActivity": "Compare sprouting speed of plants under flooded conditions against damp sand drip setups.",
                  "quickFact": "Modern sprinkler mechanisms rotate using water pressure alone, omitting auxiliary motors!"
                }
              }
            ]
          },
          { "id": "c8-s-2", "name": "Chapter 2: Microorganisms: Friend and Foe", "description": "Types of microorganisms, vaccines, and food preservation.", "topics": [] },
          { "id": "c8-s-3", "name": "Chapter 3: Coal and Petroleum", "description": "Natural resources, fossil fuels, and refining petroleum.", "topics": [] },
          { "id": "c8-s-4", "name": "Chapter 4: Combustion and Flame", "description": "Types of combustion, structure of flame, and fuels.", "topics": [] },
          { "id": "c8-s-5", "name": "Chapter 5: Conservation of Plants and Animals", "description": "Deforestation, wildlife sanctuaries, and national parks.", "topics": [] },
          { "id": "c8-s-6", "name": "Chapter 6: Reproduction in Animals", "description": "Sexual and asexual reproduction in animals.", "topics": [] },
          { "id": "c8-s-7", "name": "Chapter 7: Reaching the Age of Adolescence", "description": "Hormones, physical changes, and reproductive health.", "topics": [] },
          { "id": "c8-s-8", "name": "Chapter 8: Force and Pressure", "description": "Types of forces, pressure exerted by fluids.", "topics": [] },
          { "id": "c8-s-9", "name": "Chapter 9: Friction", "description": "Factors affecting friction, increasing and reducing friction.", "topics": [] },
          { "id": "c8-s-10", "name": "Chapter 10: Sound", "description": "Production and propagation of sound, audible and inaudible sounds.", "topics": [] },
          { "id": "c8-s-11", "name": "Chapter 11: Chemical Effects of Electric Current", "description": "Electroplating and chemical decomposition.", "topics": [] },
          { "id": "c8-s-12", "name": "Chapter 12: Some Natural Phenomena", "description": "Lightning, earthquakes, and protective measures.", "topics": [] },
          { "id": "c8-s-13", "name": "Chapter 13: Light", "description": "Reflection, multiple images, and the human eye.", "topics": [] }
        ]
      },
      {
        "id": "math",
        "name": "Mathematics",
        "chapters": [
          {
            "id": "c8-m-1",
            "name": "Chapter 1: Rational Numbers",
            "description": "Concepts of rational numbers, properties of closure, and inverse elements.",
            "topics": [
              {
                "id": "c8-m-1-t1",
                "title": "Properties of Rational Numbers",
                "description": "Explore numbers defined as fractions, closure laws, commutative checks, and identity values.",
                "themeId": "sunset-minimal",
                "intro": {
                  "title": "Understanding Fraction Ratios",
                  "subtitle": "The Universe of Rational Fields",
                  "content": "A rational number is any value representable as p/q, where p and q are integers and q is non-zero. They populate the space between points on coordinate vectors.",
                  "keyConcepts": ["Fraction forms p/q", "Closure algebra", "Identity limits (0 & 1)", "Reciprocals & inversions"]
                },
                "explanations": [
                  {
                    "title": "The Rational Fraction Scale",
                    "subtitle": "Placing ratios on coordinate positions",
                    "content": "Unlike integers, rational fractions can divide space infinitely. Any coordinates can be halved, quartered, or multiplied to create precise positions.",
                    "interactiveWidget": {
                      "type": "interactive-cards",
                      "title": "Explore Properties",
                      "config": {
                        "items": [
                          { "title": "Closure Law", "desc": "Adding two rationals always provides another rational. The system is closed." },
                          { "title": "Commutative Rules", "desc": "Order of addition fits commutative checks: x + y equals y + x." },
                          { "title": "Associative Property", "desc": "Grouping coordinates with brackets does not modify sums." }
                        ]
                      }
                    }
                  },
                  {
                    "title": "The Identity Elements",
                    "subtitle": "Values of Zero and One",
                    "content": "Adding zero leaves rational scales unchanged (additive identity). Multiplying by one maintains original values (multiplicative identity).",
                    "interactiveWidget": {
                      "type": "diagram",
                      "title": "Identity Coordinate States",
                      "config": { "type": "stomata-state" }
                    }
                  },
                  {
                    "title": "Solving Reciprocals",
                    "subtitle": "Flipping Fractions to Target Unity",
                    "content": "Every non-zero rational has a reciprocal fraction. Multiplying a fraction with its flipped version balances to one.",
                    "interactiveWidget": {
                      "type": "simulation",
                      "title": "Rational Formula Balancer",
                      "config": { "type": "chemical-equation" }
                    }
                  },
                  {
                    "title": "Geometric Slopes",
                    "subtitle": "Slopes as Rational Incline Angles",
                    "content": "Linear slopes are simple fractions of vertical rise over horizontal run. Discover rational gradients.",
                    "interactiveWidget": {
                      "type": "simulation",
                      "title": "Slope Angle Ratios",
                      "config": { "type": "angle-ratio-slider", "ratioType": "sine" }
                    }
                  }
                ],
                "youtubeId": "UPBMG5EYV_I",
                "quizzes": [
                  {
                    "type": "conceptual",
                    "question": "Which criterion defines a number as purely rational?",
                    "options": ["It must contain a square root", "It represents any fraction p/q where q is non-zero", "It must be greater than one thousand", "It is only divisible by itself"],
                    "correctIndex": 1,
                    "explanation": "A rational number must be representable as a ratio of two integers with a non-zero denominator."
                  },
                  {
                    "type": "skill",
                    "question": "What is the sum of fractions 3/5 and 2/7?",
                    "options": ["5/12", "31/35", "6/35", "11/35"],
                    "correctIndex": 1,
                    "explanation": "Find a common denominator of 35. This yields (3*7 + 2*5) / 35 = (21 + 10) / 35 = 31/35."
                  },
                  {
                    "type": "hots",
                    "question": "Why is division not closed over the set of all rational numbers?",
                    "options": ["Fractions cannot have odd denominators", "Dividing by zero is undefined, breaking the closure restriction of rationals", "Multiplying takes precedence over division", "Numbers shrink when divided"],
                    "correctIndex": 1,
                    "explanation": "Dividing by zero is impossible. Since zero is a rational number, division breaks closure due to this exception."
                  },
                  {
                    "type": "application",
                    "question": "If a floor board length is 4/3 meters, what reciprocal length fits x board units to pave exactly 1 meter?",
                    "options": ["-4/3", "3/4", "1/3", "4"],
                    "correctIndex": 1,
                    "explanation": "Multiply the rational value by its reciprocal to equal 1: 4/3 * 3/4 = 1."
                  }
                ],
                "summary": {
                  "title": "Rational Properties Recap",
                  "keyTakeaways": [
                    "Rational numbers represent coordinate segments between integers.",
                    "The system maintains strict closure under addition, subtraction, and multiplication.",
                    "Additive inversions sum to zero, while reciprocals multiply to one.",
                    "Fraction denominators can never represent zero boundaries."
                  ],
                  "classroomActivity": "Write down fractions on card slips and pair partners who hold complementary reciprocal fractions to see who multiplies to 1 fastest!",
                  "quickFact": "The word 'Rational' comes from the Latin coordinate 'ratio', which means reasoning or accounting relationships rather than sanity boundaries!"
                }
              }
            ]
          },
          { "id": "c8-m-2", "name": "Chapter 2: Linear Equations in One Variable", "description": "Solving equations with variables on one or both sides.", "topics": [] },
          { "id": "c8-m-3", "name": "Chapter 3: Understanding Quadrilaterals", "description": "Polygons, sum of angles, and types of quadrilaterals.", "topics": [] },
          { "id": "c8-m-4", "name": "Chapter 4: Data Handling", "description": "Organising data, circle graphs (pie charts), and probability.", "topics": [] },
          { "id": "c8-m-5", "name": "Chapter 5: Squares and Square Roots", "description": "Properties of square numbers, finding square roots.", "topics": [] },
          { "id": "c8-m-6", "name": "Chapter 6: Cubes and Cube Roots", "description": "Properties of cube numbers, finding cube roots.", "topics": [] },
          { "id": "c8-m-7", "name": "Chapter 7: Comparing Quantities", "description": "Discounts, tax, and compound interest.", "topics": [] },
          { "id": "c8-m-8", "name": "Chapter 8: Algebraic Expressions and Identities", "description": "Monomials, binomials, and standard identities.", "topics": [] },
          { "id": "c8-m-9", "name": "Chapter 9: Mensuration", "description": "Area of trapezium, polygon, and surface area of solids.", "topics": [] },
          { "id": "c8-m-10", "name": "Chapter 10: Exponents and Powers", "description": "Powers with negative exponents, laws of exponents.", "topics": [] },
          { "id": "c8-m-11", "name": "Chapter 11: Direct and Inverse Proportions", "description": "Direct proportion, inverse proportion, and applications.", "topics": [] },
          { "id": "c8-m-12", "name": "Chapter 12: Factorisation", "description": "Factors of natural numbers, division of polynomials.", "topics": [] },
          { "id": "c8-m-13", "name": "Chapter 13: Introduction to Graphs", "description": "Line graphs, linear graphs, and coordinates.", "topics": [] }
        ]
      }
    ]
  },
  {
    "id": "class-9",
    "name": "Class 9",
    "subjects": [
      {
        "id": "science",
        "name": "Science",
        "chapters": [
          { "id": "c9-s-1", "name": "Chapter 1: Matter in Our Surroundings", "description": "Physical nature of matter, states of matter, and evaporation.", "topics": [] },
          { "id": "c9-s-2", "name": "Chapter 2: Is Matter Around Us Pure", "description": "Mixtures, solutions, and physical and chemical changes.", "topics": [] },
          { "id": "c9-s-3", "name": "Chapter 3: Atoms and Molecules", "description": "Laws of chemical combination, atomic and molecular masses.", "topics": [] },
          { "id": "c9-s-4", "name": "Chapter 4: Structure of the Atom", "description": "Charged particles, atomic models, and valency.", "topics": [] },
          {
            "id": "c9-s-5",
            "name": "Chapter 5: The Fundamental Unit of Life",
            "description": "Cell biology, active organelle structures, and thermodynamic power conversion inside the mitochondrion.",
            "topics": [
              {
                "id": "c9-s-5-t1",
                "title": "Mitochondria: Powerhouse of the Cell",
                "description": "Explore outer membranes, cristae area multipliers, ATP enzyme synthase turbines, and cellular respiration.",
                "themeId": "sophisticated-dark",
                "intro": {
                  "title": "Mitochondria Organelle",
                  "subtitle": "The Thermal Engines of Animal Life",
                  "content": "Every microsecond, trillions of cells combustion food. Mitochondria act are chemical fuel refineries, converting starch into energy currencies (Adenosine Triphosphate - ATP) to fuel active movement.",
                  "keyConcepts": ["Double-biomembrane systems", "Folding Cristae surface areas", "The Proton Gradient battery", "ATP Synthase molecular rotors"]
                },
                "explanations": [
                  {
                    "title": "A Tale of Two Membranes",
                    "subtitle": "The double protective shield layers",
                    "content": "Our outer membrane has porous sieves to let sugar nutrients enter. The inner membrane acts like a strict plastic molecular wall, retaining specific proton ions to create high charge ratios.",
                    "interactiveWidget": {
                      "type": "interactive-cards",
                      "title": "Membrane Modules",
                      "config": {
                        "items": [
                          { "title": "Outer Porin Sieve", "desc": "Allows basic nutrient molecules blockless entry. Keeps core locked." },
                          { "title": "Intermembrane Space", "desc": "The chemical battery. Holds high concentrations of positive hydrogen protons." },
                          { "title": "Inner Crystal Barrier", "desc": "Sleek and tight. Stops proton leaks to preserve battery charge." }
                        ]
                      }
                    }
                  },
                  {
                    "title": "Folding Space: Cristae Area",
                    "subtitle": "Why folded designs multiply enzyme pathways",
                    "content": "Flat sheets limit surface areas. Folded membranes create massive surface territories, enabling thousands of respiratory enzymes to dock and build molecular power plants.",
                    "interactiveWidget": {
                      "type": "simulation",
                      "title": "Cristae Area Multiplier",
                      "config": { "type": "surface-area-slider" }
                    }
                  },
                  {
                    "title": "ATP Synthase: Molecular Motor",
                    "subtitle": "Rotory protein generators spins",
                    "content": "Protons are forced through a rotating enzyme tunnel. This rotational speed binds phosphate ions onto ADP, manufacturing stable ATP fuel cells representing molecular biological batteries.",
                    "interactiveWidget": {
                      "type": "diagram",
                      "title": "Stomatal and Proton State Gates",
                      "config": { "type": "stomata-state" }
                    }
                  },
                  {
                    "title": "Respiration Equations",
                    "subtitle": "Combustion chemistry of standard glucose",
                    "content": "1 Glucose molecule burns in 6 Oxygen elements to yield 6 Carbon Dioxide molecules, 6 Water molecules and 38 ATP battery cells. Formula is perfectly balanced.",
                    "interactiveWidget": {
                      "type": "simulation",
                      "title": "Glucose Oxidizer Balancer",
                      "config": { "type": "chemical-equation" }
                    }
                  }
                ],
                "youtubeId": "39HTpUG1MwQ",
                "quizzes": [
                  {
                    "type": "conceptual",
                    "question": "Which molecule acts as the direct chemical energy fuel cell inside living organisms?",
                    "options": ["Adrenaline", "Adenosine Triphosphate (ATP)", "Deoxyribonucleic Acid", "Glucose"],
                    "correctIndex": 1,
                    "explanation": "ATP is the molecular unit of monetary energy currency, synthesized by the rotory ATP Synthase turbine."
                  },
                  {
                    "type": "skill",
                    "question": "What is the principal biological purpose of the folds (Cristae) on the inner mitochondrial sheet?",
                    "options": ["To filter incoming waste water", "To multiply effective molecular surface area to accommodate more respiration pathways", "To protect the cell from cellular virus threats", "To store iron minerals"],
                    "correctIndex": 1,
                    "explanation": "Cristae folds compress immense surface area into tiny organelle volumes, accelerating respiration."
                  },
                  {
                    "type": "hots",
                    "question": "Why are mitochondria called 'semi-autonomous' biological organelles?",
                    "options": ["They swim independently in host bloodstreams", "They possess their own direct circular DNA and protein-manufacturing ribosomes", "They function without any metabolic cell assistance", "They are created outside host organisms"],
                    "correctIndex": 1,
                    "explanation": "Having unique mitochondrial DNA (mDNA) and ribosomes allows them to breed and synthesize enzymes independently."
                  },
                  {
                    "type": "application",
                    "question": "An athlete undergoes a rigorous sprint. What occurs to the mitochondria counts inside their physical leg muscles over time?",
                    "options": ["Mitochondria shrink in number due to metabolic fatigue", "Exercise demands fuel, triggering mitochondria replication to handle higher energy loads", "Mitochondria turn into toxic chemical crystal structures", "Count remains flat"],
                    "correctIndex": 1,
                    "explanation": "Training signals biological adaptation, raising mitochondria density inside target tissues."
                  }
                ],
                "summary": {
                  "title": "Mitochondria Lessons Recap",
                  "keyTakeaways": [
                    "Double membranes create high-fidelity biological cellular battery bounds.",
                    "Cristae folds compress vast chemical catalyst spaces.",
                    "Proton fluid gradients turn molecular rotory engines.",
                    "Mitochondrial DNA directs organelle self-replication."
                  ],
                  "classroomActivity": "Trace the ATP Synthase rotor on paper, stand in circles, and run clockwise when proton tokens enter the gate!",
                  "quickFact": "You inherit all of your mitochondrial cells purely from your mother! Paternal mitochondria in sperm are discarded upon fertilization!"
                }
              }
            ]
          },
          { "id": "c9-s-6", "name": "Chapter 6: Tissues", "description": "Plant and animal tissues, meristematic and permanent tissues.", "topics": [] },
          { "id": "c9-s-7", "name": "Chapter 7: Motion", "description": "Distance, displacement, uniform and non-uniform motion.", "topics": [] },
          { "id": "c9-s-8", "name": "Chapter 8: Force and Laws of Motion", "description": "Balanced and unbalanced forces, Newton's laws of motion.", "topics": [] },
          { "id": "c9-s-9", "name": "Chapter 9: Gravitation", "description": "Universal law of gravitation, free fall, and mass and weight.", "topics": [] },
          { "id": "c9-s-10", "name": "Chapter 10: Work and Energy", "description": "Work, kinetic and potential energy, and law of conservation of energy.", "topics": [] },
          { "id": "c9-s-11", "name": "Chapter 11: Sound", "description": "Production and propagation of sound, reflection of sound, and ultrasound.", "topics": [] },
          { "id": "c9-s-12", "name": "Chapter 12: Improvement in Food Resources", "description": "Crop variety improvement, animal husbandry, and organic farming.", "topics": [] }
        ]
      },
      {
        "id": "math",
        "name": "Mathematics",
        "chapters": [
          { "id": "c9-m-1", "name": "Chapter 1: Number Systems", "description": "Rational and irrational numbers, laws of exponents for real numbers.", "topics": [] },
          { "id": "c9-m-2", "name": "Chapter 2: Polynomials", "description": "Zeroes of a polynomial, remainder theorem, and algebraic identities.", "topics": [] },
          {
            "id": "c9-m-3",
            "name": "Chapter 3: Coordinate Geometry",
            "description": "Plotting points, navigating quadrants, and calculating distances with the coordinate plane.",
            "topics": [
              {
                "id": "c9-m-3-t1",
                "title": "The Geometry of Coordinate Planes",
                "description": "Plot Cartesian points across axes, analyze signs, and calculate Euclidean distance vectors.",
                "themeId": "cyberpunk",
                "intro": {
                  "title": "Coordinate Planes Mapping",
                  "subtitle": "Grid Physics of Descartes",
                  "content": "By crossing horizontal and vertical number grid lines, René Descartes created coordinate geometry, uniting mathematical numbers with physical geometry shapes cleanly.",
                  "keyConcepts": ["Perpendicular axes coordinates", "Origin baseline points (0,0)", "Signature sign combinations", "Pythagorean distance calculations"]
                },
                "explanations": [
                  {
                    "title": "The 4 Spatial Quadrants",
                    "subtitle": "Navigating Coordinate Spaces",
                    "content": "Quadrant I spans (+,+); Quadrant II bridges (-,+); Quadrant III hosts (-,-); and Quadrant IV charts (+,-). Coordinates position points safely.",
                    "interactiveWidget": {
                      "type": "interactive-cards",
                      "title": "Quadrant Elements",
                      "config": {
                        "items": [
                          { "title": "First Quadrant (+, +)", "desc": "Both coordinates hold positive coefficients. Top right grid." },
                          { "title": "Second Quadrant (-, +)", "desc": "Leftward X, upward Y steps. Top left grid." },
                          { "title": "Third Quadrant (-, -)", "desc": "Leftward X, downward Y. Bottom left grid." }
                        ]
                      }
                    }
                  },
                  {
                    "title": "The Origin Benchmark",
                    "subtitle": "The foundational reference (0, 0)",
                    "content": "All grid coordinates derive distances relative to the intersection point termed the Origin. At this exact point, all axes equal zero.",
                    "interactiveWidget": {
                      "type": "diagram",
                      "title": "Define Origin State",
                      "config": { "type": "stomata-state" }
                    }
                  },
                  {
                    "title": "Euclidean Distance Solver",
                    "subtitle": "Determining Distances with Right Triangles",
                    "content": "Distance matches the hypotenuse length connecting points. Solving involves squaring coordinate offsets, summing them, and calculating root variables.",
                    "interactiveWidget": {
                      "type": "simulation",
                      "title": "Distance Solver Balancer",
                      "config": { "type": "chemical-equation" }
                    }
                  },
                  {
                    "title": "Inclined Angles & Vectors",
                    "subtitle": "Trigonometric Coordinate Projections",
                    "content": "A vector pointing from the origin forms an angle. Observe trigonometry tracking parameters.",
                    "interactiveWidget": {
                      "type": "simulation",
                      "title": "Angle Projection tracker",
                      "config": { "type": "angle-ratio-slider", "ratioType": "sine" }
                    }
                  }
                ],
                "youtubeId": "UPBMG5EYV_I",
                "quizzes": [
                  {
                    "type": "conceptual",
                    "question": "Which coordinate grid quadrant hosts points showing values (-5, 12)?",
                    "options": ["Quadrant I", "Quadrant II", "Quadrant III", "Quadrant IV"],
                    "correctIndex": 1,
                    "explanation": "A negative X (-5) and positive Y (12) maps to the top-left section, which is Quadrant II."
                  },
                  {
                    "type": "skill",
                    "question": "What is the straight line distance between point (0, 3) and coordinate point (4, 0)?",
                    "options": ["5 units", "7 units", "25 units", "1 unit"],
                    "correctIndex": 0,
                    "explanation": "Distance = sqrt((4-0)² + (0-3)²) = sqrt(16 + 9) = sqrt(25) = 5 units."
                  },
                  {
                    "type": "hots",
                    "question": "If a plotted coordinate has a Y-value of zero, where does it sit?",
                    "options": ["It floats in Quadrant III", "It rests exactly on the horizontal X-axis line", "It is on the Y-axis", "It cannot be plotted"],
                    "correctIndex": 1,
                    "explanation": "Since there is zero vertical displacement, the point resides directly along the horizontal X-axis line."
                  },
                  {
                    "type": "application",
                    "question": "A map plots coordinates. A road starts at (2, 5) and goes left to (-4, 5). What is the total length of this road?",
                    "options": ["6 units", "2 units", "10 units", "8 units"],
                    "correctIndex": 0,
                    "explanation": "Since Y is identical (5), displacement is purely horizontal: |2 - (-4)| = |2 + 4| = 6 units."
                  }
                ],
                "summary": {
                  "title": "Coordinate Principles Recap",
                  "keyTakeaways": [
                    "Coordinates grid space into positive and negative regions.",
                    "Quadrants are defined by mathematical combinations of signs.",
                    "Euclidean formula uses Pythagoras' theorem to find flat distances.",
                    "Origin baseline provides the anchors for maps."
                  ],
                  "classroomActivity": "Tape a massive coordinate lane onto the school floor and plot classmates!",
                  "quickFact": "René Descartes allegedly was inspired by tracking a housefly crawling on ceiling timber grids!"
                }
              }
            ]
          },
          { "id": "c9-m-4", "name": "Chapter 4: Linear Equations in Two Variables", "description": "Solution of a linear equation, graph of a linear equation.", "topics": [] },
          { "id": "c9-m-5", "name": "Chapter 5: Introduction to Euclid’s Geometry", "description": "Euclid’s definitions, axioms and postulates.", "topics": [] },
          { "id": "c9-m-6", "name": "Chapter 6: Lines and Angles", "description": "Basic terms, intersecting and non-intersecting lines.", "topics": [] },
          { "id": "c9-m-7", "name": "Chapter 7: Triangles", "description": "Congruence of triangles, properties of a triangle.", "topics": [] },
          { "id": "c9-m-8", "name": "Chapter 8: Quadrilaterals", "description": "Angle sum property, types of quadrilaterals.", "topics": [] },
          { "id": "c9-m-9", "name": "Chapter 9: Circles", "description": "Circle and its related terms, angle subtended by a chord.", "topics": [] },
          { "id": "c9-m-10", "name": "Chapter 10: Heron’s Formula", "description": "Area of a triangle by Heron’s formula.", "topics": [] },
          { "id": "c9-m-11", "name": "Chapter 11: Surface Areas and Volumes", "description": "Surface area and volume of cone, sphere, and cylinder.", "topics": [] },
          { "id": "c9-m-12", "name": "Chapter 12: Statistics", "description": "Graphical representation of data, measures of central tendency.", "topics": [] }
        ]
      }
    ]
  },
  {
    "id": "class-10",
    "name": "Class 10",
    "subjects": [
      {
        "id": "science",
        "name": "Science",
        "chapters": [
          {
            "id": "c10-s-1",
            "name": "Chapter 1: Chemical Reactions",
            "description": "Equation balancing, oxidation-reduction, combining elements, and stoichiometric ratios.",
            "topics": [
              {
                "id": "ncert-ch1-chemical-equations",
                "title": "Chemical Equations",
                "description": "Understand how to represent chemical reactions, balance them using the Hit-and-Trial method, and apply physical state symbols.",
                "themeId": "ocean-tech",
                "intro": {
                  "title": "Chemical Equations",
                  "subtitle": "NCERT Class 10 Science - Chapter 1",
                  "content": "A symbolic representation of a chemical reaction using symbols and chemical formulas of the substances involved. Learn to read, write, and balance these fundamental scientific statements.",
                  "keyConcepts": [
                    "Reactants and Products",
                    "Law of Conservation of Mass",
                    "Hit-and-Trial Balancing Method",
                    "Physical State Notations"
                  ]
                },
                "explanations": [
                  {
                    "title": "What is a Chemical Equation?",
                    "subtitle": "Representing Chemical Reactions",
                    "content": "A chemical reaction can be represented in the form of a word equation or a chemical equation. A word equation uses the names of substances involved in the reaction, while a chemical equation uses chemical symbols and formulas, making it shorter, clearer, and more scientific. In every chemical equation, the reactants are written on the Left-Hand Side (LHS), and the products are written on the Right-Hand Side (RHS). An arrow (→) is placed between them to indicate that the reactants undergo a chemical change to form products. The arrow is read as 'yields', 'forms', or 'produces'. Example: Magnesium + Oxygen → Magnesium oxide or Mg + O₂ → MgO.",
                    "imageUrl": "assets/chemical_rection.png",
                    "interactiveWidget": {
                      "type": "interactive-cards",
                      "config": {
                        "items": [
  {
    "title": "Reactants",
    "description": "The starting substances that undergo chemical change during a chemical reaction. Reactants are written on the Left-Hand Side (LHS) of a chemical equation. When more than one reactant is involved, they are separated using a plus sign (+). During the reaction, the atoms of the reactants rearrange to form new substances called products. Example: In the reaction Mg + O₂ → MgO, magnesium (Mg) and oxygen (O₂) are the reactants."
  },
  {
    "title": "Products",
    "description": "The new substances formed as a result of a chemical reaction are called products. Products are written on the Right-Hand Side (RHS) of a chemical equation. If multiple products are formed, they are separated using a plus sign (+). Products usually have properties different from the reactants because a chemical change has taken place. Example: In the reaction Mg + O₂ → MgO, magnesium oxide (MgO) is the product formed."
  },
  {
    "title": "Word Equation",
    "description": "A word equation represents a chemical reaction using the names of substances instead of chemical symbols or formulas. It helps in understanding the reaction in a simple and easy manner, especially for beginners. In a word equation, reactants are written on the left side and products on the right side, separated by an arrow (→) which means 'yields' or 'produces'. Example: Magnesium + Oxygen → Magnesium oxide. This shows that magnesium reacts with oxygen to produce magnesium oxide."
  },
  {
    "title": "Chemical Formula Equation",
    "description": "A chemical formula equation represents a chemical reaction using chemical symbols and formulas instead of full names. It provides a shorter, more precise, and scientific way of writing reactions. Chemical equations also help in understanding the number and types of atoms involved in the reaction. Example: Mg + O₂ → MgO. Here, Mg represents magnesium, O₂ represents oxygen molecules, and MgO represents magnesium oxide formed after the reaction."
  }
]
                      }
                    }
                  },
                  {
                    "title": "Balanced Chemical Equations",
                    "subtitle": "Conservation of Mass in Reactions",
                    "content": "The Law of Conservation of Mass states that mass can neither be created nor destroyed during a chemical reaction. This means that the total mass of all the reactants before the reaction is always equal to the total mass of all the products formed after the reaction. In a chemical reaction, atoms are only rearranged to form new substances, but no atoms are lost or gained. Therefore, the number and mass of atoms of each element remain conserved throughout the reaction. This is why chemical equations must be balanced to ensure that the total mass on both sides of the equation remains equal.",
                    "imageUrl": "assets/Gemini_Generated_Image_bfxmuxbfxmuxbfxm.png",
                    "interactiveWidget": {
                      "type": "interactive-cards",
                      "config": {
                        "items": [
  {
    "title": "Law of Conservation of Mass",
    "description": "The Law of Conservation of Mass states that mass can neither be created nor destroyed during a chemical reaction. Therefore, the total mass of all the reactants before the reaction is always equal to the total mass of all the products formed after the reaction. During a reaction, atoms are only rearranged to form new substances, but the overall mass remains constant. This law forms the basis for balancing chemical equations."
  },
  {
    "title": "Atom Balance",
    "description": "In a chemical reaction, the number of atoms of each element remains the same before and after the reaction. Atoms are neither created nor destroyed; they are simply rearranged into new combinations. Therefore, every chemical equation must have equal numbers of each type of atom on both the Left-Hand Side (LHS) and the Right-Hand Side (RHS). This equality of atoms is called atom balance."
  },
  {
    "title": "Skeletal Equation",
    "description": "A skeletal equation is an unbalanced chemical equation in which the number of atoms of one or more elements is not equal on both sides of the equation. It only shows the formulas of reactants and products without balancing the atoms. Example: Mg + O₂ → MgO. In this equation, oxygen atoms are not balanced because there are two oxygen atoms on the reactant side but only one oxygen atom on the product side."
  },
  {
    "title": "Balanced Equation",
    "description": "A balanced chemical equation is an equation in which the number of atoms of each element is equal on both the reactant side and the product side. Balancing ensures that the Law of Conservation of Mass is followed. Coefficients are added before chemical formulas to balance the equation without changing the formulas themselves. Example: 2Mg + O₂ → 2MgO. Here, both sides contain 2 magnesium atoms and 2 oxygen atoms, making the equation balanced."
  }
]
                      }
                    }
                  },
                  {
                    "title": "Balancing Equations step-by-step",
                    "subtitle": "The Hit-and-Trial Method",
                    "content": "A chemical equation is balanced by adjusting the coefficients, which are the numbers placed before chemical formulas, and not by changing the subscripts within the formulas. Changing subscripts would alter the chemical identity of the substances involved. While balancing, the number of atoms of each element must become equal on both the Left-Hand Side (LHS) and the Right-Hand Side (RHS) of the equation. For example, consider the skeletal equation: Fe + H₂O → Fe₃O₄ + H₂. To balance it, coefficients are adjusted so that the number of iron, hydrogen, and oxygen atoms becomes equal on both sides. The balanced equation is: 3Fe + 4H₂O → Fe₃O₄ + 4H₂.",
                    "imageUrl": "assets/chem3.png",
                    "interactiveWidget": {
                      "type": "interactive-cards",
                      "config": {
                        "items": [
                          {
    "title": "Step 1: Count Atoms",
    "description": "The first step in balancing a chemical equation is to count the number of atoms of each element present on both the Left-Hand Side (LHS) and the Right-Hand Side (RHS) of the equation. This helps identify which elements are unbalanced. For the equation Fe + H₂O → Fe₃O₄ + H₂: LHS contains Fe = 1 atom, H = 2 atoms, and O = 1 atom, while RHS contains Fe = 3 atoms, H = 2 atoms, and O = 4 atoms. Since the number of atoms is not equal on both sides, the equation is unbalanced."
  },
  {
    "title": "Step 2: Balance Oxygen",
    "description": "Begin balancing the equation by choosing an element that appears in fewer compounds. Oxygen is unbalanced because there is 1 oxygen atom on the LHS and 4 oxygen atoms on the RHS. To balance oxygen atoms, place a coefficient of 4 before H₂O on the LHS. The equation becomes: Fe + 4H₂O → Fe₃O₄ + H₂. Now both sides contain 4 oxygen atoms."
  },
  {
    "title": "Step 3: Balance Hydrogen",
    "description": "After balancing oxygen, check the hydrogen atoms. On the LHS, 4H₂O contains 8 hydrogen atoms in total. On the RHS, H₂ contains only 2 hydrogen atoms. To balance hydrogen, place a coefficient of 4 before H₂ on the RHS. The equation now becomes: Fe + 4H₂O → Fe₃O₄ + 4H₂. Both sides now contain 8 hydrogen atoms."
  },
  {
    "title": "Step 4: Balance Iron",
    "description": "Finally, balance the iron atoms. The RHS contains 3 iron atoms in Fe₃O₄, while the LHS contains only 1 iron atom. Place a coefficient of 3 before Fe on the LHS. The balanced equation becomes: 3Fe + 4H₂O → Fe₃O₄ + 4H₂. Now the number of atoms of each element is equal on both sides, satisfying the Law of Conservation of Mass."
  }
                        ]
                      }
                    }
                  },
                  {
                    "title": "Writing Symbols of Physical States",
                    "subtitle": "Adding Context to Reactions",
                    "content": "A chemical equation can be made more informative by including the physical states of the reactants and products along with their chemical formulas. The physical states are represented using symbols such as (s) for solid, (l) for liquid, (g) for gas, and (aq) for aqueous solution. These symbols help in understanding the nature of the substances involved in the reaction. In addition, special reaction conditions such as temperature, pressure, catalyst, heat, or light are written above or below the reaction arrow (→). These conditions indicate the specific requirements needed for the reaction to occur. Example: 2H₂(g) + O₂(g) → 2H₂O(l).",
                     "imageUrl": "assets/Gemini_Generated_Image_bfxmuxbfxmuxbfxm_Copy.png",
                    "interactiveWidget": {
                      "type": "interactive-cards",
                      "config": {
                        "items": [
                          {
    "title": "State Notations",
    "description": "In chemical equations, the physical states of reactants and products are represented using specific symbols called state notations. These symbols help in identifying whether a substance is present as a solid, liquid, gas, or aqueous solution. The notation (s) represents solid state, (l) represents liquid state, (g) represents gaseous state, and (aq) represents an aqueous solution. These notations are written beside the chemical formulas to make the equation more informative and scientifically accurate."
  },
  {
    "title": "Aqueous (aq)",
    "description": "The notation (aq) stands for aqueous solution and is used when a substance is dissolved in water. It indicates that the reactant or product is present in the form of ions or molecules mixed uniformly with water. Many chemical reactions, especially in laboratories and biological systems, occur in aqueous solutions. Example: NaCl(aq) means sodium chloride dissolved in water."
  },
  {
    "title": "Reaction Conditions",
    "description": "Certain chemical reactions require specific conditions such as heat, temperature, pressure, light, or catalysts for the reaction to occur efficiently. These conditions are usually written above or below the reaction arrow in a chemical equation. Mentioning reaction conditions makes the equation more descriptive and helps in understanding the exact circumstances under which the reaction takes place."
  },
  {
    "title": "Example Equation",
    "description": "Example: CO(g) + 2H₂(g) → CH₃OH(l). In this reaction, carbon monoxide gas reacts with hydrogen gas under high pressure (340 atm) to form liquid methanol. The symbols (g) and (l) indicate the physical states of the substances involved, while the pressure condition written near the arrow shows the special requirement for the reaction."
  }
                        ]
                      }
                    }
                  }
                ],
                "youtubeId": "https://www.youtube.com/watch?v=zmdxMlb88Fs",
                "quizzes": [
    {
      "type": "CONCEPTUAL",
      "question": "In a chemical equation, what are the substances written on the Left-Hand Side (LHS) called?",
      "options": [
        "Products",
        "Reactants",
        "Catalysts",
        "Solutions"
      ],
      "correctIndex": 1,
      "explanation": "Reactants are the starting substances written on the Left-Hand Side (LHS) of a chemical equation. They undergo chemical change during the reaction."
    },
    {
      "type": "SKILL BASED",
      "question": "Why must a chemical equation be balanced?",
      "options": [
        "To change the chemical formulas",
        "To satisfy the Law of Conservation of Mass",
        "To increase the speed of reaction",
        "To reduce the number of reactants"
      ],
      "correctIndex": 1,
      "explanation": "A chemical equation must be balanced to satisfy the Law of Conservation of Mass, which states that mass can neither be created nor destroyed during a chemical reaction."
    },
    {
      "type": "REAL LIFE APPLICATION",
      "question": "What information does the notation '(aq)' provide in a chemical equation?",
      "options": [
        "The substance is acidic",
        "The substance is dissolved in water",
        "The substance is in gaseous state",
        "The substance is heated"
      ],
      "correctIndex": 1,
      "explanation": "The notation (aq) stands for aqueous solution, meaning the substance is dissolved in water."
    },
    {
      "type": "HOTS",
      "question": "While balancing a chemical equation, what should be changed to balance the number of atoms?",
      "options": [
        "Subscripts in chemical formulas",
        "Chemical symbols",
        "Coefficients before formulas",
        "Names of reactants"
      ],
      "correctIndex": 2,
      "explanation": "Chemical equations are balanced by changing the coefficients placed before chemical formulas, not by altering the subscripts within the formulas."
    }
  ],
                "summary": {
                  "title": "Chemical Equations Summary",
                  "keyTakeaways": [
                    "Chemical equations use formulas to represent reactions efficiently.",
                    "The Law of Conservation of Mass dictates that atoms are conserved, necessitating balanced equations.",
                    "The Hit-and-Trial method balances equations by adjusting coefficients without altering chemical formulas.",
                    "Physical state symbols (s, l, g, aq) and reaction conditions provide complete information about the chemical event."
                  ],
                  "classroomActivity": "Divide the class into pairs. Write an unbalanced skeletal equation on the board, such as 'Fe + O₂ → Fe₂O₃'. Have one student count the starting atoms of each element, and the other student apply coefficients step-by-step using the Hit-and-Trial method to balance it.",
                  "quickFact": "The reaction conditions, such as temperature, pressure, or a catalyst, are always written above or below the arrow to prevent confusing them with reactants or products."
                }
              },
              {
  "id": "ncert-ch1-types-of-reactions",
  "title": "Types of Chemical Reactions",
  "description": "Explore the different types of chemical reactions including combination, decomposition, displacement, double displacement, and redox reactions.",
  "themeId": "ocean-tech",
  "intro": {
    "title": "Types of Chemical Reactions",
    "subtitle": "NCERT Class 10 Science - Chapter 1",
    "content": "Chemical reactions involve the breaking of old chemical bonds and the formation of new bonds between atoms, resulting in the creation of new substances with different properties. During these processes, energy may either be released or absorbed depending on the nature of the reaction. Chemical reactions are broadly classified into five major categories: combination reactions, decomposition reactions, displacement reactions, double displacement reactions, and redox reactions. Understanding these reaction types helps explain many natural processes, industrial applications, and everyday phenomena such as rusting, combustion, digestion, and photosynthesis.",
    "keyConcepts": [
      "Combination & Decomposition",
      "Displacement & Double Displacement",
      "Oxidation and Reduction (Redox)",
      "Exothermic & Endothermic Processes"
    ]
  },
  "explanations": [
    {
      "title": "Combination Reactions",
      "subtitle": "Bringing Elements Together",
      "content": "A combination reaction is a chemical reaction in which two or more reactants combine together to form a single product. In these reactions, simpler substances join to produce a more complex substance. Many combination reactions release a large amount of heat and energy during the process, making them exothermic reactions. These reactions are commonly observed in everyday life as well as in industrial processes. Example: CaO + H₂O → Ca(OH)₂. In this reaction, calcium oxide combines with water to form calcium hydroxide while releasing heat.",
      "imageUrl": "assets/ch_2_1.png",
      "layout": "split-right",
      "interactiveWidget": {
        "type": "interactive-cards",
        "config": {
          "items": [
           {
"title": "Combination Concept",
"description": "General form: A + B → AB. In a combination reaction, two or more substances (which can be elements or compounds) react together to form a single new product. These reactions are also called synthesis reactions because simpler substances join to make something more complex."
},
{
"title": "Common Examples",
"description": "A classic example is the burning of coal: carbon (C) combines with oxygen (O₂) from the air to form carbon dioxide (CO₂). Another example is the formation of water when hydrogen gas (H₂) burns in oxygen (O₂) to give water (H₂O). In both cases, two reactants combine to give one main product, so they are combination reactions."
},
{
"title": "Exothermic Reactions",
"description": "Many combination reactions are exothermic, meaning they release heat energy when the new substance is formed. Because of this heat release, the reaction mixture and the surroundings often feel warm or even hot during the reaction."
},
{
"title": "Respiration is Exothermic",
"description": "In our body, during respiration, glucose from food combines with oxygen in our cells to produce carbon dioxide, water, and energy. This process releases heat energy, which keeps our body warm, so respiration is a biological example of an exothermic (energy-releasing) reaction."
}
          ]
        }
      }
    },
    {
      "title": "Decomposition Reactions",
      "subtitle": "Breaking Down Compounds",
      "content": "A decomposition reaction is a chemical reaction in which a single reactant breaks down into two or more simpler substances. It is considered the opposite of a combination reaction, where simpler substances combine to form a single product. In decomposition reactions, chemical bonds within the compound are broken, which requires the absorption of energy. Therefore, these reactions are usually endothermic in nature. The required energy may be supplied in the form of heat, light, or electricity. Example: CaCO₃ → CaO + CO₂. In this reaction, calcium carbonate decomposes on heating to form calcium oxide and carbon dioxide.",
      "imageUrl": "assets/ch_2_2.png",
      "layout": "focus-media",
      "interactiveWidget": {
        "type": "interactive-cards",
        "config": {
          "items": [
            {
"title": "Thermal Decomposition",
"description": "Thermal decomposition is a type of decomposition reaction in which a single compound breaks down into simpler substances when heated strongly. For example, when limestone (calcium carbonate, CaCO₃) is heated, it decomposes to form quicklime (calcium oxide, CaO) and carbon dioxide (CO₂): CaCO₃ → CaO + CO₂. This kind of reaction is common in industries like cement manufacturing, where heat is used to break down raw materials."
},
{
"title": "Electrolytic Decomposition",
"description": "Electrolytic decomposition is the breaking down of a compound by passing an electric current through it. A classic example is the electrolysis of water, where electricity splits water (H₂O) into hydrogen gas (H₂) and oxygen gas (O₂). This process shows how electrical energy can be used to separate the elements of a compound."
},
{
"title": "Photolytic Decomposition",
"description": "Photolytic decomposition is a decomposition reaction that occurs with the help of light energy, usually sunlight. A common school example is silver chloride (AgCl): when exposed to sunlight, it breaks down into grey metallic silver (Ag) and chlorine gas (Cl₂). This is why silver salts are stored in dark bottles, to prevent them from decomposing in light."
},
{
"title": "Endothermic Reactions",
"description": "Decomposition reactions like thermal, electrolytic, and photolytic decomposition are usually endothermic because they absorb energy from the surroundings to break chemical bonds. In an endothermic reaction, energy is taken in as heat, light, or electricity, which is why heating, electric current, or light is needed to make the reactant split into simpler products."
}
          ]
        }
      }
    },
    {
      "title": "Displacement Reactions",
      "subtitle": "The Battle for Reactivity",
      "content": "A displacement reaction is a chemical reaction in which a more reactive element replaces or displaces a less reactive element from its compound or salt solution. The reaction occurs because the more reactive element has a greater tendency to form compounds compared to the less reactive element. Displacement reactions are commonly observed in metals based on their reactivity series. Example: Zn + CuSO₄ → ZnSO₄ + Cu. In this reaction, zinc is more reactive than copper, so zinc displaces copper from copper sulphate solution to form zinc sulphate and copper metal.",
      "imageUrl": "assets/ch_2_3.png",
      "layout": "split-left",
      "interactiveWidget": {
        "type": "interactive-cards",
        "config": {
          "items": [
            {
"title": "The Concept",
"description": "General form: A + BC → AC + B. In a displacement reaction, a more reactive element A pushes out a less reactive element B from its compound BC and takes its place. This usually happens with metals, where a more reactive metal displaces a less reactive metal from its salt solution."
},
{
"title": "Classic Experiment",
"description": "A common school experiment uses an iron nail dipped into a blue copper sulphate (CuSO₄) solution. Iron is more reactive than copper, so it displaces copper from copper sulphate to form iron sulphate (FeSO₄), and copper is set free as a separate substance."
},
{
"title": "Visual Changes",
"description": "As the reaction continues, the blue colour of the copper sulphate solution slowly fades and turns light green because iron sulphate is formed in the solution. At the same time, a reddish-brown layer of copper metal starts to deposit on the surface of the iron nail, showing that copper has been displaced."
},
{
"title": "Other Metals",
"description": "Metals like zinc and lead are also more reactive than copper, so they can displace copper from its compounds. For example: Zn + CuSO₄ → ZnSO₄ + Cu. Here, zinc replaces copper to form zinc sulphate, and copper is released as a separate metal, again demonstrating a displacement reaction based on reactivity."
}
          ]
        }
      }
    },
    {
      "title": "Double Displacement Reactions",
      "subtitle": "Mutual Exchange of Ions",
      "content": "Double displacement reactions are chemical reactions in which two compounds react by exchanging their ions to form two new compounds. In these reactions, the positive and negative ions of the reactants switch partners. Such reactions often result in the formation of an insoluble solid called a precipitate, which separates out from the solution. Therefore, many double displacement reactions are also known as precipitation reactions. Example: BaCl₂(aq) + Na₂SO₄(aq) → BaSO₄(s) + 2NaCl(aq). In this reaction, barium sulphate (BaSO₄) is formed as a white insoluble precipitate.",
      "imageUrl": "assets/ch_2_4.png",
      "layout": "modern-grid",
      "interactiveWidget": {
        "type": "interactive-cards",
        "config": {
          "items": [
           {
"title": "The Concept",
"description": "General form: AB + CD → AD + CB. In a double displacement reaction, the positive ions (cations) and negative ions (anions) of two ionic compounds exchange partners to form two new compounds. This usually happens in aqueous solutions, where the ions are free to move and swap places."
},
{
"title": "Ion Exchange",
"description": "Example: Mixing Sodium Sulphate (Na₂SO₄) and Barium Chloride (BaCl₂) in water. Sodium (Na⁺) and Barium (Ba²⁺) are the positive ions, while Sulphate (SO₄²⁻) and Chloride (Cl⁻) are the negative ions. In the reaction, Barium pairs with Sulphate to form Barium Sulphate (BaSO₄), and Sodium pairs with Chloride to form Sodium Chloride (NaCl). This is a clear example of ions exchanging partners."
},
{
"title": "Precipitation Reactions",
"description": "A precipitation reaction is a type of double displacement reaction in which one of the products formed is a precipitate. A precipitate is an insoluble solid that appears when two clear solutions are mixed. Because the precipitate does not dissolve in water, it separates out and makes the solution look cloudy or forms visible solid particles."
},
{
"title": "The White Precipitate",
"description": "In the reaction between Sodium Sulphate (Na₂SO₄) and Barium Chloride (BaCl₂), Barium Sulphate (BaSO₄) is formed as one of the products. Barium Sulphate is insoluble in water, so it appears as a thick, white solid that settles at the bottom of the container. This white solid is the precipitate, and its formation is evidence that a double displacement (precipitation) reaction has occurred."
}
          ]
        }
      }
    },
    {
      "title": "Oxidation and Reduction (Redox)",
      "subtitle": "The Transfer of Oxygen and Hydrogen",
      "content": "Oxidation and reduction reactions usually occur together in a chemical process. When one substance undergoes oxidation by gaining oxygen or losing hydrogen, another substance simultaneously undergoes reduction by losing oxygen or gaining hydrogen. Since both processes occur at the same time, such reactions are called redox reactions, where 'redox' is a combination of the words reduction and oxidation. In a redox reaction, one substance is oxidized while the other is reduced. Example: CuO + H₂ → Cu + H₂O. In this reaction, copper oxide loses oxygen and gets reduced to copper, while hydrogen gains oxygen and gets oxidized to water.",
      "imageUrl": "assets/last.png",
      "interactiveWidget": {
        "type": "interactive-cards",
        "config": {
          "items": [
            {
"title": "Oxidation",
"description": "Oxidation is a chemical process in which a substance either gains oxygen or loses hydrogen during a reaction. In many school-level reactions, metals like magnesium or iron combine with oxygen from the air to form metal oxides, showing oxidation.\n\nIn more general chemistry, oxidation can also be understood as a loss of electrons by an atom, ion, or molecule, which often happens when it reacts with a more electronegative element like oxygen. For beginners, remembering \"gain of oxygen or loss of hydrogen\" is a simple way to identify oxidation in common reactions."
},
{
"title": "Reduction",
"description": "Reduction is a chemical process in which a substance either loses oxygen or gains hydrogen during a reaction. For example, a metal oxide can be reduced to metal if its oxygen is removed by another substance.\n\nOn a more advanced level, reduction means a gain of electrons by an atom, ion, or molecule. A good way to remember it for basic questions is: if a substance is losing oxygen or gaining hydrogen in a reaction, it is being reduced."
},
{
"title": "Redox Concept",
"description": "The term \"redox\" is formed from the words REDuction and OXidation, because these two processes always occur together in the same reaction. When one reactant is oxidized, another reactant is reduced at the same time.\n\nRedox reactions involve a transfer of electrons between substances: the species that loses electrons is oxidized, and the species that gains electrons is reduced. In simple oxygen/hydrogen terms, whenever one substance gains oxygen (oxidation), some other substance must be losing that oxygen (reduction), so both are linked."
},
{
"title": "Copper Oxide Example",
"description": "Consider the reaction: CuO + H₂ → Cu + H₂O. Copper(II) oxide (CuO), a black solid, reacts with hydrogen gas (H₂) to form copper metal (Cu) and water (H₂O).\n\nIn this reaction, copper(II) oxide loses oxygen and changes to copper metal, so copper(II) oxide is reduced. Hydrogen gas gains oxygen to form water, so hydrogen is oxidized. This single reaction clearly shows a redox process: oxidation of hydrogen and reduction of copper(II) oxide happening together."
}
          ]
        }
      }
    }
  ],
  "youtubeId": "https://www.youtube.com/watch?v=aMU1RaRulSo",
  "quizzes": [
  {
    "type": "conceptual",
    "question": "Which of the following is an endothermic process?",
    "options": [
      "Respiration in our body",
      "Burning of natural gas in a stove",
      "Photolytic decomposition of Silver Chloride in sunlight",
      "Slaking of lime (adding water to quicklime)"
    ],
    "correctIndex": 2,
    "explanation": "Endothermic processes absorb energy from the surroundings. In photolytic decomposition of silver chloride, light energy from the sun is absorbed to break down AgCl, so it is endothermic."
  },
  {
    "type": "real_life_application",
    "question": "A white wall paint containing silver salts slowly darkens in strong sunlight. Which scientific idea best explains this change?",
    "options": [
      "Silver salts undergo photolytic decomposition by absorbing light energy",
      "The paint is oxidized by oxygen in the air",
      "Sunlight cools the paint, causing it to contract",
      "The water in the paint evaporates over time"
    ],
    "correctIndex": 0,
    "explanation": "Silver salts (like silver chloride) decompose in sunlight into silver and a gas, which is a photolytic decomposition reaction that absorbs light energy (endothermic in terms of bond breaking)."
  },
  {
    "type": "skill_based",
    "question": "A student adds iron nails to a blue copper sulphate solution. After some time, the solution turns green and a reddish-brown layer appears on the nails. Which reaction type should the student record in the lab notebook?",
    "options": [
      "Combination reaction",
      "Decomposition reaction",
      "Displacement reaction",
      "Double displacement reaction"
    ],
    "correctIndex": 2,
    "explanation": "Iron is more reactive than copper and displaces copper from copper sulphate solution, forming iron sulphate and copper. Recognizing this pattern (A + BC → AC + B) shows it is a displacement reaction."
  },
  {
    "type": "HOTS",
    "question": "A metal ‘X’ does NOT react with cold water or steam but displaces copper from a copper sulphate solution. What can you conclude about the reactivity of metal X?",
    "options": [
      "X is more reactive than potassium but less reactive than sodium",
      "X is less reactive than hydrogen but more reactive than copper",
      "X is more reactive than hydrogen but less reactive than copper",
      "X is the least reactive metal in the activity series"
    ],
    "correctIndex": 1,
    "explanation": "Since X can displace copper from copper sulphate, X is more reactive than copper. But since it does not react with water or steam, it is less reactive than metals like sodium, calcium or magnesium, and is placed below hydrogen in the reactivity series."
  },
  {
    "type": "conceptual",
    "question": "In a chemical reaction, what best defines ‘oxidation’ at the school level?",
    "options": [
      "The loss of oxygen or gain of hydrogen",
      "The gain of oxygen or loss of hydrogen",
      "The mutual exchange of ions between two compounds",
      "The formation of an insoluble solid from a solution"
    ],
    "correctIndex": 1,
    "explanation": "At this level, oxidation is defined as the gain of oxygen or loss of hydrogen by a substance in a chemical reaction."
  },
  {
    "type": "real_life_application",
    "question": "A packet of fried snacks becomes oily, smelly, and tastes bad after being left open for many days. Which explanation is most accurate?",
    "options": [
      "The oil in the snacks has undergone oxidation, causing rancidity",
      "The carbohydrates in the snacks have turned into alcohol",
      "The salt in the snacks has evaporated",
      "The water in the snacks has frozen"
    ],
    "correctIndex": 0,
    "explanation": "Fats and oils in the snacks react with oxygen in the air (oxidation), forming new compounds with unpleasant smell and taste. This process is called rancidity."
  },
  {
    "type": "skill_based",
    "question": "A student mixes two clear solutions and observes a yellow solid forming, which settles at the bottom. How should the student classify this reaction?",
    "options": [
      "As a combination reaction because a new product is formed",
      "As a decomposition reaction because one substance splits up",
      "As a precipitation reaction because an insoluble solid is formed",
      "As an exothermic reaction because heat must be released"
    ],
    "correctIndex": 2,
    "explanation": "The appearance of an insoluble solid (precipitate) from two clear solutions is the key experimental sign of a precipitation reaction, which is a type of double displacement reaction."
  },
  {
    "type": "HOTS",
    "question": "During a reaction in solution, substance P is oxidized and substance Q is reduced. A student claims: “This must be a redox reaction and electrons are being transferred between P and Q.” How would you evaluate this statement?",
    "options": [
      "Only the first part is correct; it is redox but electrons are never transferred",
      "Only the second part is correct; electrons are transferred but it is not redox",
      "Both parts are correct; oxidation and reduction together define a redox reaction involving electron transfer",
      "Both parts are incorrect; oxidation and reduction cannot happen in the same reaction"
    ],
    "correctIndex": 2,
    "explanation": "Oxidation and reduction always occur together in a redox reaction, and such reactions involve transfer of electrons from the species being oxidized to the one being reduced."
  }
],
  "summary": {
    "title": "Reaction Types Summary",
    "keyTakeaways": [
      "Combination reactions fuse reactants, while decomposition reactions break them apart.",
      "Exothermic reactions release energy (usually heat), whereas endothermic reactions absorb energy.",
      "Displacement relies on reactivity differences, while double displacement involves ion swapping and often forms precipitates.",
      "Redox reactions involve simultaneous oxidation (gaining oxygen) and reduction (losing oxygen)."
    ],
    "classroomActivity": "Set up a photolytic decomposition demonstration. Place a small amount of silver chloride in two watch glasses. Keep one in a dark cupboard and place the other in direct sunlight. Have students observe and compare the color change after 30 minutes.",
    "quickFact": "Silver chloride and silver bromide are stored in dark-colored bottles in the laboratory to prevent them from prematurely breaking down due to ambient light exposure!"
  }
},
{
  "id": "ncert-ch1-oxidation-effects",
  "title": "Effects of Oxidation Reactions in Everyday Life",
  "description": "Understand the real-world impact of oxidation through the processes of corrosion of metals and rancidity of food.",
  "themeId": "sophisticated-dark",
  "intro": {
    "title": "Everyday Effects of Oxidation",
    "subtitle": "NCERT Class 10 Science - Chapter 1",
    "content": "Oxidation is not limited to laboratory experiments; it is a common chemical process that occurs continuously in our daily lives. Oxygen present in the air reacts slowly with various substances such as metals and food items, leading to noticeable chemical changes over time. These reactions often result in undesirable effects. For example, iron reacts with oxygen and moisture to form rust, a process known as corrosion. Similarly, oils and fats in food react with oxygen, causing unpleasant smell and taste, a process called rancidity. These everyday processes are examples of oxidation reactions occurring naturally around us.",
    "keyConcepts": [
      "Corrosion of Metals",
      "Rusting of Iron",
      "Rancidity of Fats & Oils",
      "Prevention Methods"
    ]
  },
  "explanations": [
    {
      "title": "Corrosion",
      "subtitle": "The Slow Degradation of Metals",
      "content": "Corrosion is the slow deterioration or damage of a metal caused by its reaction with substances present in the surrounding environment, such as moisture, air, acids, or salts. When a metal is attacked by these substances, it gradually loses its original properties and forms compounds like oxides, sulphides, or carbonates on its surface. This process is called corrosion. Rusting of iron is one of the most common examples of corrosion. Corrosion weakens metals over time and can lead to serious structural damage in buildings, bridges, vehicles, pipelines, and machinery, resulting in large economic losses worldwide.",
      "imageUrl": "assets/8db87836-6cd7-46b7-9c10-b999f2d7b54e.png",
      "layout": "split-right",
      "interactiveWidget": {
        "type": "interactive-cards",
        "config": {
          "items": [
            {
"title": "Rusting of Iron",
"description": "New iron objects look shiny, but after some time in moist air they get covered with a flaky, reddish-brown powder called rust. Rusting is a specific type of corrosion in which iron reacts with oxygen and water from the air to form hydrated iron oxide, which weakens the metal and makes it brittle."
},
{
"title": "Tarnishing of Silver",
"description": "Silver articles slowly lose their shine and develop a thin black coating on the surface over time. This happens because silver reacts with sulphur-containing gases in the air (like hydrogen sulphide) to form a black compound called silver sulphide, a process known as tarnishing."
},
{
"title": "Greening of Copper",
"description": "Copper vessels and statues gradually change from a bright reddish-brown colour to a dull green appearance. This green layer is mainly basic copper carbonate, formed when copper reacts with moist air containing carbon dioxide and other gases; it is another example of corrosion, often seen on old copper roofs and coins."
},
{
"title": "Impact of Corrosion",
"description": "Corrosion slowly eats away metals, reducing their strength, appearance, and usefulness over time. It leads to serious damage and high repair costs for structures and objects like car bodies, bridges, iron railings, ships, pipelines, and many other metal constructions, especially those made of iron and steel."
}
          ]
        }
      }
    },
    {
      "title": "Prevention of Corrosion",
      "subtitle": "Protecting Our Infrastructure",
      "content": "Since corrosion causes massive economic loss and endangers safety, preventing it is crucial. There are several methods to protect metals from corrosion, most of which involve creating a barrier between the metal surface and the corrosive environment (air and moisture). Painting, oiling, and greasing are the simplest methods used for household items and machinery. For more permanent protection, methods like galvanization, chrome plating, and anodizing are used. Additionally, making alloys, such as stainless steel (iron mixed with nickel and chromium), is an effective way to improve a metal's resistance to corrosion.",
      "imageUrl": "assets/prevent_corrosion.png",
      "layout": "split-left",
      "interactiveWidget": {
        "type": "interactive-cards",
        "config": {
          "items": [
            {
"title": "Galvanization",
"description": "Galvanization is the process of coating iron or steel with a thin layer of zinc. Zinc is more reactive than iron, so even if the zinc coating is scratched, the zinc reacts with air and moisture first, protecting the underlying iron from rusting."
},
{
"title": "Alloying",
"description": "Alloying is a very good method of improving the properties of a metal. Iron is the most widely used metal, but it is never used in its pure state because it is very soft. When mixed with a small amount of carbon, it becomes hard and strong. When mixed with nickel and chromium, we get stainless steel, which is hard and does not rust."
},
{
"title": "Barrier Methods",
"description": "Painting and greasing are common barrier methods. A layer of paint or grease prevents the iron surface from coming into direct contact with air and moisture. This is why we paint iron gates, railings, and various parts of machinery regularly."
}
          ]
        }
      }
    },
    {
      "title": "Rancidity",
      "subtitle": "The Spoilage of Fats and Oils",
      "content": "Have you ever noticed an unpleasant smell or taste in food items containing fats and oils that have been left unused for a long time? This happens due to a process called rancidity. Rancidity is caused when fats and oils react slowly with oxygen present in the air, leading to oxidation. As a result, the food undergoes chemical changes that spoil its smell, taste, and quality. Rancid food is unpleasant to eat and may also become unhealthy. To prevent rancidity, food items are often stored in airtight containers, refrigerated, or packed with nitrogen gas to reduce contact with oxygen.",
      "imageUrl": "assets/0810521d-ab98-4052-9352-351fba2a0042.png",
      "layout": "split-right",
      "interactiveWidget": {
        "type": "interactive-cards",
        "config": {
          "items": [
            {
"title": "The Chemical Process",
"description": "Rancidity happens when the fat and oil molecules in food slowly react with oxygen from the air, a type of oxidation reaction. This reaction produces new, volatile chemicals that give the food an unpleasant smell and taste, which is why old fried items or stored chips often seem 'off' or stale."
},
{
"title": "Detecting Spoilage",
"description": "The most common signs of rancidity are a change in the original taste and the development of a 'stale' or 'crayony' odour. In some cases, the texture of the food might also change, becoming more sticky or oily as the chemical bonds in the fats break down."
}
          ]
        }
      }
    },
    {
      "title": "Prevention of Rancidity",
      "subtitle": "Keeping Food Fresh",
      "content": "Preventing the oxidation of fats and oils is essential to keep food fresh, tasty, and safe for consumption. Several techniques are used in the food industry and at home to slow down or stop the oxidation process. The most common method is adding 'antioxidants'—substances that prevent oxidation—to foods containing fats and oils. Other methods include using inert gases like nitrogen during packaging, which displaces oxygen, and storing food in dark, cool places to reduce the rate of chemical reactions. These methods help extend the shelf life of various snacks and processed foods.",
      "imageUrl": "assets/prevention_of_corrosion.png",
      "layout": "focus-media",
      "interactiveWidget": {
        "type": "interactive-cards",
        "config": {
          "items": [
            {
"title": "Nitrogen Flushing",
"description": "Manufacturers of potato chips usually flush bags with an inert gas such as nitrogen to prevent the chips from getting oxidized. Nitrogen is a non-reactive gas that creates an oxygen-free environment inside the packet, keeping the chips crisp and fresh for months."
},
{
"title": "Using Antioxidants",
"description": "Antioxidants are substances that prevent oxidation. When added to foods containing fats and oils, they act as oxygen scavengers or break the oxidation chain reaction, ensuring that the food remains safe and palatable for a much longer period."
},
{
"title": "Airtight Storage",
"description": "Storing food in air-tight containers or sealed packets is a simple way to reduce its contact with oxygen in the air. With less oxygen available, oxidation happens much more slowly, so the fats in the food take a longer time to go rancid."
}
          ]
        }
      }
    }
  ],
  "youtubeId": "https://www.youtube.com/watch?v=XtmNrMvx6ts",
  "quizzes": [
  {
    "type": "conceptual",
    "question": "What is the main cause of rancidity in oily and fried foods?",
    "options": [
      "Evaporation of water from the food",
      "Oxidation of fats and oils by oxygen in the air",
      "Reaction of salt with carbohydrates",
      "Cooling of food below room temperature"
    ],
    "correctIndex": 1,
    "explanation": "Rancidity occurs when fats and oils present in food slowly react with oxygen from the air (oxidation), forming new compounds with unpleasant smell and taste.[web:13][web:15]"
  },
  {
    "type": "real_life_application",
    "question": "Why are packets of potato chips filled with nitrogen gas instead of ordinary air?",
    "options": [
      "To make the packet feel fuller and heavier",
      "To keep the chips warm inside the packet",
      "To prevent fats in the chips from getting oxidized and turning rancid",
      "To add a salty taste to the chips"
    ],
    "correctIndex": 2,
    "explanation": "Nitrogen is an unreactive gas, so it pushes out most of the oxygen and prevents the oxidation of fats and oils in the chips, slowing down rancidity.[web:16][web:19]"
  },
  {
    "type": "skill_based",
    "question": "A student observes the following changes:\n(1) An iron gate develops a reddish-brown coating.\n(2) A silver spoon turns black.\n(3) A copper pipe turns green.\nHow should these changes be classified?",
    "options": [
      "Only (1) is corrosion",
      "Only (1) and (2) are corrosion",
      "Only (2) and (3) are corrosion",
      "All (1), (2) and (3) are examples of corrosion"
    ],
    "correctIndex": 3,
    "explanation": "Rusting of iron, black tarnish on silver (silver sulphide) and green coating on copper (basic copper carbonate) are all forms of corrosion of metals.[web:17]"
  },
  {
    "type": "HOTS",
    "question": "A city plans to build a long bridge over the sea using iron and steel. Which combination of actions will BEST reduce corrosion in this environment?",
    "options": [
      "Leave the metal surfaces bare so they can \"breathe\"",
      "Paint the surfaces and regularly apply grease or oil",
      "Use thin iron sheets without any coating",
      "Only wash the bridge with water from time to time"
    ],
    "correctIndex": 1,
    "explanation": "Corrosion is faster in moist, salty air near the sea. Coating the metal with paint, grease or oil blocks contact with air and moisture, slowing down rusting and other forms of corrosion.[web:18]"
  }
],
   "summary": {
    "title": "Everyday Oxidation Summary",
    "keyTakeaways": [
      "Corrosion is the slow deterioration of metals caused by reactions with substances like moisture, oxygen, acids, and salts present in the environment.",
      "Rusting of iron, tarnishing of silver, and greening of copper are common examples of corrosion that occur due to oxidation reactions in everyday life.",
      "Corrosion weakens metals, damages structures and machinery, and leads to huge economic losses due to maintenance and replacement costs.",
      "Rancidity is the oxidation of fats and oils in food, which causes unpleasant smell, bad taste, and spoilage of food materials over time.",
      "Food items containing fats and oils can be protected from rancidity by storing them in airtight containers, refrigeration, vacuum packing, or by using nitrogen gas packaging.",
      "Antioxidants are substances added to food products to slow down oxidation and increase shelf life by preventing rancidity."
    ],
    "classroomActivity": "Collect and observe real-life examples of corrosion such as a rusty iron nail, a tarnished silver ornament, or an old greenish copper coin. Compare their appearance with new metal objects and discuss the chemical changes involved. For rancidity, smell a freshly opened packet of chips and compare it with an old improperly sealed packet to observe the difference caused by oxidation of fats and oils.",
    "quickFact": "The famous Statue of Liberty in the United States is made of copper. Its green colour is not paint, but a protective layer called patina formed due to corrosion over many years."
  }
}
            ]
          },
          { "id": "c10-s-2", "name": "Chapter 2: Acids, Bases and Salts", "description": "Chemical properties, indicators, and pH scale.", "topics": [] },
          { "id": "c10-s-3", "name": "Chapter 3: Metals and Non-metals", "description": "Physical and chemical properties, extraction of metals.", "topics": [] },
          { "id": "c10-s-4", "name": "Chapter 4: Carbon and its Compounds", "description": "Versatile nature of carbon, homologous series, and functional groups.", "topics": [] },
          { "id": "c10-s-5", "name": "Chapter 5: Life Processes", "description": "Nutrition, respiration, transportation, and excretion in plants and animals.", "topics": [] },
          { "id": "c10-s-6", "name": "Chapter 6: Control and Coordination", "description": "Nervous system, hormones, and tropic movements.", "topics": [] },
          { "id": "c10-s-7", "name": "Chapter 7: How do Organisms Reproduce?", "description": "Asexual and sexual reproduction, human reproductive system.", "topics": [] },
          { "id": "c10-s-8", "name": "Chapter 8: Heredity and Evolution", "description": "Mendel's contribution, sex determination, and evolution theories.", "topics": [] },
          { "id": "c10-s-9", "name": "Chapter 9: Light – Reflection and Refraction", "description": "Spherical mirrors, lenses, and power of a lens.", "topics": [] },
          { "id": "c10-s-10", "name": "Chapter 10: The Human Eye and the Colourful World", "description": "Defects of vision, refraction through prism, and atmospheric refraction.", "topics": [] },
          { "id": "c10-s-11", "name": "Chapter 11: Electricity", "description": "Electric current, potential difference, and Ohm’s law.", "topics": [] },
          { "id": "c10-s-12", "name": "Chapter 12: Magnetic Effects of Electric Current", "description": "Magnetic field lines, electromagnetism, and electric motor.", "topics": [] },
          { "id": "c10-s-13", "name": "Chapter 13: Our Environment", "description": "Ecosystem, food chain, and ozone layer depletion.", "topics": [] }
        ]
      },
      {
        "id": "math",
        "name": "Mathematics",
        "chapters": [
          { "id": "c10-m-1", "name": "Chapter 1: Real Numbers", "description": "Fundamental theorem of arithmetic, irrationality proofs.", "topics": [] },
          { "id": "c10-m-2", "name": "Chapter 2: Polynomials", "description": "Zeroes and coefficients of polynomials.", "topics": [] },
          { "id": "c10-m-3", "name": "Chapter 3: Pair of Linear Equations in Two Variables", "description": "Graphical and algebraic solution methods.", "topics": [] },
          { "id": "c10-m-4", "name": "Chapter 4: Quadratic Equations", "description": "Standard form, solution by factoring and quadratic formula.", "topics": [] },
          { "id": "c10-m-5", "name": "Chapter 5: Arithmetic Progressions", "description": "nth term and sum of first n terms of an AP.", "topics": [] },
          { "id": "c10-m-6", "name": "Chapter 6: Triangles", "description": "Similarity of triangles and related theorems.", "topics": [] },
          { "id": "c10-m-7", "name": "Chapter 7: Coordinate Geometry", "description": "Distance formula, section formula.", "topics": [] },
          {
            "id": "c10-m-8",
            "name": "Chapter 8: Introduction to Trigonometry",
            "description": "Trigonometric ratios, identities, and complementary angles.",
            "topics": [
              {
                "id": "c10-m-8-t1",
                "title": "The Sine and Cosine Ratios",
                "description": "Deconstruct the ratios of a right-angled triangle, understand mathematical projections, and estimate heights.",
                "themeId": "cyberpunk",
                "intro": {
                  "title": "Trigonometric Essentials",
                  "subtitle": "Sine and Cosine Unveiled",
                  "content": "Trigonometry is the study of ratios. By fixing an angle in a right-angled triangle, the ratio between the side lengths remains locked, regardless of scale.",
                  "keyConcepts": ["Right-Angle Frame", "The Sine Ratio", "The Cosine Ratio", "Unit Circle Foundation"]
                },
                "explanations": [
                  {
                    "title": "Defining Sine (sin θ)",
                    "subtitle": "Opposite / Hypotenuse ratio",
                    "content": "Sine is the vertical projection. It measures what fraction the Opposite side is of the Hypotenuse.",
                    "interactiveWidget": {
                      "type": "simulation",
                      "title": "Dynamic Sine Angle Tracker",
                      "config": { "type": "angle-ratio-slider", "ratioType": "sine" }
                    }
                  },
                  {
                    "title": "Defining Cosine (cos θ)",
                    "subtitle": "Adjacent / Hypotenuse ratio",
                    "content": "Cosine is the horizontal projection. It measures the adjacent base as a fraction of the hypotenuse.",
                    "interactiveWidget": {
                      "type": "simulation",
                      "title": "Dynamic Cosine Angle Tracker",
                      "config": { "type": "angle-ratio-slider", "ratioType": "cosine" }
                    }
                  }
                ],
                "youtubeId": "bSMYPr0I5LI",
                "quizzes": [
                  {
                    "type": "conceptual",
                    "question": "If a right-triangled roof has an angle of 30° and the height is 5m, what is the hypotenuse? (sin 30° = 0.5)",
                    "options": ["2.5m", "10m", "7.5m", "15m"],
                    "correctIndex": 1,
                    "explanation": "Hypotenuse = Opposite / sin(30°) = 5 / 0.5 = 10 meters."
                  }
                ],
                "summary": {
                  "title": "Trigonometric Principles Summary",
                  "keyTakeaways": [
                    "Sine and Cosine map projections onto a right frame.",
                    "sin θ defines the Opposite-to-Hypotenuse factor.",
                    "cos θ tracks the Adjacent-to-Hypotenuse factor.",
                    "Pythagorean Identity: sin²θ + cos²θ = 1."
                  ],
                  "classroomActivity": "Build a manual clinometer to estimate building heights!",
                  "quickFact": "The word 'Sine' originates from the Sanskrit term 'Ardha-jya' (half-chord)!"
                }
              }
            ]
          },
          { "id": "c10-m-9", "name": "Chapter 9: Some Applications of Trigonometry", "description": "Heights and distances using trigonometric ratios.", "topics": [] },
          { "id": "c10-m-10", "name": "Chapter 10: Circles", "description": "Tangent to a circle and its properties.", "topics": [] },
          { "id": "c10-m-11", "name": "Chapter 11: Areas Related to Circles", "description": "Area of sector and segment of a circle.", "topics": [] },
          { "id": "c10-m-12", "name": "Chapter 12: Surface Areas and Volumes", "description": "Surface area and volume of combinations of solids.", "topics": [] },
          { "id": "c10-m-13", "name": "Chapter 13: Statistics", "description": "Mean, median, and mode of grouped data.", "topics": [] },
          { "id": "c10-m-14", "name": "Chapter 14: Probability", "description": "Theoretical probability, events and outcomes.", "topics": [] }
        ]
      }
    ]
  },
  {
    "id": "class-11",
    "name": "Class 11",
    "subjects": [
      {
        "id": "physics",
        "name": "Physics",
        "chapters": [
          { "id": "c11-p-1", "name": "Chapter 1: Units and Measurements", "description": "International system of units, errors in measurement.", "topics": [] },
          {
            "id": "c11-p-2",
            "name": "Chapter 2: Motion in a Straight Line",
            "description": "Linear motion mechanics, velocity vectors, G-force accelerations, and Newtonian equations.",
            "topics": [
              {
                "id": "c11-s-2-t1",
                "title": "Motion in a Straight Line",
                "description": "Distingush distance from displacement vectors, analyze velocity slopes, and solve acceleration coordinates.",
                "themeId": "sophisticated-dark",
                "intro": {
                  "title": "Motion in a Straight Line",
                  "subtitle": "Kinematics Analysis in 1D",
                  "content": "Kinematics is the framework describing physical bodies in movement without needing forces analysis. By tracking time, velocity, and distance, we model trajectories.",
                  "keyConcepts": ["Displacement vector lengths", "Slope rates of Speed-Time curves", "Equations of constant acceleration", "Gravity acceleration limits"]
                },
                "explanations": [
                  {
                    "title": "Distance vs Displacement",
                    "subtitle": "Walk dimensions mapped on vectors",
                    "content": "Distance accumulates all steps walked. Displacement measures the shortest coordinate bridge leading directly from start to finish.",
                    "interactiveWidget": {
                      "type": "interactive-cards",
                      "title": "Kinematic Quantities",
                      "config": {
                        "items": [
                          { "title": "Displacement (s)", "desc": "State vector change. Positional distance including heading direction." },
                          { "title": "Velocity (v)", "desc": "Displacement over time. Velocity vector indicating travel speed and heading." }
                        ]
                      }
                    }
                  },
                  {
                    "title": "The Coordinate Velocity Slope",
                    "subtitle": "Why area under velocity charts equals distance",
                    "content": "Plotted on a Speed-Time graph, the local tangent slope equals acceleration. The area enclosed under the curve equals total displacement.",
                    "interactiveWidget": {
                      "type": "diagram",
                      "title": "Speed Rate State Valves",
                      "config": { "type": "stomata-state" }
                    }
                  }
                ],
                "youtubeId": "UPBMG5EYV_I",
                "quizzes": [
                  {
                    "type": "skill",
                    "question": "A train accelerates from sleep (u=0) at 3 m/s² for 10 seconds. What is its terminal speed?",
                    "options": ["30 m/s", "15 m/s", "300 m/s", "3 m/s"],
                    "correctIndex": 0,
                    "explanation": "Apply v = u + at: v = 0 + (3 * 10) = 30 m/s."
                  }
                ],
                "summary": {
                  "title": "Kinematics Lessons Recap",
                  "keyTakeaways": [
                    "Displacement tracks vector distance; speed accumulates scalar distance.",
                    "Velocity curve slopes determine acceleration values.",
                    "Constant acceleration formulas link time, speed, and path lengths."
                  ],
                  "classroomActivity": "Drop paper cups and timing blocks to construct deceleration curves!",
                  "quickFact": "Galileo proved that heavy and light objects accelerate at identical rates when dropped together!"
                }
              }
            ]
          },
          { "id": "c11-p-3", "name": "Chapter 3: Motion in a Plane", "description": "Scalars and vectors, projectile motion.", "topics": [] },
          { "id": "c11-p-4", "name": "Chapter 4: Laws of Motion", "description": "Newton's laws, friction, and circular motion.", "topics": [] }
        ]
      },
      {
        "id": "math",
        "name": "Mathematics",
        "chapters": [
          {
            "id": "c11-m-1",
            "name": "Chapter 1: Sets",
            "description": "Venn diagrams, logic equations, and set operations.",
            "topics": [
              {
                "id": "c11-m-1-t1",
                "title": "Understanding Venn Diagrams & Set Operations",
                "description": "Analyze set intersections, union bounds, set differences, and Euler-Venn mapping rules.",
                "themeId": "monochrome",
                "intro": {
                  "title": "The Foundation of Mathematics",
                  "subtitle": "Set Structures & Elements",
                  "content": "A set is a collection of unique items. Set theory provides logical rules enabling all programming logic, algebra fields, databases, and probability theory.",
                  "keyConcepts": ["Union (A ∪ B)", "Intersection (A ∩ B)", "Null Set Ø", "Universal Set bounds"]
                },
                "explanations": [
                  {
                    "title": "Union Operations (A ∪ B)",
                    "subtitle": "Combining sets into a single collection",
                    "content": "Union represents combination. It pools members of A and B, omitting duplicate entries to preserve unique elements.",
                    "interactiveWidget": {
                      "type": "interactive-cards",
                      "title": "Explore Set Types",
                      "config": {
                        "items": [
                          { "title": "Finite Sets", "desc": "Set holding a countable amount of items." },
                          { "title": "Infinite Sets", "desc": "Sets with limits trending to infinity." }
                        ]
                      }
                    }
                  }
                ],
                "youtubeId": "bSMYPr0I5LI",
                "quizzes": [
                  {
                    "type": "conceptual",
                    "question": "If Set A = {2, 4, 6} and Set B = {4, 6, 8}, what represents the Intersection (A ∩ B)?",
                    "options": ["{2, 8}", "{2, 4, 6, 8}", "{4, 6}", "{}"],
                    "correctIndex": 2,
                    "explanation": "Intersection gathers elements common to both sets. Elements 4 and 6 inhabit both circles simultaneously."
                  }
                ],
                "summary": {
                  "title": "Set Principles Recap",
                  "keyTakeaways": [
                    "Sets are collections of unique elements.",
                    "Venn diagrams show intersections as overlapping regions.",
                    "Unions combine sets, intersections identify shared items."
                  ],
                  "classroomActivity": "Create hoops representing attributes and stand inside overlaps!",
                  "quickFact": "Georg Cantor proved that some infinite sets are larger than others!"
                }
              }
            ]
          },
          { "id": "c11-m-2", "name": "Chapter 2: Relations and Functions", "description": "Ordered pairs, domain and range.", "topics": [] },
          { "id": "c11-m-3", "name": "Chapter 3: Trigonometric Functions", "description": "Radian measure, trigonometric functions.", "topics": [] }
        ]
      }
    ]
  },
  {
    "id": "class-12",
    "name": "Class 12",
    "subjects": [
      {
        "id": "physics",
        "name": "Physics",
        "chapters": [
          {
            "id": "c12-p-1",
            "name": "Chapter 1: Electric Charges and Fields",
            "description": "Coulomb's Law, electric field intensity, and Gauss's Theorem.",
            "topics": [
              {
                "id": "c12-s-1-t1",
                "title": "Coulomb's Law & Electric Fields",
                "description": "Understand force equations between charges, permittivity, the inverse square law, and electric field lines.",
                "themeId": "cyberpunk",
                "intro": {
                  "title": "Static Field Dynamics",
                  "subtitle": "Forces of Stationary Charges",
                  "content": "Electrostatics details the charges at rest. It analyzes the Coulomb forces governing molecular bonds, cellular polarization, computer chips, and lightning bolts.",
                  "keyConcepts": ["Coulomb's Inverse Square Law", "Electric Permittivity Constant", "Electric field vectors", "Equipotential voltage planes"]
                },
                "explanations": [
                  {
                    "title": "Coulomb's Inverse Square Law",
                    "subtitle": "F = k * q1 * q2 / r²",
                    "content": "Forces climb linearly with charge values, but decay as a square factor of distance.",
                    "interactiveWidget": {
                      "type": "interactive-cards",
                      "title": "Charge Fields",
                      "config": {
                        "items": [
                          { "title": "Like Charges", "desc": "Repel each other directly." },
                          { "title": "Unlike Charges", "desc": "Attract with high force." }
                        ]
                      }
                    }
                  }
                ],
                "youtubeId": "39HTpUG1MwQ",
                "quizzes": [
                  {
                    "type": "conceptual",
                    "question": "If you double the distance separating two point charges, what happens to their Coulomb forces?",
                    "options": ["Force doubles", "Force reduces to one-half", "Force reduce to one-quarter", "Force quadruples"],
                    "correctIndex": 2,
                    "explanation": "The inverse square law (1/r²) means doubling distance cuts force by 4."
                  }
                ],
                "summary": {
                  "title": "Electrostatics Recap",
                  "keyTakeaways": [
                    "Coulomb force follows the inverse square law.",
                    "Electric fields define direction vectors across space.",
                    "Gauss's theorem relates flux to enclosed charge."
                  ],
                  "classroomActivity": "Rub plastic rulers on hair to pick up scraps of paper!",
                  "quickFact": "A single lightning bolt discharges up to 15 Coulombs of charge!"
                }
              }
            ]
          },
          { "id": "c12-p-2", "name": "Chapter 2: Electrostatic Potential and Capacitance", "description": "Potential due to point charge, capacitors.", "topics": [] },
          { "id": "c12-p-3", "name": "Chapter 3: Current Electricity", "description": "Ohm’s law, drift velocity, and Kirchhoff’s laws.", "topics": [] }
        ]
      },
      {
        "id": "math",
        "name": "Mathematics",
        "chapters": [
          { "id": "c12-m-1", "name": "Chapter 1: Relations and Functions", "description": "Types of relations and functions.", "topics": [] },
          { "id": "c12-m-2", "name": "Chapter 2: Inverse Trigonometric Functions", "description": "Principal value branches.", "topics": [] },
          {
            "id": "c12-m-3",
            "name": "Chapter 3: Matrices",
            "description": "Matrix operations and properties.",
            "topics": [
              {
                "id": "c12-m-3-t1",
                "title": "Matrix Multiplication Dynamics",
                "description": "Master row-column dot products and non-commutative matrix properties.",
                "themeId": "cyberpunk",
                "intro": {
                  "title": "Linear Algebra Foundations",
                  "subtitle": "Operating on Data Arrays",
                  "content": "Matrices represent linear transformations. Multiplying them allows for 3D rotation in games, neural network training, and complex physics simulations.",
                  "keyConcepts": ["Row-by-Column dot products", "Matrix compatibility", "Non-commutative (AB ≠ BA)", "Identity matrix properties"]
                },
                "explanations": [
                  {
                    "title": "The Dot Product Dance",
                    "subtitle": "Multiplying Rows by Columns",
                    "content": "To find element (i, j) of the product, multiply each element of row i of the first matrix by corresponding elements of column j of the second.",
                    "interactiveWidget": {
                      "type": "interactive-cards",
                      "title": "Multiplication Rules",
                      "config": {
                        "items": [
                          { "title": "Dimension Check", "desc": "Columns of first must match Rows of second." }
                        ]
                      }
                    }
                  }
                ],
                "youtubeId": "UPBMG5EYV_I",
                "quizzes": [
                  {
                    "type": "conceptual",
                    "question": "If Matrix A is 2x3 and Matrix B is 3x4, what is the size of product AB?",
                    "options": ["3x3", "2x4", "4x2", "Undefined"],
                    "correctIndex": 1,
                    "explanation": "Inner dimensions match (3), so product size is outer dimensions: 2x4."
                  }
                ],
                "summary": {
                  "title": "Matrix Multiplication Recap",
                  "keyTakeaways": [
                    "Rows of A multiply Columns of B.",
                    "Order of multiplication is critical (AB ≠ BA).",
                    "Identity matrices act like the number 1."
                  ],
                  "classroomActivity": "Hand out number cards and perform human dot-products!",
                  "quickFact": "Google's PageRank algorithm is built on matrix multiplication!"
                }
              }
            ]
          }
        ]
      }
    ]
  }
]''';
}
