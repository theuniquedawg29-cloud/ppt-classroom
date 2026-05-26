class VigyaanScripts {
  /// Maps a topicId to a list of slides.
  /// Each slide is now a List<String> (chunks of conversation).
  /// Index 0: Intro Slide Chunks
  /// Index 1-N: Explanation Slide Chunks
  static final Map<String, List<List<String>>> explanationScripts = {

    // ==========================================
    // TOPIC 1: CHEMICAL EQUATIONS
    // ==========================================
    'ncert-ch1-chemical-equations': [
      // Index 0: Intro
      [
        "Namaste dosto! Aaj hum science ki duniya mein ek bahut hi cool cheez seekhenge—Chemical Equations!",
        "Tension bilkul mat lo, Vigyaan didi hai na yahan sab simplify karne ke liye. Agar ready ho, toh full energy mein bolo 'Yes'!"
      ],
      
      // Index 1: What is a Chemical Equation? 
      [
        "Chalo, ab isko dekhte hain: What is a Chemical Equation? Socho tum kisi ko chai ki recipe bata rahe ho. Pura lamba paragraph likhne ke bajaye, shortcut use karna zyada smart hai na? Bas yahi kaam hai chemical equation ka! Batao, kya ye analogy samajh aayi?",
        "Tum is image me saaf dekh sakte ho, kaise ek beaker me koi chemical dala, aur uska mixture ban gaya. Ab agar hum is process ko ek line me likhna chahte hain, toh chemical equation use karenge! Aage badhu?",
        "Ab screen par dekho, yahan equations ke likhne ke do tarike diye hai. Pehla hai 'Word Equation', jahan hum pure naam likhte hain, jaise Magnesium plus Oxygen ban gaya Magnesium oxide. Ye beginners ke liye theek hai. Yahan tak clear hai?",
        "Lekin hum thode smart hain! Toh hum doosra tarika, yaani 'Chemical Formula Equation' use karte hain. Isme hum naam ki jagah unke symbols lagate hain. Jaise Mg plus O₂ gives MgO. Ekdum short, precise, aur scientific! Samajh gaye?",
        "Ab dhyan dena, Left-Hand Side (yaani LHS) par jo cheezein reaction start karti hain, unhe hum 'Reactants' kehte hain. Agar ek se zyada reactants hain, toh unke beech '+' sign lagate hain. Set hai mamla?",
        "Aur reaction hone ke baad Right-Hand Side (yaani RHS) par jo naya magic banta hai, use 'Products' kehte hain. Products ki properties reactants se bilkul alag hoti hain! Aage chalein?",
        "Aur in dono ke beech mein jo teer ya arrow (→) hai na? Wo batata hai ki reaction kis direction mein ja rahi hai. Is arrow ko hum 'yields' ya 'produces' padhte hain.",
        "Toh batao, word equation aur formula equation ka difference, aur LHS-RHS ka funda bheje mein ghusa ya bouncer gaya? Bindaas batao, bolo 'Aage badho' ya 'Repeat'!"
      ],
      
      // Index 2: Balanced Chemical Equations 
      [
        "Ab aate hain Chemistry ke sabse bade aur rules ke baap par—Law of Conservation of Mass!",
        "Dekho yaar, ye poore universe ka niyam hai ki mass ko na toh tum khud se create kar sakte ho, aur na hi magically destroy kar sakte ho. Clear hai ye rule?",
        "Iska matlab bilkul saaf hai: reaction shuru hone se pehle reactants ka jitna total mass tha, reaction khatam hone ke baad products ka bhi total mass ekdum utna hi rahega! Samajh aayi baat?",
        "Reaction ke dauran atoms kahin gayab nahi hote aur na hi asman se tapakte hain, wo bas aaphas mein musical chairs khelte hain—yaani rearrange hokar naye substances bana lete hain. Aage badhein?",
        "Isiliye left side aur right side ke atoms hamesha barabar hone chahiye, jise hum 'Atom Balance' kehte hain. Yahan tak saath ho mere?",
        "Agar dono side atoms barabar nahi hain, toh us adhure equation ko hum 'Skeletal Equation' bolte hain. Jaise Mg plus O₂ gives MgO. Ab dekho, left mein do oxygen hain par right mein sirf ek! Ek oxygen kahan gaya? Aise toh Oxygen bura maan jayega na? Samajh rahe ho?",
        "Isi liye hum formulas ke aage coefficients lagakar dono side ke atoms ko ekdum barabar kar dete hain, jise kehte hain 'Balanced Equation'! Jaise 2Mg plus O₂ gives 2MgO. Ab hamari equation perfect hai aur Law of Conservation of Mass ko follow kar rahi hai.",
        "Toh batao, ye taraju wala atom balance ka funda dimaag mein ekdum fit baitha ya bouncer gaya? Just bolo 'Aage badho' ya 'Repeat'!"
      ],
      
      // Index 3: Balancing Equations step-by-step
      [
        "Chalo ab sabse mazedar puzzle solve karte hain—Equation ko balance karna! Is technique ko hum 'Hit-and-Trial' method kehte hain. Yaani hit karo, try karo, jab tak balance na ho jaye! Ready ho iske liye?",
        "Par ek golden rule hamesha yaad rakhna: Hum sirf chemical formula ke aage numbers laga sakte hain, jinhe 'coefficients' kehte hain. Formula ke andar wale chhote numbers ko galti se bhi touch mat karna! H₂O paani hota hai, agar tumne andar ka number badalkar H₂O₂ kar diya, toh wo hydrogen peroxide ban jayega aur pet mein hahakar mach jayega! Yaad rahega ye rule?",
        "Chalo ek example se 4 steps mein isko seekhte hain. Skeletal equation hai: Fe plus H₂O gives Fe₃O₄ plus H₂. Step 1: Pehle dono side ke atoms count karo. LHS mein 1 Iron, 2 Hydrogen aur 1 Oxygen hai. RHS mein 3 Iron, 2 Hydrogen aur 4 Oxygen hain. Dekha? Ye toh puri tarah se un-balanced hai! Samajh aaya pehla step?",
        "Step 2: Balance karna hamesha wahan se shuru karo jiske atoms sabse zyada unbalanced hon. Yahan Oxygen right mein 4 hain, par left mein sirf 1. Toh Left mein H₂O ke aage 4 laga do. Ab left mein bhi 4 Oxygen ho gaye! Clear?",
        "Step 3: Lekin ruko! H₂O ke aage 4 lagane se Hydrogen gadbada gaya. Left mein ab 4 into 2, yaani 8 Hydrogen ho gaye. Isko theek karne ke liye, Right side wale H₂ ke aage bhi 4 laga do. Boom! Hydrogen balance! Aage badhu?",
        "Step 4: Aakhiri step, Iron ko balance karna. Right mein 3 Iron hain, toh simple hai, Left wale Fe ke aage 3 laga do.",
        "And we are done! Hamari final balanced equation hai: 3 Fe plus 4 H₂O gives Fe₃O₄ plus 4 H₂.",
        "Kya baat hai, tum toh balancing ke boss ban gaye! Thoda lamba tha na ye process? Batao, bheje mein set hua ya ek baar phir se hit-and-trial lagaun? Bolo 'Aage badho' ya 'Repeat'!"
      ],
      
      // Index 4: Writing Symbols of Physical States (Covers Content + 4 Cards)
      [
        "Chalo ab aakhiri step dekhte hain—Physical States likhna! Sirf equation likhna kaafi nahi hai, humein batana padta hai ki chemical solid hai, liquid hai, ya gas. Isse equation ekdum professional aur informative lagti hai. Samajh rahe ho na?",
        "Iske liye hum chhote-chhote symbols use karte hain. Solid ke liye bracket me (s), liquid ke liye (l), aur gas ke liye (g). Ye bilkul waisa hai jaise contact save karte waqt naam ke aage 'Office' ya 'School' likhna! Yahan tak clear hai?",
        "Ek aur special symbol hota hai 'Aqueous' jiske liye hum (a q) likhte hain. Iska seedha sa matlab hai ki wo chemical paani (water) mein ghula hua hai. Bohot saari lab reactions isi aqueous form mein hoti hain. Aage badhu?",
        "Ab socho, agar kisi reaction ko start hone ke liye aag (heat), bohot saara pressure, ya sunlight ki zaroorat ho, toh usko kahan likhenge? Simple! Equation wale Arrow (teer) ke theek upar ya neeche. Isse pata chalta hai ki reaction kis mahaul me ho rahi hai. Set hai mamla?",
        "Ek mast example dekhte hain. Carbon monoxide gas, yaani C O (g), aur Hydrogen gas, H₂ (g), aapas mein react karte hain. Par inko 340 atm ka heavy pressure chahiye hota hai, jo hum arrow ke upar likhte hain. Tab jaake banta hai liquid methanol, yaani C H 3 O H (l). Samajh aaya ye example?",
        "Kya baat hai! Isi ke sath tumne chemical equations likhne ka pura masterclass complete kar liya. Tumhare dimaag ke saare concepts balance ho gaye! Agar sab kuch bheje mein set ho gaya hai, toh shaan se bolo 'Next'!"
      ]
    ],

    // ==========================================
    // TOPIC 2: TYPES OF CHEMICAL REACTIONS
    // ==========================================
    'ncert-ch1-types-of-reactions': [
      // Index 0: Intro
      [
        // Index 0: Intro
      "Welcome back, mere pyare dosto! Pichli baar humne seekha tha ki chemical equations ko balance kaise karte hain. "
          "Aaj hum chemistry ki duniya ka sabse chatpata aur mazedar topic shuru karne wale hain! "
          "Hum dekhenge ki ye chemicals aapas mein 'breakup' aur 'patch-up' kaise karte hain! "
          "Haan, bilkul sahi suna tumne—bilkul kisi Bollywood film ki tarah! "
          "Yaani, hamara aaj ka super-hit topic hai—Types of Chemical Reactions! "
          "Jaise har insaan ka apna ek nature hota hai, bilkul waise hi har chemical reaction ka apna ek alag swag, ek alag style hota hai. "
          "Koi aapas mein jud jata hai, toh koi ek jhatke mein alag ho jata hai! "
          "Tension ki bilkul baat nahi hai, Vigyaan didi ek-ek reaction ko dimaag mein fit kar degi. "
          "Toh kya tum is chemical drama ko dekhne ke liye bilkul taiyar ho? "
          "Agar full energy high hai, toh bas bindaas bolo 'Yes'!",
      ],
      // Index 1: Combination Reactions
      [
       
       "Pehla type hai Combination Reaction! Jiski tagline hi hai—'Bringing Elements Together'. "
          "Naam se hi pata chal raha hai dosto—jab do ya do se zyada cheezein milkar ek single product banayein, yaani inka 'patch-up' ho jaye! "
          "Chalo screen par diye gaye pehle card ko kholtes hain—'Combination Concept'. "
          "Isko yaad rakhne ka super-simple formula hai: A plus B gives AB! Yahan simpler substances jud kar ek complex compound banate hain. "
          "Ab doosra card dekho—'Common Examples'. Is dosti ke bade mazedar examples hain! "
          "Pehla hai burning of coal—yaani jab koyla (Carbon) hawa ki Oxygen ke saath jalta hai, toh banata hai Carbon Dioxide (C + O₂ → CO₂). "
          "Doosra example hai paani ka banna, jahan Hydrogen aur Oxygen gas milkar liquid water banate hain (2H₂ + O₂ → 2H₂O). "
          "Aur hamari slide ke main content mein ek aur super-hit example hai—Quicklime yaani chuna (CaO). Jab hum isme paani (H₂O) dalte hain, toh ye banta hai Slaked Lime (Calcium Hydroxide) aur bohot saari garmi nikalti hai! "
          "Chalo isi baat par teesra card dekhte hain—'Exothermic Reactions'. "
          "Ab dhyan se suno, jab bhi ye naye bonds bante hain na, toh is dosti ki khushi mein bohot saari heat energy bahar nikalti hai. "
          "Chemistry mein jis reaction mein se heat bahar nikle aur surroundings garam ho jayein, unhe hum Exothermic Reactions kehte hain! "
          "Aur aakhiri card toh tumhein bilkul hairan kar dega—'Respiration is Exothermic'. "
          "Jo khana hum khate hain, hamara badan use todkar Glucose banata hai. Jab ye glucose hamare cells mein Oxygen ke saath combine hota hai, toh carbon dioxide, paani aur bohot saari energy release hoti hai! "
          "Yahi energy humein zinda rakhti hai aur hamare body ko warm rakhti hai. Isiliye jo hum saans lete hain na, yaani respiration, wo bhi ek biological exothermic reaction hai! "
          "Toh batao, koyla jalne se lekar hamare saans lene tak ka ye combination aur exothermic ka funda bheje mein ekdum solid fit hua ya bouncer gaya? Just bolo 'Aage badho' ya 'Repeat'!",
      ],

      // Index 2: Decomposition Reactions
      [
        "Ab aata hai hamara doosra type—Decomposition Reaction! Jiski tagline hai—'Breaking Down Compounds'. "
          "Ye hamare pichle combination reaction ka ekdum ulta, yaani opposite hota hai! "
          "Combination mein patch-up ho raha tha, par yahan ek akela bada reactant toot kar do ya do se zyada chhote aur simpler substances mein divide ho jata hai—yaani inka breakup ho jata hai! "
          "Chalo screen par diye gaye pehle card ko kholtes hain—'Thermal Decomposition'. "
          "Thermal ka matlab hota hai heat! Jab hum kisi compound ko zor se garam karke todte hain, toh use Thermal Decomposition kehte hain. "
          "Jaise hamari slide ke main content mein diya hai: Limestone yaani Calcium Carbonate (CaCO₃) ko jab hum heat dete hain, toh wo toot kar banata hai Quicklime (CaO) aur Carbon Dioxide gas (CO₂)! Ye reaction cement factory jaise badki-badki industries mein bohot kaam aati hai. "
          "Ab doosra card dekho—'Electrolytic Decomposition'. "
          "Agar koi compound simple garmi se nahi toot raha, toh hum usme se tana-tan Electric Current pass kar dete hain! "
          "Iska sabse best example hai electrolysis of water—jab paani (H₂O) mein se electricity guzrati hai, toh wo use todkar Hydrogen aur Oxygen gas mein alag-alag kar deti hai. "
          "Chalo teesra card kholtes hain—'Photolytic Decomposition'. "
          "Yahan par compound ko todne ke liye dhoop yaani light energy ki zaroorat hoti hai. "
          "Jaise agar hum Silver Chloride (AgCl) ko dhoop mein rakh dein, toh wo toot kar gray rang ka Silver metal aur Chlorine gas bana deta hai (2AgCl gives 2Ag + Cl₂). Ab samajh aaya ki Silver ke salts ko lab mein hamesha dark rang ki bottles mein kyun chhupa kar rakhte hain? Taaki unpar dhoop na pade aur wo magically apne aap na toot jayein! "
          "Ab aakhiri card dekho—'Endothermic Reactions'. "
          "Toh dosto, tumne dhyan diya? Chahe Thermal ho, Electrolytic ho, ya Photolytic—in saare breakups mein compound ko todne ke liye humein bahaar se energy deni pad rahi hai, chahe heat, light ya electricity ke roop mein. "
          "Chemistry mein aisi reactions jo bahaar se energy ko absorb karti hain, unhe hum 'Endothermic Reactions' bolte hain! "
          "Toh batao, ye compound ka breakup, cement industry ka logic, aur dark bottles ka raaz dimaag mein ekdum solid tarike se ghusa ya upar se gaya? Bindaas bolo 'Aage badho' ya 'Repeat'!", 
        ],

      // Index 3: Displacement Reactions
      [
        "Ab aata hai hamara teesra aur sabse dramatic type—Displacement Reaction! "
          "Jiski tagline hi dekh lo—'The Battle for Reactivity'! Yaani taqat ki ladaai! "
          "Isme ek zyada taqatwar, yaani more reactive element, ek kamzor, yaani less reactive element ko uski jagah se dhakka maar ke hata deta hai aur khud uski seat par baith jata hai. "
          "Chalo screen par diye gaye pehle card ko kholtes hain—'The Concept'. "
          "Isko samajhne ka super-easy formula hai: A plus BC gives AC plus B! "
          "Yahan element 'A' bohot gusse mein aata hai, 'B' ko uske partner 'C' ke paas se laat maar kar nikaal deta hai, aur khud 'AC' bana leta hai! Bechaara 'B' akela reh jata hai. "
          "Ab doosra card dekho—'Classic Experiment'. Ye tumhare lab ka sabse famous experiment hai! "
          "Agar hum ek lohe ki keel, yaani Iron nail (Fe) ko neele rang ke Copper Sulphate (CuSO₄) solution mein daal dein, toh kya hoga? "
          "Kyunkii Iron copper se bohot zyada taqatwar hai, wo copper ko dhakka dega aur bana lega Iron Sulphate (Fe plus CuSO₄ gives FeSO₄ plus Cu)! "
          "Chalo teesra card khol kar iska magic dekhtey hain—'Visual Changes'. "
          "Jab ye reaction hoti hai na, toh do bade badlav dikhte hain: Pehla, jo solution ka bright blue colour tha, wo dheere-dheere fade hokar light green rang ka ho jata hai kyunki ab wo Iron Sulphate ban chuka hai! "
          "Aur doosra, us lohe ki keel par ek reddish-brown (laal-bhoore) rang ki layer chadh jaati hai, jo aur kuch nahi balki wahi bechaara displaced Copper metal hai jo keel par aakar chipak gaya hai! "
          "Ab aakhiri card dekho—'Other Metals'. "
          "Kya sirf Iron hi copper ko hara sakta hai? Nahi yaar! Zinc (Zn) aur Lead (Pb) bhi copper se bohot zyada reactive hote hain. "
          "Jaise hamari slide ke main content ka example hai: Zn plus CuSO₄ gives ZnSO₄ plus Cu. "
          "Yahan Zinc ne copper ko nikaal diya aur zinc sulphate ka rang-heen (colourless) solution bana diya! Ye sab isliye hota hai kyunki metals ek 'Reactivity Series' follow karte hain jahan upar baithne wale metals hamesha neeche wale metals ko displace kar dete hain. "
          "Toh batao, ye taqatwar aur kamzor metal ki ladaai, aur keel ka rang badalna dimaag mein ekdum solid set hua ya bouncer gaya? Just bolo 'Aage badho' ya 'Repeat'!",
      ],
      // Index 4: Double Displacement Reactions
      [
        // Index 4: Double Displacement Reactions (Covers Content + All 4 Interactive Cards)
      "Ab aate hain hamare chauthe type par—Double Displacement Reaction! "
          "Jiski tagline hai—'Mutual Exchange of Ions'. Yaani dono taraf se dosti ka badla-badli! "
          "Single displacement mein toh ek taqatwar metal doosre ko dhakka maar raha tha, par yahan koi ladaai nahi hoti. Yahan dono compounds aapas mein bohot samajhdari se kaam lete hain aur apne partners ko exchange kar lete hain! "
          "Chalo screen par diye gaye pehle card ko kholtes hain—'The Concept'. "
          "Isko samajhne ka super-hit formula hai: AB plus CD gives AD plus CB! "
          "Dhyan se dekho, 'A' ne 'B' ko chhodkar 'D' ke saath jodi bana li (AD), aur 'C' ne 'B' ke saath (CB). Yaani reactants ke positive ions (cations) aur negative ions (anions) ne aapas mein seats swap kar li! "
          "Ab doosra card dekho—'Ion Exchange'. Chalo iska ek live example dekhte hain jo hamari slide ke main content mein bhi diya hai. "
          "Jab hum Barium Chloride (BaCl₂) aur Sodium Sulphate (Na₂SO₄) ke pani wale solution ko aapas mein milate hain, toh unke ions free ho jate hain. Barium (Ba²⁺) bhaag kar Sulphate (SO₄²⁻) ke paas chala jata hai aur Sodium (Na⁺) bhaag kar Chloride (Cl⁻) ke paas! "
          "Lekin is swap ke baad ek bahut hi joradar magic hota hai! Chalo teesra card kholtes hain—'Precipitation Reactions'. "
          "Jab ye dono clear liquid solutions aapas mein milte hain, toh ek aisa naya solid banta hai jo paani mein bilkul nahi ghulta! Chemistry mein is insoluble solid ko hum 'Precipitate' kehte hain. Aur jis reaction mein ye precipitate banta hai, use 'Precipitation Reaction' bhi bola jata hai! "
          "Ab aakhiri card dekho—'The White Precipitate'. "
          "Jaise hi humne un dono clear solutions ko milaya, toh Barium Sulphate (BaSO₄) banta hai jo paani mein dissolve nahi hota. Isiliye test tube mein ekdum se dahi jaisa thick, safed rang ka solid dikhne lagta hai jo dheere-dheere niche baith jata hai. Yahi white solid hamara precipitate hai! Aur doosra product, yaani Sodium Chloride (NaCl), wo toh namak hai, isliye wo paani mein hi ghula rehta hai. "
          "Toh batao, ye ions ki mutual partnership aur test tube mein safed dahi jaisa precipitate banne ka funda dimaag mein ekdum solid fit hua ya bouncer gaya? Just bolo 'Aage badho' ya 'Repeat'!",
      ],
      // Index 5: Oxidation and Reduction (Redox)
      [
        // Index 5: Oxidation and Reduction (Redox) (Covers Content + All 4 Interactive Cards)
      "Ab aate hain hamari aakhiri aur sabse dhamakedar reaction par—Oxidation and Reduction! "
          "Jiski tagline hai—'The Transfer of Oxygen and Hydrogen'. "
          "Dosto, ye dono reactions hamesha saath-saath chalti hain, bilkul Jai aur Veeru ki dosti ki tarah! Inke isi gehre rishte ki wajah se inko milakar hum bolte hain 'Redox Reaction'—jahan RED ka matlab hai Reduction aur OX ka matlab hai Oxidation! "
          "Chalo screen par diye gaye pehle card ko kholtes hain—'Oxidation'. "
          "Oxidation ka matlab bohot simple hai—jab koi substance reaction ke dauran Oxygen ko gain karta hai (yaani oxygen uske paas aata hai) ya fir Hydrogen ko lose karta hai (yaani hydrogen chala jata hai). Jaise jab Magnesium ribbon hawa mein jalta hai, toh use oxygen mil jata hai aur wo oxidize ho jata hai! "
          "Ab doosra card dekho—'Reduction'. "
          "Ye oxidation ka ekdum ulta hai! Jab koi substance oxygen ko lose karta hai (oxygen chhod deta hai) ya fir hydrogen ko gain karta hai (hydrogen ko apna leta hai), toh use hum Reduction kehte hain. "
          "Chalo teesra card kholtes hain—'Redox Concept'. "
          "Ab dhyan se socho, agar ek compound oxygen de raha hai (reduction), toh koi doosra substance use lene ke liye wahan hona chahiye na (oxidation)? Oxygen hawa mein magically gayab toh nahi hoga! Isiliye ye dono hamesha ek hi reaction mein saath-saath होते hain. Badi classes mein tum seekhoge ki isme electrons ka lena-dena bhi hota hai! "
          "Ab aakhiri card dekho jahan iska sabse bada example diya hai—'Copper Oxide Example'. "
          "Reaction screen par dekho: CuO plus H₂ ko jab hum garam karte hain, toh banta hai Cu plus H₂O. "
          "Yahan kale rang ka Copper Oxide (CuO) apna oxygen lose kar raha hai aur badal raha hai sirf Copper (Cu) mein. Kyunki isne oxygen khoya, toh Copper Oxide ka kya hua? Bilkul sahi—Reduction! "
          "Wahi doosri taraf, Hydrogen gas (H₂) us oxygen ko lapak leti hai aur badal jaati hai paani (H₂O) mein. Kyunki isne oxygen gain kiya, toh Hydrogen ka kya hua? Ekdum correct—Oxidation! "
          "Toh batao, Jai-Veeru ki ye Redox jodi, aur oxygen ke lene-dene ka khel dimaag mein ekdum solid fit hua ya bouncer gaya? Agar sab set hai, toh full energy mein bolo 'Next'!",
      ]
    ],

    // ==========================================
    // TOPIC 3: EFFECTS OF OXIDATION (EVERYDAY LIFE)
    // ==========================================
    'ncert-ch1-oxidation-effects': [
      // Index 0: Intro
      [
        "Hello hello, mere dosto! Welcome back! Ab tak humne lab ke andar bade bade chemical reactions dekhe, breakup-patchup seekha aur balancing ke boss ban gaye. "
          "Par kya tum jaante ho? Hawa mein jo Oxygen ghum rahi hai na, wo sirf humein saans lene mein help nahi karti—wo chupke-chupke hamare aas-paas ki cheezon par attack bhi karti hai! "
          "Yaani aaj ka hamara topic hai—Effects of Oxidation Reactions in Everyday Life! "
          "Ghar par lohe ke gate par zang (rust) lagna ho, chandi ka kala padna ho, ya fir kitchen mein rakhe chips ya namkeen ka kharab ho jana—ye sab isi hawa ke oxygen ka kaarnama hai! "
          "Is pure topic mein hum do sabse bade villains ke baare mein padhenge: pehla hai 'Corrosion of Metals' aur doosra hai 'Rancidity of Fats and Oils'. Sath hi hum ye bhi seekhenge ki in villains se apni cheezon ko kaise bachana hai! "
          "Toh kya tum apne as-paas hone wale is oxidation ke magic aur uske nuksan ko samajhne ke liye taiyar ho? "
          "Agar ready ho, toh full excitement ke saath bolo 'Yes'!",
      ],
      // Index 1: Corrosion
      [
        "Chalo dosto, milte hain hamare pehle villain se—Corrosion! Jiski tagline hai—'The Slow Degradation of Metals'. "
          "Ye metal ka aisa dushman hai jo dheere-dheere unhe andar se kh खोखला (hollow) kar deta hai! "
          "Jab bhi koi metal apne aas-paas ki cheezon jaise hawa (Oxygen), moisture (paani), acids, ya salts ke contact mein aata hai, toh unke beech ek slow chemical reaction shuru ho jaati hai. Metal dheere-dheere apni asli chamak aur taqat khone lagta hai aur uske upar oxides ya carbonates ki ek buri si layer chadh jaati hai. Isi barbaadi ko hum Corrosion kehte hain! "
          "Chalo screen par diye gaye pehle card ko kholtes hain—'Rusting of Iron'. "
          "Bhai, loha (Iron) toh shuruwaat mein ekdum mast shiny hota hai na? Par jaise hi use thodi si nami aur hawa milti hai, us par ek laal-bhoore rang ka (reddish-brown) flaky powder chadh jata hai, jise hum 'Rust' yaani zang kehte hain! Ye hydrated iron oxide hota hai jo lohe ko ekdum kamzor aur brittle bana deta hai. "
          "Ab doosra card dekho—'Tarnishing of Silver'. "
          "Kya tumne notice kiya hai ki mummy ki chandi (silver) ki payal ya ghar ke bartan dheere-dheere kale padne lagte hain? Aisa isliye hota hai kyunki chandi hawa mein maujood sulphur gases ke saath react karke 'Silver Sulphide' ki ek patli, kaali layer bana leti hai. Ise 'Tarnishing' bolte hain! "
          "Chalo teesra card kholtes hain—'Greening of Copper'. "
          "Ye wala toh bade mazy ka magic hai! Copper ke bartan ya puraane zamane ke coins dheere-dheere laal-bhoore rang se badalkar dulle green rang ke ho jaate hain. Kyun? Kyunki copper hawa ki carbon dioxide aur moisture se react karke apne upar 'Basic Copper Carbonate' ki ek haring rang (green) ki layer chadha leta hai! "
          "Ab aakhiri card dekho—'Impact of Corrosion'. "
          "Toh yaar, ye corrosion sirf rang badalna ya powder banna nahi hai, ye poori duniya ke liye ek bohot badi aafat hai! Ye dheere-dheere badi-badi gaadiyon ki bodies, iron railings, jahazon, badi-badi buildings aur pulon (bridges) ko kamzor karke unhe gira deta hai. Iski wajah se har saal poore duniya mein arabon-kharabon rupaye ka nuksaan hota hai! "
          "Toh batao, lohe ka zang lagna, chandi ka kala padna, aur copper ka hara hona—ye saara corrosion ka kissa dimaag mein ekdum solid fit hua ya bouncer gaya? Just bolo 'Aage badho' ya 'Repeat'!",
      ],

      // Index 2: Prevention of Corrosion
      [
       "Pichli slide mein humne dekha ki hamara villain 'Corrosion' kaise arbon rupaye ka nuksaan karta hai. "
          "Toh ab waqt aa gaya hai hamari infrastructure ko bachane ka, yaani hamari aaj ki tagline hai—'Protecting Our Infrastructure'! "
          "Corrosion se bachne ka sabse bada mool-mantra hai: metal aur hawa-paani ke beech ek majboot deewar (barrier) khadi kar dena! "
          "Chalo screen par diye gaye pehle card ko kholtes hain—'Galvanization'. "
          "Ye exams ke liye bohot hi important super-hit concept hai! Galvanization ka matlab hota hai lohe (iron) ya steel ke upar Zinc metal ki ek patli si layer chadha dena. Ab mazy ki baat suno—Zinc iron se zyada reactive hota hai! Iska fayda ye hota hai ki agar Zinc ki layer par thoda scratch bhi aa jaye na, toh bhi Zinc khud ko sacrifice kar dega, hawa-paani se khud pehle react karegii, par andar ke lohe ko zang nahi lagne dega! "
          "Ab doosra card dekho—'Alloying'. "
          "Ye metal ki taqat badhane ka ek bohot hi smart tareeka hai. Loha (Iron) duniya mein sabse zyada use hota hai, par pata hai? Pure iron bohot soft hota hai, use hum asliyat mein bina mix kiye use nahi kar sakte kyunkii wo garam hone par aasani se khinch jata hai. Agar hum isme thoda sa Carbon mix kar dein, toh ye ekdum sakt aur majboot ho jata hai! Aur khi jab isi iron ko hum Nickel aur Chromium ke saath mix karte hain, toh humein milta hai 'Stainless Steel'—jo sakt bhi hota hai aur jisme galti se bhi kabhi zang nahi lagta! "
          "Chalo teesra card kholtes hain—'Barrier Methods'. "
          "Ye toh hamare gharon ka sabse simple aur desi tareeka hai—painting, oiling aur greasing! Paint ya grease ki ek layer lagane se lohe ki surface hawa aur moisture ke direct contact mein nahi aati. Isi wajah se hum apne ghar ke lohe ke gates, railings aur machinery ke parts ko time-to-time paint karte rehte hain taaki unhe zang se bachaya ja sake! "
          "Toh batao dosto, Zinc ka sacrifice yaani galvanization, stainless steel ka secret recipe, aur painting ka funda dimaag mein ekdum solid fit hua ya bouncer gaya? Just bolo 'Aage badho' ya 'Repeat'!",
      ],
      // Index 3: Rancidity
      [
        // Index 3: Rancidity (Covers Content + Both Interactive Cards)
      "Ab milte hain hamare doosre villain se—Rancidity! Jiski tagline hai—'The Spoilage of Fats and Oils'. "
          "Kya tumne kabhi notice kiya hai ki agar koi chips ka packet ya namkeen bohot dino tak khula chhod diya jaye, toh usme se ek ajeeb si buri smell aur bad-zaika taste aane lagta hai? "
          "Ghar pe mummy log bolti hain na ki khana 'seenkh' gaya hai ya kharab ho gaya hai? Chemistry mein isi ko Rancidity bolte hain! "
          "Jab khane mein maujood fats aur oils hawa ke oxygen ke saath dheere-dheere react karte hain, toh unka oxidation ho jata hai. Is oxidation ki wajah se khane ka taste, smell aur quality sab kuch kharab ho jata hai, aur aisa khana hamari sehat ke liye bhi unhealthy ho sakta hai! "
          "Chalo screen par diye gaye pehle card ko kholtes hain—'The Chemical Process'. "
          "Iska chemical raaz samajhte hain. Jab fat aur oil ke molecules oxidize hote hain, toh wo toot kar naye volatile chemicals banate hain. Yahi volatile chemicals us khane mein se wo gandi, baasi (stale) smell paida karte hain, jise soonghte hai hum bolte hain—'Ye chips toh kharab hain!' "
          "Ab doosra card dekho—'Detecting Spoilage'. "
          "Hum kaise pehchanein ki khana rancid ho chuka hai? Iske do sabse bade signs hain: pehla, khane ka taste ekdum badal jata hai, aur doosra, usme se ek baasi ya 'crayony' (jaise crayons color hote hain na) ajeeb si smell aane lagti hai. Kabhi-kabhi toh chemical bonds tootne ki wajah se khana bohot zyada sticky ya chipchipa bhi ho jata hai! "
          "Ab sawal ye uthta hai ki is villain se apne khane ko bachayein kaise? Toh hamari slide ke main content mein iske super-hit hacks diye hain: khane ko airtight dabbe mein band karke rakho, fridge yaani refrigeration mein rakho, ya fir unme nitrogen gas bhar do! "
          "Toh batao dosto, chips ka stale hona, volatile chemicals ka raaz, aur khane ke kharab hone ka ye rancidity wala funda dimaag mein ekdum solid fit hua ya bouncer gaya? Just bolo 'Aage badho' ya 'Repeat'!",
      ],
      // Index 4: Prevention of Rancidity
      [
        "Pichli slide mein humne dekha ki kaise hamara doosra villain 'Rancidity' khane ka swad aur smell kharab kar deta hai. "
          "Toh ab waqt aa gaya hai apne khane ko fresh aur safe rakhne ka, yaani hamari aaj ki tagline hai—'Keeping Food Fresh'! "
          "Rancidity se ladne ke liye hamare paas bohot saari cool techniques hain, jo khane ke oxidation process ko ekdum slow ya fir poori tarah stop kar deti hain. "
          "Chalo screen par diye gaye pehle card ko kholtes hain—'Nitrogen Flushing'. "
          "Bhai, tumne dhyan diya hai? Jab tum 5 ya 10 rupaye wala chips ka packet khareedte ho, toh usme chips kam aur hawa zyada bhari hoti hai na? Hum hamesha shopkeeper ko bolte hain ki 'Bhaiya isme toh sirf hawa bhari hai!' "
          "Par dosto, wo koi ordinary hawa nahi hoti, wo hoti hai 'Nitrogen gas'! Nitrogen ek non-reactive, inert gas hai. Jab chips ko pack kiya jata hai, toh packet se saari Oxygen nikal kar usme nitrogen flush kar di jaati hai. Ye nitrogen ek oxygen-free environment banati hai, jisse chips mahino tak ekdum kurkure (crisp) aur fresh rehte hain! "
          "Ab doosra card dekho—'Using Antioxidants'. "
          "Ye hamare khane ke bodyguard hain! Antioxidants aisi substances hoti hain jo khud oxidize ho jaati hain par hamare khane ke fats aur oils ko oxygen ke attack se bacha leti hain. Inhe oxygen scavengers bhi bola jata hai kyunki ye oxidation ki chain reaction ko beech mein hi tod deti hain, jisse food ka shelf life bohot lambe samay tak badh jata hai. "
          "Chalo teesra card kholtes hain—'Airtight Storage'. "
          "Ye toh hamare gharon ka sabse classic aur super-easy hack hai! Khane ko airtight dabbo ya sealed packets mein band karke rakha. Jab container ekdum pack hoga, toh andar bahaar ki taaza oxygen nahi ja payegi. Jab oxygen hi kam hogi, toh oxidation ki speed itni slow ho jayegi ki fats ko rancid hone mein bohot lamba samay lag jayega! Iske alawa agar hum khane ko thandi aur andheri (dark, cool) jagah par rakhein, toh chemical reaction ka rate aur bhi ghatt jata hai. "
          "Toh batao dosto, chips ke packet ki hawa ka raaz, antioxidants ki bodyguard-giri, aur airtight storage ka logic dimaag mein ekdum solid fit hua ya bouncer gaya? Agar sab samajh aa gaya, toh full energy mein bolo 'Next'!",
      ]
    ],
  };

  /// Fallback Intro 
  static List<String> getGenericIntro(String title) {
    return [
      "Hey there! Aaj hum '$title' ke baare mein baat karenge.",
      "Main hoon Vigyaan, tumhari AI friend aur mentor. Tension mat lo, milkar seekhenge. Chalo, bina kisi deri ke shuru karte hain. Bolo 'Yes'!"
    ];
  }

  /// Fallback Explanation
  static List<String> getGenericExplanation(String title) {
    return [
      "Toh dosto, '$title' ka basic concept yehi hai.",
      "Isse dhyan se samajhna kyunki ye aage bahut kaam aayega. Bheje mein ghusa ya upar se gaya? Bindaas bolo 'Aage badho' ya 'Repeat'!"
    ];
  }
}
