import 'dart:developer';
import 'dart:math';
import 'package:flutter_svg/svg.dart';
import 'package:marineapp/Component/global.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class IntroScreen extends StatefulWidget {
  final String image;
  final String title;

  const IntroScreen({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final CarouselSliderController _carouselController =
  CarouselSliderController();
  int _currentIndex = 0;
  String contentText = "";
  int selectedTopicIndex = 0;
  var name;
  var hey;

  List<String> carouselImages = [];
  final List<String> topics = [
    'Introduction',
    'How Does It Look',
    'Where Does It Live',
    'Life Requisites and Behaviour',
    'Threats',
    'Conservation Status',
    'Takeaway'
  ];
  final List<String> topics_guj = [
    'પરિચય',
    'તે કેવી રીતે દેખાય છે',
    'તે ક્યાં રહે છે',
    'જીવન જરૂરીયાતો અને વર્તન',
    'ખતરો',
    'સંરક્ષણ સ્થિતિ',
    'શું શિખીયા'
  ];

  final List<String> Dolphin = [
    "The humpback dolphin is a remarkable marine mammal known for the distinctive hump on its back, located just in front of its dorsal fin. This hump, along with its long, slender body and beak, gives the dolphin a unique appearance among other dolphin species. Humpback dolphins are primarily coastal animals, often found close to shorelines, where they navigate and thrive in complex, shallow water environments.",
    "Humpback dolphins are medium-sized cetaceans, typically reaching lengths of 2 to 2.8 meters and weighing between 100 to 150 kilograms. They have a long, slender body with a distinct hump on their back, just in front of the dorsal fin. Their coloration can vary, but they are generally light grey, with the possibility of a pinkish hue in some populations, particularly in older individuals. The long beak is another prominent feature, and their eyes are set slightly forward, providing good vision in their often-turbid coastal habitats.",
    "Humpback dolphins are found in shallow coastal waters across the Indian and western Pacific Oceans, from the coast of southern Africa to Southeast Asia. These dolphins prefer areas with depths of less than 20 meters, often near estuaries, bays, and mangrove forests, where the water is rich in fish and other prey.On the Gujarat coast, particularly in the Gulf of Kachchh and the Gulf of Cambay (Gulf of Khambhat), humpback dolphins are commonly found. These regions offer the shallow, sheltered waters that humpback dolphins favor, along with a plentiful supply of fish and crustaceans. The mangroves and mudflats of the Gulf of Kachchh provide crucial habitats for these dolphins, where they can hunt, socialize, and raise their young.",
    "Humpback dolphins are social animals, often seen in small groups ranging from a few individuals to over a dozen. They are known for their acrobatic displays, including breaching and tail slapping, though they are generally less active on the surface compared to other dolphin species. These dolphins communicate using a variety of clicks, whistles, and body language.Their diet mainly consists of fish, but they also consume crustaceans and cephalopods. Humpback dolphins are skilled hunters, often using cooperative hunting techniques to herd fish into tight groups, making them easier to catch. They rely heavily on their acute echolocation abilities to navigate and locate prey in the murky waters.",
    "The Humpback Dolphin in India, particularly along the Gujarat coast, faces significant threats primarily due to habitat degradation from coastal development and pollution. The construction of ports, industrial activities, and increased shipping traffic disrupt their natural habitats and migratory routes. Additionally, pollution from industrial discharge and plastic waste contaminates their environment, leading to health risks. Bycatch in fishing nets and illegal hunting further endangers their population. The combined effects of these threats are exacerbating the decline of Humpback Dolphins in Gujarat, making urgent conservation efforts critical for their survival. In areas like the Gulf of Kachchh and the Gulf of Cambay, increasing boat traffic and industrial activities pose additional risks, including noise pollution, which can interfere with the dolphins' echolocation and communication.",
    "Humpback dolphins face several conservation challenges.  But conservation efforts are focused on protecting the species and its critical habitats. Humpback Dolphin (Sousa plumbea) is listed as \"Endangered\" (EN) on the IUCN Red List. As per Indian Wildlife (Protection) Amendment Act, 2022, this is a Schedule I mammal. This categorization reflects the significant threats the species faces In some regions, marine protected areas have been established that safeguard key habitats from further degradation. ",
    "The humpback dolphin is a unique and important species within the marine ecosystems of the Gujarat coast, particularly in the Gulf of Kachchh and the Gulf of Cambay. Protecting these dolphins and their habitats is essential not only for their survival but also for the health and diversity of the coastal ecosystems they inhabit. Conservation actions, including habitat protection and sustainable fishing practices, are crucial to ensuring that future generations can continue to enjoy and learn about these remarkable animals."
  ];
  final List<String> Dolphin_guj = [
    "હમ્પબેક ડોલ્ફિન એક નોંધપાત્ર દરિયાઈ સસ્તન પ્રાણી છે જે તેની પીઠ પરના વિશિષ્ટ ખૂંધ માટે જાણીતું છે, જે તેની ડોર્સલ ફિનની બરાબર સામે સ્થિત છે. આ હમ્પ, તેના લાંબા, પાતળી શરીર અને ચાંચ સાથે, ડોલ્ફિનને અન્ય ડોલ્ફિન પ્રજાતિઓમાં અનન્ય દેખાવ આપે છે. હમ્પબેક ડોલ્ફિન મુખ્યત્વે દરિયાકાંઠાના પ્રાણીઓ છે, જે ઘણીવાર દરિયાકિનારાની નજીક જોવા મળે છે, જ્યાં તેઓ જટિલ, છીછરા પાણીના વાતાવરણમાં શોધખોળ કરે છે અને ખીલે છે.",
    "હમ્પબેક ડોલ્ફિન મધ્યમ કદના સિટેશિયન છે, સામાન્ય રીતે 2 થી 2.8 મીટરની લંબાઇ સુધી પહોંચે છે અને 100 થી 150 કિલોગ્રામ વજનની વચ્ચે હોય છે. તેઓની પીઠ પર એક અલગ ખૂંધ સાથેનું લાંબુ, પાતળું શરીર હોય છે, માત્ર ડોર્સલ ફિનની સામે. તેમનો રંગ અલગ-અલગ હોઈ શકે છે, પરંતુ તેઓ સામાન્ય રીતે આછા રાખોડી રંગના હોય છે, જેમાં કેટલીક વસ્તીમાં ગુલાબી રંગની શક્યતા હોય છે, ખાસ કરીને મોટી ઉંમરની વ્યક્તિઓમાં લાંબી ચાંચ એ અન્ય મુખ્ય લક્ષણ છે, અને તેમની આંખો થોડી આગળ હોય છે, જે તેમના વારંવાર-ટર્બિડમાં સારી દ્રષ્ટિ પ્રદાન કરે છે. દરિયાકાંઠાના રહેઠાણો.",
    "હમ્પબેક ડોલ્ફિન દક્ષિણ આફ્રિકાના દરિયાકાંઠાથી દક્ષિણપૂર્વ એશિયા સુધીના સમગ્ર ભારતીય અને પશ્ચિમ પેસિફિક મહાસાગરોના છીછરા દરિયાકાંઠાના પાણીમાં જોવા મળે છે. આ ડોલ્ફિન 20 મીટરથી ઓછી ઊંડાઈ ધરાવતા વિસ્તારોને પસંદ કરે છે, ઘણી વખત નદીમુખો, ખાડીઓ અને મેન્ગ્રોવ જંગલોની નજીક, જ્યાં પાણી માછલીઓ અને અન્ય શિકારથી ભરપૂર છે. ગુજરાતના દરિયાકાંઠે, ખાસ કરીને કચ્છના અખાત અને ખંભાતના અખાતમાં, હમ્પબેક ડોલ્ફિન સામાન્ય રીતે છીછરા, આશ્રયવાળા પાણીમાં જોવા મળે છે જે હમ્પબેક ડોલ્ફિનને પસંદ કરે છે , માછલીઓ અને ક્રસ્ટેશિયનોના પુષ્કળ પુરવઠાની સાથે કચ્છના અખાતના મેન્ગ્રોવ્સ અને મડફ્લેટ્સ આ ડોલ્ફિન માટે નિર્ણાયક રહેઠાણ પૂરા પાડે છે, જ્યાં તેઓ શિકાર કરી શકે છે, સામાજિક બનાવી શકે છે અને તેમના બચ્ચાને ઉછેરી શકે છે.",
    "હમ્પબેક ડોલ્ફિન એ સામાજિક પ્રાણીઓ છે, જે ઘણી વખત અમુક વ્યક્તિઓથી માંડીને એક ડઝનથી વધુ સુધીના નાના જૂથોમાં જોવા મળે છે. તેઓ ભંગ અને પૂંછડી મારવા સહિત તેમના બજાણિયાના પ્રદર્શન માટે જાણીતા છે, જોકે તેઓ સામાન્ય રીતે અન્ય ડોલ્ફિન પ્રજાતિઓની તુલનામાં સપાટી પર ઓછા સક્રિય હોય છે. . તેઓને પકડવામાં સરળતા રહે છે.",
    "ભારતમાં હમ્પબેક ડોલ્ફિન, ખાસ કરીને ગુજરાતના દરિયાકાંઠે, દરિયાકાંઠાના વિકાસ અને પ્રદૂષણથી રહેઠાણના ઘટાડાને કારણે મુખ્યત્વે નોંધપાત્ર જોખમોનો સામનો કરે છે. બંદરોનું નિર્માણ, ઔદ્યોગિક પ્રવૃત્તિઓ અને વહાણવટાની વધતી જતી ટ્રાફિક તેમના કુદરતી રહેઠાણો અને સ્થળાંતર માર્ગોને અવરોધે છે. વધુમાં, પ્રદૂષણ ઔદ્યોગિક સ્રાવ અને પ્લાસ્ટિક કચરો તેમના પર્યાવરણને દૂષિત કરે છે, જેનાથી માછીમારીની જાળમાં બાયકેચ થાય છે અને ગેરકાયદેસર શિકાર તેમની વસ્તીને વધુ જોખમમાં મૂકે છે, આ જોખમોની સંયુક્ત અસરો ગુજરાતમાં હમ્પબેક ડોલ્ફિનના ઘટાડાને વધારી રહી છે, તેમના માટે તાત્કાલિક સંરક્ષણ પ્રયાસો મહત્વપૂર્ણ છે. કચ્છના અખાત અને ખંભાતના અખાત જેવા વિસ્તારોમાં અસ્તિત્વ ટકાવી રાખવાથી બોટ ટ્રાફિક અને ઔદ્યોગિક પ્રવૃત્તિઓ વધારાના જોખમો ઉભી કરે છે, જેમાં ધ્વનિ પ્રદૂષણનો સમાવેશ થાય છે, જે ડોલ્ફિનના ઇકોલોકેશન અને સંચારમાં દખલ કરી શકે છે.",
    "હમ્પબેક ડોલ્ફિનને અનેક સંરક્ષણ પડકારોનો સામનો કરવો પડે છે. પરંતુ સંરક્ષણ પ્રયાસો પ્રજાતિઓ અને તેના નિર્ણાયક રહેઠાણોના રક્ષણ પર કેન્દ્રિત છે. હમ્પબેક ડોલ્ફિન (સોસા પ્લમ્બેઆ)ને IUCN રેડ લિસ્ટમાં \"એન્ડેન્જર્ડ\" (EN) તરીકે સૂચિબદ્ધ કરવામાં આવી છે. ભારતીય વન્યજીવ (Indian Wildlife) મુજબ સંરક્ષણ) સુધારો અધિનિયમ, 2022, આ એક અનુસૂચિ I સસ્તન પ્રાણી છે, આ વર્ગીકરણ કેટલાક પ્રદેશોમાં, દરિયાઈ સંરક્ષિત વિસ્તારો સ્થાપિત કરવામાં આવ્યા છે જે મુખ્ય વસવાટોને વધુ અધોગતિથી સુરક્ષિત કરે છે.",
    "હમ્પબેક ડોલ્ફીન એ ગુજરાતના દરિયાકાંઠાના દરિયાઇ જીવસૃષ્ટિમાં, ખાસ કરીને કચ્છના અખાત અને ખંભાતના અખાતમાં એક અનોખી અને મહત્વની પ્રજાતિ છે. આ ડોલ્ફિન અને તેમના રહેઠાણોનું રક્ષણ કરવું એ માત્ર તેમના અસ્તિત્વ માટે જ નહીં, પરંતુ આરોગ્ય અને આરોગ્ય માટે પણ જરૂરી છે. તેઓ જે દરિયાકાંઠાના ઇકોસિસ્ટમમાં વસવાટ કરે છે તેની વિવિધતા, જેમાં વસવાટની સુરક્ષા અને ટકાઉ માછીમારીની પદ્ધતિઓનો સમાવેશ થાય છે, તે સુનિશ્ચિત કરવા માટે નિર્ણાયક છે કે ભવિષ્યની પેઢીઓ આ અદ્ભુત પ્રાણીઓનો આનંદ માણી શકે અને શીખી શકે."
  ];

  final List<String> FINLESS_PORPOISE = [
    "The Finless Porpoise (Neophocaena phocaenoides) is one of the smallest cetacean species. It belongs to the family Phocoenidae. Unlike other porpoises, it is characterized by the absence of a dorsal fin, hence its name. But, it is also known as Little Indian Porpoise. The term “porpoise” is derived from the Latin word “porcopiscis,” which means “pig-fish” due to their rounded bodies and snouts.This species is found in coastal waters, estuaries, and river systems of Asia, particularly in the Indo-Pacific region, including the waters of the Indian subcontinent, Southeast Asia, and parts of East Asia.",
    "The Finless Porpoise has a distinctive, streamlined body that tapers smoothly towards the tail. The absence of a dorsal fin is one of its most notable features, replaced by a narrow ridge along its back, which is sometimes covered with small tubercles. This unique adaptation is thought to aid in stealth, reducing water disturbance and making the animal less conspicuous to both prey and predators. Adult Finless Porpoises typically reach a length of 1.5 to 2 meters and weigh between 30 to 60 kilograms. Their coloration varies from dark grey to light grey, with a lighter ventral side. The species has a rounded head with no prominent beak, and the blowhole is positioned slightly to the left of the midline, a characteristic shared by all porpoises.",
    "Finless Porpoises inhabit shallow coastal waters, typically preferring depths of less than 50 meters. They are commonly found in areas with soft sandy or muddy bottoms, which support their diet of fish, crustaceans, and cephalopods. Their range extends from the Persian Gulf, across the Indian Ocean, and into the waters of Southeast Asia, including the South China Sea, extending northward to the Yellow Sea and the coastal regions of Japan.In freshwater environments, Finless Porpoises are known to inhabit river systems such as the Yangtze River in China, where a subspecies, the Yangtze Finless Porpoise (Neophocaena asiaeorientalis asiaeorientalis), is Critically Endangered. In India, it occurs along the west and east coasts of of India. Outside Gujarat, it has been reported from Malabar coast, east coast, Mumbai and South Canara. The population of this species in India is small.",
    "Finless Porpoises are generally shy and elusive, making them difficult to study in the wild. They are known to be solitary or found in small groups of two to four individuals. Unlike their more social relatives, dolphins, Finless Porpoises do not display acrobatic behaviors and are rarely seen breaching the water’s surface.Their diet primarily consists of small fish, cutter fish, small squid, shrimp, prawns, which they hunt using echolocation. Finless Porpoises are known to produce a range of high-frequency clicks, which they use for navigation and prey detection in turbid waters.In India, this species is known to breed during early post-monsoon season. The clutch-size consists of a single offspring.  A calf rides on the back of its mother.",
    "The Finless Porpoise faces several significant threats in coastal regions. Habitat degradation due to coastal development, including port construction, industrial activities, and land reclamation, severely impacts their natural environment. Pollution, especially from chemical runoff and plastic waste, poses a direct threat to their health and food sources. Bycatch in fishing nets is a major concern, as these small cetaceans often become entangled and drown. Additionally, increasing boat traffic and noise pollution disrupt their natural behaviours, including communication and navigation.",
    "The Finless Porpoise is listed as \"Vulnerable (VU)\" by the International Union for Conservation of Nature (IUCN). As per Indian Wildlife (Protection) Amendment Act, 2022, this is a Schedule I mammal. In different parts of the world, conservation efforts are focused on habitat protection, reducing bycatch through the use of more selective fishing gear, and raising awareness about the species. In some countries, ex-situ conservation programs, including the establishment of semi-natural reserves, are being implemented to help protect and possibly rehabilitate declining populations.",
    "The Finless Porpoise, with its unique morphological and ecological characteristics, plays a vital role in the marine and freshwater ecosystems of Asia. Continued conservation efforts are essential to ensure the survival of this enigmatic and lesser-known cetacean species. The presence of Finless Porpoises in the Gulf of Kachchh is a sign of the ecological richness of this coastal region. These porpoises play an important role in maintaining the balance of marine ecosystems by controlling fish and invertebrate populations. ",
  ];

  final List<String> FINLESS_PORPOISE_guj = [
    "ફિનલેસ પોર્પોઇઝ (નિયોફોકેના ફોકેનોઇડ્સ) એ સૌથી નાની સિટેશિયન પ્રજાતિઓમાંની એક છે. તે ફોકોએનિડે પરિવારની છે. અન્ય પોર્પોઇઝથી વિપરીત, તે ડોર્સલ ફિનની ગેરહાજરી દ્વારા વર્ગીકૃત થયેલ છે, તેથી તેનું નામ છે. પરંતુ, તેને લિટલ તરીકે પણ ઓળખવામાં આવે છે. ભારતીય પોર્પોઇઝ શબ્દ \"પોર્પોઇઝ\" લેટિન શબ્દ \"પોર્કોપિસીસ\" પરથી ઉતરી આવ્યો છે, જેનો અર્થ \"ડુક્કર-માછલી\" તેમના ગોળાકાર શરીર અને સ્નોટને કારણે થાય છે. આ પ્રજાતિ એશિયાના દરિયાકાંઠાના પાણી, નદીમુખો અને નદી પ્રણાલીઓમાં જોવા મળે છે. ઈન્ડો-પેસિફિક પ્રદેશમાં, જેમાં ભારતીય ઉપખંડ, દક્ષિણપૂર્વ એશિયા અને પૂર્વ એશિયાના ભાગોનો સમાવેશ થાય છે.",
    "ફિનલેસ પોર્પોઇઝ એક વિશિષ્ટ, સુવ્યવસ્થિત શરીર ધરાવે છે જે પૂંછડી તરફ સરળતાથી ટેપ કરે છે. ડોર્સલ ફિનની ગેરહાજરી તેની સૌથી નોંધપાત્ર લાક્ષણિકતાઓમાંની એક છે, જે તેની પીઠની બાજુમાં એક સાંકડી પટ્ટી દ્વારા બદલવામાં આવે છે, જે કેટલીકવાર નાના ટ્યુબરકલ્સથી ઢંકાયેલી હોય છે. આ અનન્ય છે. એવું માનવામાં આવે છે કે અનુકૂલન એ પાણીની ખલેલ ઘટાડવામાં મદદ કરે છે અને પ્રાણીને શિકાર અને શિકારી બંને માટે ઓછું દેખાતું બનાવે છે આછો રાખોડી રંગનો, આછા વેન્ટ્રલ બાજુ સાથે, પ્રજાતિઓનું માથું ગોળાકાર હોય છે જેમાં કોઈ મુખ્ય ચાંચ હોતી નથી, અને બ્લોહોલ મધ્યરેખાની ડાબી બાજુએ સ્થિત હોય છે, જે તમામ પોર્પોઈઝ દ્વારા વહેંચાયેલ લાક્ષણિકતા હોય છે.",
    "ફિનલેસ પોર્પોઇઝ છીછરા દરિયાકાંઠાના પાણીમાં વસે છે, સામાન્ય રીતે 50 મીટરથી ઓછી ઊંડાઈને પસંદ કરે છે. તેઓ સામાન્ય રીતે નરમ રેતાળ અથવા કાદવવાળું તળિયાવાળા વિસ્તારોમાં જોવા મળે છે, જે માછલી, ક્રસ્ટેશિયન અને સેફાલોપોડ્સના તેમના આહારને ટેકો આપે છે. તેમની શ્રેણી પર્સિયન ગલ્ફથી વિસ્તરે છે, હિંદ મહાસાગરમાં, અને દક્ષિણપૂર્વ એશિયાના પાણીમાં, દક્ષિણ ચીન સમુદ્ર સહિત, ઉત્તર તરફ પીળા સમુદ્ર અને જાપાનના દરિયાકાંઠાના વિસ્તારો સુધી વિસ્તરે છે. તાજા પાણીના વાતાવરણમાં, ફિનલેસ પોર્પોઈઝ નદી પ્રણાલીઓમાં વસવાટ કરવા માટે જાણીતા છે જેમ કે યાંગ્ત્ઝે નદી ચીન, જ્યાં એક પેટાજાતિ, યાંગ્ત્ઝી ફિનલેસ પોર્પોઇઝ (Neophocaena asiaeorientalis asiaeorientalis), તે ગુજરાતની બહાર ભારતના પશ્ચિમ અને પૂર્વ કિનારે જોવા મળે છે અને દક્ષિણ કેનેરા ભારતમાં આ પ્રજાતિની વસ્તી ઓછી છે.",
    "ફિનલેસ પોર્પોઇઝ સામાન્ય રીતે શરમાળ અને પ્રપંચી હોય છે, જે તેમને જંગલીમાં અભ્યાસ કરવાનું મુશ્કેલ બનાવે છે. તેઓ એકાંત તરીકે ઓળખાય છે અથવા બે થી ચાર વ્યક્તિઓના નાના જૂથોમાં જોવા મળે છે. તેમના વધુ સામાજિક સંબંધીઓ, ડોલ્ફિનથી વિપરીત, ફિનલેસ પોર્પોઇઝ એક્રોબેટીક વર્તન દર્શાવતા નથી. અને ભાગ્યે જ પાણીની સપાટીનો ભંગ કરતા જોવા મળે છે. તેમના આહારમાં મુખ્યત્વે નાની માછલીઓ, કટર માછલી, નાની સ્ક્વિડ, ઝીંગા, ઝીંગાનો સમાવેશ થાય છે, જેનો તેઓ ઇકોલોકેશનનો ઉપયોગ કરીને શિકાર કરે છે, ફિનલેસ પોર્પોઇઝ ઉચ્ચ-આવર્તન ક્લિક્સ ઉત્પન્ન કરવા માટે જાણીતા છે, જેનો તેઓ ઉપયોગ કરે છે ગંદા પાણીમાં નેવિગેશન અને શિકારની શોધ માટે. ભારતમાં, આ પ્રજાતિ ચોમાસા પછીની ઋતુમાં પ્રજનન માટે જાણીતી છે.",
    "ફિનલેસ પોર્પોઇઝ દરિયાકાંઠાના પ્રદેશોમાં ઘણા નોંધપાત્ર જોખમોનો સામનો કરે છે. બંદર બાંધકામ, ઔદ્યોગિક પ્રવૃત્તિઓ અને જમીન પુનઃપ્રાપ્તિ સહિત દરિયાકાંઠાના વિકાસને કારણે રહેઠાણનું અધોગતિ, તેમના કુદરતી વાતાવરણને ગંભીર અસર કરે છે. પ્રદૂષણ, ખાસ કરીને રાસાયણિક પ્રવાહ અને પ્લાસ્ટિકના કચરાથી સીધો ખતરો છે. તેમના સ્વાસ્થ્ય અને ખાદ્ય સ્ત્રોતો માટે માછીમારીની જાળમાં બાયકેચ એ મુખ્ય ચિંતાનો વિષય છે, કારણ કે આ નાના સિટેશિયનો ઘણીવાર ફસાઈ જાય છે અને ડૂબી જાય છે, વધુમાં, વધતા જતા બોટ ટ્રાફિક અને ધ્વનિ પ્રદૂષણ તેમના કુદરતી વર્તનને વિક્ષેપિત કરે છે, જેમાં સંચાર અને નેવિગેશનનો સમાવેશ થાય છે.",
    "ફિનલેસ પોર્પોઇઝને ઇન્ટરનેશનલ યુનિયન ફોર કન્ઝર્વેશન ઓફ નેચર (IUCN) દ્વારા \"Vulnerable (VU)\" તરીકે સૂચિબદ્ધ કરવામાં આવ્યું છે. ભારતીય વન્યજીવ (પ્રોટેક્શન) એમેન્ડમેન્ટ એક્ટ, 2022 મુજબ, આ શેડ્યૂલ I સસ્તન પ્રાણી છે. વિવિધ ભાગોમાં વિશ્વમાં, સંરક્ષણ પ્રયાસો વસવાટના સંરક્ષણ પર કેન્દ્રિત છે, વધુ પસંદગીયુક્ત માછીમારી ગિયરના ઉપયોગ દ્વારા બાયકેચ ઘટાડવા અને કેટલાક દેશોમાં, અર્ધ-કુદરતી અનામતની સ્થાપના સહિત, પૂર્વ-સ્થિતિ સંરક્ષણ કાર્યક્રમો કરવામાં આવી રહ્યા છે. ઘટતી જતી વસ્તીના રક્ષણ અને સંભવતઃ પુનઃસ્થાપનમાં મદદ કરવા માટે અમલમાં મૂકવામાં આવ્યું છે.",
    "ફિનલેસ પોર્પોઇઝ, તેની અનન્ય મોર્ફોલોજિકલ અને ઇકોલોજીકલ લાક્ષણિકતાઓ સાથે, એશિયાના દરિયાઇ અને તાજા પાણીની ઇકોસિસ્ટમ્સમાં મહત્વપૂર્ણ ભૂમિકા ભજવે છે. આ ભેદી અને ઓછી જાણીતી સિટેશિયન પ્રજાતિના અસ્તિત્વને સુનિશ્ચિત કરવા માટે સતત સંરક્ષણ પ્રયાસો જરૂરી છે. ફિનલેસ પોર્પોઇઝની હાજરી. કચ્છના અખાતમાં આ દરિયાઇ વિસ્તારની પર્યાવરણીય સમૃદ્ધિની નિશાની છે.",
  ];

  final List<String> BLUE_WHALE = [
    "The Blue Whale is the largest animal ever known to have lived on Earth, dwarfing even the largest dinosaurs. These magnificent creatures can grow up to 30 meters in length and weigh as much as 200 tons—roughly the weight of 33 elephants! Despite their massive size, Blue Whales are gentle giants, gliding gracefully through the world’s oceans, feeding primarily on tiny shrimp-like animals called krill.",
    "Blue Whales are easily recognizable by their immense size and distinct blue-grey coloration. When observed closely, their skin appears mottled with lighter grey patches. The body is long and streamlined, perfectly adapted for life in the open ocean. Their heads are flat and U-shaped, and they have a prominent ridge running from the blowhole to the top of the upper lip.One of the most striking features of the Blue Whale is its enormous mouth, which can hold up to 90 metric tons of water and food. Inside the mouth, they have hundreds of baleen plates instead of teeth. These plates are made of keratin (the same material as human fingernails) and are used to filter krill from the water. Blue Whales have small dorsal fins located near the tail, and their flippers are long and thin. The tail flukes are broad and triangular, spanning up to 7.6 meters across.",
    "Blue Whales are found in oceans all over the world, migrating between high-latitude feeding grounds in the summer and low-latitude breeding grounds in the winter. They prefer deep, open waters, where they can feed on large swarms of krill.In India, Blue Whales have been recorded off the western and southern coasts, including the Arabian Sea and the Bay of Bengal. However, sightings are rare, and much about their presence in these waters remains a mystery.On the Gujarat coast, particularly in the Gulf of Kachchh and the Gulf of Cambay (Gulf of Khambhat), Blue Whale sightings are extremely rare. These areas are not typical habitats for Blue Whales due to the shallow waters and the lack of large krill swarms that are crucial for their survival. However, these coastal waters are important for understanding the range and behavior of this elusive species in Indian waters.",
    "Blue Whales have a diet that consists almost exclusively of krill, and they are capable of consuming up to 4 tons of krill per day during feeding season. They use a feeding technique called lunge feeding, where they accelerate towards a swarm of krill with their mouths wide open, taking in a massive amount of water and food. They then close their mouths and use their tongues to push the water out through the baleen plates, trapping the krill inside.Blue Whales are generally solitary creatures, although they may be seen in pairs or small groups, especially in feeding areas. They are also known for their long, low-frequency vocalizations, which can travel across entire ocean basins. These vocalizations are used for communication and possibly for navigation.Despite their enormous size, Blue Whales are capable of speeds up to 20 mph when threatened, though they usually cruise at a more leisurely pace of 5 mph.",
    "Blue Whales were heavily hunted during the 20th century, leading to a dramatic decline in their populations. Blue Whale is also under threat due to ship strikes, entanglement in fishing gear, and the impacts of climate change, which affect their food supply.",
    "International\nAlthough they are now protected under international law, with commercial whaling banned since 1966, their populations are still recovering slowly. Blue Whales are listed as \"Endangered\" (EN) on the IUCN Red List. Threats they face today include ship strikes, entanglement in fishing gear, and the impacts of climate change, which affect their food supply.\n India\n In Indian waters, Blue Whales are protected under the Wildlife Protection Act of 1972. As per Wildlife (Protection) Amendment Act, 2022, it is a Schedule-I species. However, threats such as ship strikes, noise pollution from increased maritime traffic, and changes in sea temperature and prey availability due to climate change pose significant challenges to their survival.\n Gujarat\nOn the Gujarat coast, Blue Whales are not common or frequent visitors. However, the waters of the Gulf of Kachchh and the Gulf of Cambay are important marine ecosystems that need to be protected to ensure the safety of any large cetaceans passing through. Conservation efforts in these areas are crucial to maintaining healthy marine environments, which in turn support a diverse range of marine life, including the occasional Blue Whale.",
    "The Blue Whale is a symbol of the ocean’s majesty and the incredible diversity of life it sustains. Though sightings along the Gujarat coast are rare, understanding and protecting the marine environment here is essential for the survival of all marine species, including these giants. By safeguarding our oceans, we ensure that the largest creature on Earth continues to have a place in the world, reminding us of the need to preserve our planet’s rich natural heritage for future generations."
  ];

  final List<String> BLUE_WHALE_GUJ = [
    "બ્લુ વ્હેલ એ અત્યાર સુધીનું સૌથી મોટું પ્રાણી છે જે પૃથ્વી પર રહેતું હોવાનું જાણીતું છે, જે સૌથી મોટા ડાયનાસોરને પણ વામણું બનાવે છે. આ ભવ્ય જીવો 30 મીટર લંબાઈ સુધી વધી શકે છે અને તેનું વજન 200 ટન જેટલું હોઈ શકે છે - આશરે 33 હાથીઓનું વજન! તેમ છતાં મોટા કદની, બ્લુ વ્હેલ સૌમ્ય જાયન્ટ્સ છે, વિશ્વના મહાસાગરોમાંથી સુંદર રીતે ગ્લાઈડિંગ કરે છે, મુખ્યત્વે ક્રિલ નામના નાના ઝીંગા જેવા પ્રાણીઓને ખવડાવે છે.",
    "બ્લુ વ્હેલ તેમના વિશાળ કદ અને અલગ વાદળી-ગ્રે રંગ દ્વારા સરળતાથી ઓળખી શકાય છે. જ્યારે નજીકથી અવલોકન કરવામાં આવે છે, ત્યારે તેમની ત્વચા હળવા રાખોડી રંગના ધબ્બા સાથે ચિત્તદાર દેખાય છે. શરીર લાંબુ અને સુવ્યવસ્થિત છે, ખુલ્લા સમુદ્રમાં જીવન માટે સંપૂર્ણ રીતે અનુકૂળ છે. તેમના માથા સપાટ છે. અને U-આકારની છે, અને તેમની પાસે બ્લોહોલથી ઉપરના હોઠની ટોચ સુધી એક આગવી પટ્ટી છે. બ્લુ વ્હેલની સૌથી આકર્ષક વિશેષતાઓમાંની એક તેનું પ્રચંડ મોં છે, જે 90 મેટ્રિક ટન પાણી અને ખોરાકને પકડી શકે છે. મોંની અંદર, તેમની પાસે દાંતની જગ્યાએ સેંકડો બેલેન પ્લેટ્સ હોય છે (માનવ આંગળીઓના નખ જેવી જ સામગ્રી) અને તેનો ઉપયોગ પૂંછડીની નજીક સ્થિત ક્રિલને ફિલ્ટર કરવા માટે થાય છે. અને તેમના ફ્લિપર્સ લાંબા અને પાતળા હોય છે, જે 7.6 મીટર સુધી ફેલાયેલા હોય છે.",
    "બ્લુ વ્હેલ સમગ્ર વિશ્વમાં મહાસાગરોમાં જોવા મળે છે, ઉનાળામાં ઉચ્ચ-અક્ષાંશ ખોરાકના મેદાનો અને શિયાળામાં ઓછા અક્ષાંશ સંવર્ધન મેદાનો વચ્ચે સ્થળાંતર કરે છે. તેઓ ઊંડા, ખુલ્લા પાણીને પસંદ કરે છે, જ્યાં તેઓ ક્રિલના મોટા જથ્થાઓને ખવડાવી શકે છે. ભારત, અરબી સમુદ્ર અને બંગાળની ખાડી સહિત પશ્ચિમ અને દક્ષિણ કિનારે બ્લુ વ્હેલ જોવા મળે છે, અને આ પાણીમાં તેમની હાજરી વિશે ઘણું બધું રહસ્ય રહે છે. ખાસ કરીને ગુજરાતના દરિયાકાંઠે. કચ્છનો અખાત અને ખંભાતનો અખાત, છીછરા પાણી અને તેમના અસ્તિત્વ માટે નિર્ણાયક એવા મોટા ક્રિલ સ્વોર્મ્સના અભાવને કારણે આ વિસ્તારો બ્લુ વ્હેલ માટેનું વિશિષ્ટ નિવાસસ્થાન નથી , આ દરિયાકાંઠાના પાણી ભારતીય પાણીમાં આ પ્રપંચી પ્રજાતિની શ્રેણી અને વર્તનને સમજવા માટે મહત્વપૂર્ણ છે.",
    "બ્લુ વ્હેલનો આહાર હોય છે જેમાં લગભગ ફક્ત ક્રિલનો સમાવેશ થાય છે, અને તેઓ ખોરાકની મોસમ દરમિયાન દરરોજ 4 ટન ક્રિલ ખાવા માટે સક્ષમ હોય છે. તેઓ લંગ ફીડિંગ નામની ફીડિંગ તકનીકનો ઉપયોગ કરે છે, જ્યાં તેઓ ક્રિલના ટોળા તરફ ગતિ કરે છે. મોં પહોળું કરે છે, પાણી અને ખોરાકનો વિશાળ જથ્થો લે છે અને પછી તેઓ તેમના મોં બંધ કરે છે અને તેમની જીભનો ઉપયોગ બેલેન પ્લેટ્સ દ્વારા પાણીને બહાર ધકેલવા માટે કરે છે, ક્રિલને અંદર ફસાવે છે. બ્લુ વ્હેલ સામાન્ય રીતે એકાંત જીવો છે, જો કે તેઓ દેખાઈ શકે છે. જોડીમાં અથવા નાના જૂથોમાં, ખાસ કરીને તેઓ તેમના લાંબા, ઓછા-આવર્તનવાળા અવાજો માટે પણ જાણીતા છે, જે સમગ્ર સમુદ્રના તટપ્રદેશમાં મુસાફરી કરી શકે છે. જ્યારે ધમકી આપવામાં આવે ત્યારે તેઓ 20 માઈલ પ્રતિ કલાકની ઝડપ માટે સક્ષમ હોય છે, જો કે તેઓ સામાન્ય રીતે 5 માઈલ પ્રતિ કલાકની વધુ આરામથી ગતિએ ફરે છે.",
    "20મી સદી દરમિયાન બ્લુ વ્હેલનો ભારે શિકાર કરવામાં આવ્યો હતો, જેના કારણે તેમની વસ્તીમાં નાટ્યાત્મક ઘટાડો થયો હતો. બ્લુ વ્હેલ પણ જહાજની હડતાલ, માછીમારીના ગિયરમાં ફસાઈ જવાથી અને આબોહવા પરિવર્તનની અસરોને કારણે જોખમમાં છે, જે તેમના ખોરાકના પુરવઠાને અસર કરે છે.",
    "આંતરરાષ્ટ્રીય\nજો કે તેઓ હવે આંતરરાષ્ટ્રીય કાયદા હેઠળ સુરક્ષિત છે, 1966 થી વ્યાપારી વ્હેલ પર પ્રતિબંધ મૂકવામાં આવ્યો છે, તેમની વસ્તી હજુ પણ ધીમે ધીમે પુનઃપ્રાપ્ત થઈ રહી છે. બ્લુ વ્હેલને IUCN રેડ લિસ્ટમાં \"એન્ડેન્જર્ડ\" (EN) તરીકે સૂચિબદ્ધ કરવામાં આવી છે. આજે તેઓ જે ધમકીઓનો સામનો કરે છે તેમાં સમાવેશ થાય છે જહાજની હડતાલ, માછીમારીના ગિયરમાં ગૂંચવણ અને આબોહવા પરિવર્તનની અસરો, જે તેમના ખાદ્ય પુરવઠાને અસર કરે છે.\nભારત\nભારતીય જળ ક્ષેત્રમાં, બ્લુ વ્હેલને 1972ના વન્યજીવન સંરક્ષણ અધિનિયમ હેઠળ સંરક્ષિત કરવામાં આવે છે. વન્યજીવન (સંરક્ષણ) સુધારા અધિનિયમ મુજબ , 2022, તે શેડ્યૂલ-1 પ્રજાતિ છે જો કે, દરિયાઈ ટ્રાફિકમાં વધારો થવાથી થતા ધ્વનિ પ્રદૂષણ અને આબોહવા પરિવર્તનને કારણે દરિયાઈ તાપમાનમાં ફેરફાર અને શિકારની ઉપલબ્ધતા જેવા જોખમો તેમના અસ્તિત્વ માટે મહત્વપૂર્ણ પડકારો છે.\nગુજરાત\nપર. ગુજરાતના દરિયાકાંઠે, બ્લુ વ્હેલ સામાન્ય અથવા વારંવાર મુલાકાતીઓ નથી, તેમ છતાં, કચ્છના અખાત અને ખંભાતના અખાતના પાણી એ મહત્વપૂર્ણ દરિયાઈ જીવસૃષ્ટિ છે જેમાંથી પસાર થતા કોઈપણ મોટા સિટેશિયનોની સલામતી સુનિશ્ચિત કરવાની જરૂર છે. આ વિસ્તારોમાં સંરક્ષણ પ્રયાસો તંદુરસ્ત દરિયાઈ વાતાવરણને જાળવવા માટે નિર્ણાયક છે, જે બદલામાં પ્રસંગોપાત બ્લુ વ્હેલ સહિત દરિયાઈ જીવનની વિવિધ શ્રેણીને સમર્થન આપે છે.",
    "બ્લુ વ્હેલ એ મહાસાગરની ભવ્યતા અને જીવનની અવિશ્વસનીય વિવિધતાનું પ્રતીક છે. ગુજરાતના દરિયાકાંઠે જોવાનું દુર્લભ હોવા છતાં, આ જાયન્ટ્સ સહિત તમામ દરિયાઈ પ્રજાતિઓના અસ્તિત્વ માટે અહીંના દરિયાઈ પર્યાવરણને સમજવું અને તેનું રક્ષણ કરવું જરૂરી છે. આપણા મહાસાગરોનું રક્ષણ કરીને, અમે સુનિશ્ચિત કરીએ છીએ કે પૃથ્વી પરના સૌથી મોટા પ્રાણીનું વિશ્વમાં સ્થાન જળવાઈ રહે, જે આપણને ભવિષ્યની પેઢીઓ માટે આપણા ગ્રહના સમૃદ્ધ કુદરતી વારસાને જાળવવાની જરૂરિયાતની યાદ અપાવે છે."
  ];

  final List<String> KILLER_WHALE = [
    "The Killer Whale, or Orca, is one of the ocean's most powerful predators, renowned for its striking black-and-white appearance and complex social structures. Despite their common name, Killer Whales are actually the largest members of the dolphin family, Delphinidae. They are apex predators, sitting at the top of the marine food chain, and are known for their intelligence, adaptability, and wide-ranging behaviors. Orcas are highly social, living in family groups called pods, and are found in all of the world’s oceans, from the polar regions to the tropics.",
    "Killer Whales are easily recognizable by their bold black-and-white coloration. They have a sleek, robust body with a black back, white chest, and sides, and a distinctive white patch above and behind the eye. Adult males are larger than females, reaching lengths of up to 9 meters and weighing as much as 5,400 kilograms. Females are slightly smaller, growing up to 7.7 meters and weighing around 3,800 kilograms.\nOne of the most prominent features of the Killer Whale is its dorsal fin. In males, this fin can be up to 1.8 meters tall and is triangular and erect, while in females and young males, it is shorter and more curved. Killer Whales also have large, rounded pectoral fins and a powerful tail fluke that propels them through the water with great speed and agility.",
    "Killer Whales are one of the most widespread marine mammals, found in oceans worldwide. They inhabit both coastal and open ocean environments, from the Arctic and Antarctic regions to temperate and tropical seas. Orcas are highly adaptable and can be found in a variety of marine habitats, including deep offshore waters, shallow coastal areas, and even large rivers.\nIn India, sightings of Killer Whales are rare, but they have been reported off the western and eastern coasts, including the Arabian Sea and the Bay of Bengal. These occurrences suggest that Killer Whales occasionally traverse Indian waters, although they are not resident species.\nOn the Gujarat coast, particularly in the Gulf of Kachchh and the Gulf of Cambay (Gulf of Khambhat), Killer Whale sightings are extremely uncommon. The shallow and enclosed nature of these gulfs is not typical of the open ocean habitats where Killer Whales are usually found. However, their presence in these waters, though rare, highlights the diverse marine life that can occasionally visit these regions.",
    "Killer Whales are apex predators with a varied diet that includes fish, squid, seals, and even large whales. Their hunting techniques are highly sophisticated and vary depending on the type of prey and the pod’s location. Some Killer Whales specialize in hunting marine mammals, while others focus on fish. They are known to work together in coordinated groups to hunt, demonstrating remarkable intelligence and cooperation.\nOrcas live in complex social structures called pods, which are matrilineal, meaning they are led by the oldest female. These pods can range from a few individuals to over 50 members and often consist of several generations of a family. The social bonds within a pod are strong and long-lasting, with members communicating through a variety of vocalizations, including clicks, whistles, and pulsed calls. Each pod has its own distinct dialect, which is unique to its group.\nKiller Whales are also known for their playfulness and curiosity. They can often be seen breaching, tail-slapping, and spy-hopping, behaviors that are thought to be forms of communication, play, or a way to survey their surroundings.",
    "Various threats to this species include pollution, overfishing (which depletes their food sources), entanglement in fishing gear, and noise pollution from ships and industrial activities, which can interfere with their communication and echolocation. Additionally, the loss of habitat, particularly in coastal areas, poses a significant threat to some populations.",
    "International\nIt is yet unknown whether or not Killer Whale is currently threatened globally, as its current IUCN Red List status is “Data Deficient” (DD). But certain populations are at risk.\nIndia\nIn Indian waters, Killer Whales are protected under the Wildlife Protection Act of 1972. As per Wildlife (Protection) Amendment Act, 2022, it is a Schedule-I species. However, the lack of regular sightings and data makes it difficult to assess the population status of Killer Whales in this region. The primary threats in Indian waters include accidental capture in fishing gear, depletion of prey species, and pollution from coastal development.\nGujarat\nOn the Gujarat coast, particularly in the Gulf of Kachchh and the Gulf of Cambay, Killer Whales are rare visitors. However, the conservation of marine habitats in these areas is crucial for the protection of all marine species, including the occasional Killer Whale. Efforts to protect the marine environment, such as reducing pollution and regulating coastal development, will benefit the broader marine ecosystem and the diverse species it supports.",
    "Killer Whales are a symbol of the ocean’s strength and complexity. Although sightings along the Gujarat coast are rare, the presence of these apex predators highlights the rich biodiversity of the region's marine ecosystems. Protecting the coastal and marine environments in Gujarat, including the Gulf of Kachchh and the Gulf of Cambay, is essential not only for the conservation of Killer Whales but also for the health of the entire marine ecosystem. By safeguarding these waters, we ensure that the extraordinary wildlife that occasionally visits these shores can continue to thrive."
  ];

  final List<String> KILLER_WHALE_GUJ = [
    "ધ કિલર વ્હેલ, અથવા ઓર્કા, સમુદ્રના સૌથી શક્તિશાળી શિકારી પ્રાણીઓમાંનું એક છે, જે તેના આકર્ષક કાળા-સફેદ દેખાવ અને જટિલ સામાજિક રચનાઓ માટે પ્રખ્યાત છે. તેમના સામાન્ય નામ હોવા છતાં, કિલર વ્હેલ ખરેખર ડોલ્ફિન પરિવારના સૌથી મોટા સભ્યો છે, ડેલ્ફિનીડે. તેઓ સર્વોચ્ચ શિકારી છે, જે દરિયાઈ ખાદ્ય શૃંખલામાં ટોચ પર છે અને તેમની બુદ્ધિમત્તા, અનુકૂલનક્ષમતા અને વ્યાપક વર્તણૂક માટે જાણીતા છે, તેઓ પોડ તરીકે ઓળખાતા કૌટુંબિક જૂથોમાં રહે છે વિશ્વના મહાસાગરો, ધ્રુવીય પ્રદેશોથી ઉષ્ણકટિબંધ સુધી.",
    "કિલર વ્હેલ તેમના ઘાટા કાળા અને સફેદ રંગ દ્વારા સરળતાથી ઓળખી શકાય છે. તેઓ કાળા પીઠ, સફેદ છાતી અને બાજુઓ સાથે આકર્ષક, મજબૂત શરીર ધરાવે છે, અને આંખની ઉપર અને પાછળ એક વિશિષ્ટ સફેદ પેચ ધરાવે છે. પુખ્ત નર તેના કરતા મોટા હોય છે. માદાઓ, 9 મીટર સુધીની લંબાઈ સુધી પહોંચે છે અને 5,400 કિલોગ્રામ જેટલું વજન ધરાવે છે નર, આ ફિન 1.8 મીટર સુધી ઉંચી હોય છે અને તે ત્રિકોણાકાર અને ટટ્ટાર હોય છે, જ્યારે માદાઓ અને યુવાન પુરુષોમાં, તે ટૂંકા અને વધુ વળાંકવાળા હોય છે, કિલર વ્હેલમાં પણ મોટી, ગોળાકાર પેક્ટોરલ ફિન્સ અને શક્તિશાળી પૂંછડી હોય છે જે તેમને આગળ ધપાવે છે. ખૂબ ઝડપ અને ચપળતા સાથે પાણી.",
    "કિલર વ્હેલ એ સૌથી વધુ વ્યાપક દરિયાઇ સસ્તન પ્રાણીઓમાંનું એક છે, જે વિશ્વભરના મહાસાગરોમાં જોવા મળે છે. તેઓ આર્કટિક અને એન્ટાર્કટિક પ્રદેશોથી લઈને સમશીતોષ્ણ અને ઉષ્ણકટિબંધીય સમુદ્રો સુધીના દરિયાકાંઠાના અને ખુલ્લા સમુદ્રના વાતાવરણમાં વસે છે. ઓર્કાસ અત્યંત અનુકૂલનક્ષમ છે અને વિવિધમાં મળી શકે છે. દરિયાઈ વસવાટો, જેમાં દરિયાના ઊંડા પાણી, છીછરા દરિયાકાંઠાના વિસ્તારો અને મોટી નદીઓનો પણ સમાવેશ થાય છે.\nભારતમાં કિલર વ્હેલના દર્શન દુર્લભ છે, પરંતુ તેઓ અરબી સમુદ્ર અને બંગાળની ખાડી સહિત પશ્ચિમ અને પૂર્વીય કિનારે નોંધાયા છે. આ ઘટનાઓ સૂચવે છે કે કિલર વ્હેલ ક્યારેક-ક્યારેક ભારતીય પાણીમાંથી પસાર થાય છે, જો કે તે નિવાસી પ્રજાતિ નથી.\nગુજરાતના દરિયાકાંઠે, ખાસ કરીને કચ્છના અખાત અને ખંભાતના અખાતમાં, કિલર વ્હેલ જોવાનું ખૂબ જ અસાધારણ છે અને આ ખાડીઓની બંધ પ્રકૃતિ ખુલ્લી સમુદ્રી વસવાટોની લાક્ષણિકતા નથી જ્યાં સામાન્ય રીતે કિલર વ્હેલ જોવા મળે છે, જો કે, આ પાણીમાં તેમની હાજરી, દુર્લભ હોવા છતાં, વિવિધ દરિયાઈ જીવનને પ્રકાશિત કરે છે જે ક્યારેક આ પ્રદેશોની મુલાકાત લઈ શકે છે.",
    "કિલર વ્હેલ એ વૈવિધ્યસભર આહાર સાથે ટોચના શિકારી છે જેમાં માછલી, સ્ક્વિડ, સીલ અને મોટી વ્હેલનો પણ સમાવેશ થાય છે. તેમની શિકારની તકનીકો અત્યંત અત્યાધુનિક છે અને શિકારના પ્રકાર અને પોડના સ્થાનના આધારે બદલાય છે. કેટલીક કિલર વ્હેલ દરિયાઈ સસ્તન પ્રાણીઓનો શિકાર કરવામાં નિષ્ણાત છે. , જ્યારે અન્ય માછલીઓ પર ધ્યાન કેન્દ્રિત કરે છે તેઓ શિકાર કરવા માટે સંકલિત જૂથોમાં સાથે મળીને કામ કરવા માટે જાણીતા છે, જે નોંધપાત્ર બુદ્ધિ અને સહકાર દર્શાવે છે અમુક વ્યક્તિઓથી માંડીને 50 થી વધુ સભ્યો સુધીની હોઈ શકે છે અને તેમાં ઘણી વખત એક પરિવારની ઘણી પેઢીઓનો સમાવેશ થાય છે, પોડની અંદરના સામાજિક બંધનો મજબૂત અને લાંબા સમય સુધી ચાલતા હોય છે, જેમાં સભ્યો ક્લિક્સ, વ્હિસલ અને સ્પંદનીય કોલ્સ સહિત વિવિધ પ્રકારના અવાજો દ્વારા વાતચીત કરે છે. . દરેક પોડની પોતાની અલગ બોલી છે, જે તેના જૂથ માટે અનન્ય છે.\nકિલર વ્હેલ તેમની રમતિયાળતા અને જિજ્ઞાસા માટે પણ જાણીતી છે, તેઓ વારંવાર ભંગ કરતા, પૂંછડી મારતા અને જાસૂસી કરતા જોવા મળે છે, જે માનવામાં આવે છે. સંદેશાવ્યવહારના સ્વરૂપો, રમત અથવા તેમની આસપાસના સર્વેક્ષણની રીત.",
    "આ પ્રજાતિઓ માટેના વિવિધ જોખમોમાં પ્રદૂષણ, અતિશય માછીમારી (જે તેમના ખાદ્ય સ્ત્રોતોને ક્ષીણ કરે છે), માછીમારીના ગિયરમાં ફસાવવું, અને જહાજો અને ઔદ્યોગિક પ્રવૃત્તિઓમાંથી અવાજનું પ્રદૂષણ, જે તેમના સંદેશાવ્યવહાર અને ઇકોલોકેશનમાં દખલ કરી શકે છે. વધુમાં, ખાસ કરીને વસવાટનું નુકસાન. દરિયાકાંઠાના વિસ્તારો, કેટલીક વસ્તી માટે નોંધપાત્ર ખતરો છે.",
    "આંતરરાષ્ટ્રીય\nતે હજુ સુધી અજ્ઞાત છે કે કિલર વ્હેલ હાલમાં વૈશ્વિક સ્તરે જોખમમાં છે કે નહીં, કારણ કે તેની વર્તમાન IUCN રેડ લિસ્ટ સ્થિતિ \"ડેટા ડેફિસિયન્ટ\" (DD) છે. પરંતુ અમુક વસ્તી જોખમમાં છે.\nભારત\nભારતીય જળસીમામાં, કિલર વ્હેલ છે. 1972ના વાઇલ્ડલાઇફ પ્રોટેક્શન એક્ટ હેઠળ સંરક્ષિત. વાઇલ્ડલાઇફ (પ્રોટેક્શન) એમેન્ડમેન્ટ એક્ટ, 2022 મુજબ, તે શેડ્યૂલ-1 પ્રજાતિ છે જો કે, નિયમિત જોવા અને ડેટાનો અભાવ આમાં કિલર વ્હેલની વસ્તીની સ્થિતિનું મૂલ્યાંકન કરવું મુશ્કેલ બનાવે છે. ભારતીય જળ ક્ષેત્રમાં પ્રાથમિક જોખમોમાં માછીમારીના સાધનોમાં આકસ્મિક પકડ, શિકારની પ્રજાતિઓનું અવક્ષય અને દરિયાકાંઠાના વિકાસથી પ્રદૂષણનો સમાવેશ થાય છે. જો કે, આ વિસ્તારોમાં દરિયાઈ વસવાટોનું સંરક્ષણ, દરિયાઈ પર્યાવરણને બચાવવા માટેના પ્રસંગોપાત કિલર વ્હેલ સહિત, વ્યાપક દરિયાઈ ઇકોસિસ્ટમને ફાયદો થશે. અને તે વિવિધ પ્રજાતિઓને સમર્થન આપે છે.",
    "કિલર વ્હેલ એ સમુદ્રની શક્તિ અને જટિલતાનું પ્રતીક છે. ગુજરાતના દરિયાકાંઠે જોવાનું દુર્લભ હોવા છતાં, આ સર્વોચ્ચ શિકારીઓની હાજરી એ પ્રદેશની દરિયાઇ જીવસૃષ્ટિની સમૃદ્ધ જૈવવિવિધતાને પ્રકાશિત કરે છે. અખાત સહિત ગુજરાતમાં દરિયાકાંઠા અને દરિયાઇ પર્યાવરણનું રક્ષણ કરે છે. કચ્છ અને ખંભાતનો અખાત, માત્ર કિલર વ્હેલના સંરક્ષણ માટે જ નહીં પરંતુ સમગ્ર દરિયાઈ જીવસૃષ્ટિના સ્વાસ્થ્ય માટે પણ જરૂરી છે, આ પાણીને સુરક્ષિત કરીને, અમે સુનિશ્ચિત કરીએ છીએ કે અસાધારણ વન્યજીવો કે જેઓ આ કિનારાની મુલાકાત લે છે તે સતત વિકાસ પામી શકે છે. "
  ];

  final List<String> GREEN_TURTLE = [
    "The Green Sea Turtle (Chelonia mydas) is one of the largest and most widespread sea turtles, known for its distinct greenish-colored fat, which gives the species its name. These turtles play a crucial role in marine ecosystems, particularly in maintaining the health of seagrass beds. However, despite their importance, Green Sea Turtles face numerous threats, making their conservation a global priority.",
    "Green Sea Turtles are large, with a carapace length ranging from 80 to 120 cm and weighing between 100 and 200 kg. They have a smooth, teardrop-shaped shell, which is olive to brown in color, often with a radiating pattern of darker streaks. The plastron (underside) is typically yellowish-white. Their heads are relatively small compared to other sea turtles, with a rounded profile and a serrated beak, adapted for their primarily herbivorous diet. Unlike other sea turtles, Green Sea Turtles have a single pair of prefrontal scales (scales in front of the eyes), which helps in distinguishing them from similar species.",
    "World: Green Sea Turtles are found in tropical and subtropical oceans worldwide. They inhabit coastal areas, especially where seagrass beds and coral reefs are present, as these environments provide abundant food and safe nesting sites.\nIndia: In India, Green Sea Turtles are found along both the east and west coasts, with significant populations in the Andaman and Nicobar Islands, Lakshadweep, and parts of the mainland, including Odisha and Gujarat. The waters around these regions offer vital feeding and nesting habitats.\nGujarat Coast: Along the Gujarat coast, particularly in the Gulf of Kachchh, Green Sea Turtles are frequently observed. Past studies have shown that this species occurs mainly in the coastal waters of Kachchh, Jamnagar and Junagadh/Porbandar districts and to a small extent in Amreli and Bhavnagar districts. The coral reefs and seagrass beds in the region serve as important foraging grounds, while sandy beaches provide nesting sites, although on a smaller scale compared to other regions like Odisha.",
    "Green Sea Turtles are predominantly herbivorous, feeding mainly on seagrasses and algae, which helps maintain the health of seagrass beds. However, juveniles are more omnivorous, feeding on invertebrates like jellyfish and sponges. These turtles are known for their long migrations between feeding grounds and nesting sites, sometimes traveling thousands of kilometers.\nEgg-laying Behaviour: Females return to the beaches where they were born to lay eggs, often traveling vast distances to reach these nesting sites. They come ashore at night, digging a deep pit with their flippers where they lay about 100-200 eggs. The eggs incubate for around two months before hatching. On the Gujarat coast, nesting is less common, but the turtles that do come ashore face challenges from habitat disturbance and predation. Nesting recorded mainly on sea coast falling in Kachchh, Jamnagar and Junagadh/Porbandar districts. It is observed that of the two nesting sea turtle species (Green and Olive Ridley) coming on the coast of Gujarat state for nesting, 95% are Green Sea Turtles. Mass nesting events are less common here compared to the eastern coast.\n",
    "They face numerous threats, including habitat loss, poaching for their eggs and meat, bycatch in fisheries, striking with ships/boats, plastic and other types of pollution of sea-water and climate change. Climate change affects both their nesting sites and the sex ratio of hatchlings due to temperature-dependent sex determination.",
    "World: The Green Sea Turtle is classified as Endangered (EN) on the IUCN Red List.\nIndia: In India, the Green Sea Turtle is protected under Schedule I of the Wildlife Protection Act, 1972, including the Wildlife Protection Amendment 2022. This status provides them with the highest level of legal protection, aiming to curb poaching and habitat destruction.\nGujarat: In Gujarat, conservation efforts are in place to monitor and protect Green Sea Turtles, especially in the Gulf of Kachchh region. However, more focused initiatives are needed to address the challenges posed by coastal development, pollution, and accidental capture in fishing gear.",
    "The Green Sea Turtle is a key species in marine ecosystems, with a life cycle that spans vast oceanic distances and requires both terrestrial and marine habitats for its survival. On the Gujarat coast, these turtles highlight the region's rich marine biodiversity. Protecting their habitats and mitigating threats are essential steps in ensuring their continued presence and the health of our coastal ecosystems. By supporting conservation efforts, we contribute to preserving not only the Green Sea Turtle but also the balance of marine life along the Gujarat coast.",
  ];
  final List<String> GREEN_TURTLE_GUJ = [
    "ગ્રીન સી ટર્ટલ (ચેલોનિયા માયડાસ) એ સૌથી મોટા અને સૌથી વધુ વ્યાપક દરિયાઈ કાચબાઓમાંનું એક છે, જે તેની વિશિષ્ટ લીલા રંગની ચરબી માટે જાણીતું છે, જે જાતિને તેનું નામ આપે છે. આ કાચબાઓ દરિયાઈ જીવસૃષ્ટિમાં નિર્ણાયક ભૂમિકા ભજવે છે, ખાસ કરીને તેની જાળવણીમાં જો કે, તેમના મહત્વ હોવા છતાં, ગ્રીન સી ટર્ટલને અસંખ્ય જોખમોનો સામનો કરવો પડે છે, જે તેમના સંરક્ષણને વૈશ્વિક પ્રાથમિકતા બનાવે છે.",
    "ગ્રીન સી ટર્ટલ મોટા હોય છે, તેની કેરેપેસ લંબાઈ 80 થી 120 સે.મી. સુધીની હોય છે અને તેનું વજન 100 થી 200 કિગ્રાની વચ્ચે હોય છે. તેમની પાસે એક સરળ, ટિયરડ્રોપ-આકારના શેલ હોય છે, જે ઓલિવથી બ્રાઉન રંગના હોય છે, ઘણીવાર ઘાટા રંગની રેડિએટિંગ પેટર્ન સાથે. પ્લાસ્ટ્રોન (અંડરસાઇડ) સામાન્ય રીતે અન્ય દરિયાઈ કાચબાની તુલનામાં નાના હોય છે, જેમાં ગોળાકાર રૂપરેખા અને દાણાદાર ચાંચ હોય છે, જે અન્ય દરિયાઈ કાચબાઓથી વિપરીત હોય છે પ્રીફ્રન્ટલ ભીંગડાની એક જોડી (આંખોની સામે ભીંગડા), જે તેમને સમાન જાતિઓથી અલગ પાડવામાં મદદ કરે છે.",
    "વર્લ્ડ: ગ્રીન સી ટર્ટલ વિશ્વભરમાં ઉષ્ણકટિબંધીય અને ઉષ્ણકટિબંધીય મહાસાગરોમાં જોવા મળે છે. તેઓ દરિયાકાંઠાના વિસ્તારોમાં વસે છે, ખાસ કરીને જ્યાં સીગ્રાસ બેડ અને કોરલ રીફ હાજર છે, કારણ કે આ વાતાવરણ વિપુલ પ્રમાણમાં ખોરાક અને સુરક્ષિત માળો પૂરા પાડે છે.\nભારત: ભારતમાં, લીલા સમુદ્ર કાચબાઓ આંદામાન અને નિકોબાર ટાપુઓ, લક્ષદ્વીપ અને ઓડિશા અને ગુજરાત સહિત મુખ્ય ભૂમિના ભાગોમાં નોંધપાત્ર વસ્તી સાથે પૂર્વ અને પશ્ચિમ બંને કિનારે જોવા મળે છે. ગુજરાતના દરિયાકાંઠે, ખાસ કરીને કચ્છના અખાતમાં, લીલા સમુદ્રી કાચબાઓ વારંવાર જોવા મળે છે, ભૂતકાળના અભ્યાસો દર્શાવે છે કે આ પ્રજાતિ મુખ્યત્વે કચ્છ, જામનગર અને જૂનાગઢ/પોરબંદર જિલ્લાના દરિયાકાંઠાના પાણીમાં અને અમરેલી અને ભાવનગર જિલ્લામાં થોડી માત્રામાં જોવા મળે છે. આ પ્રદેશમાં પરવાળાના ખડકો અને દરિયાઈ ઘાસની પથારીઓ ઘાસચારાના મેદાન તરીકે સેવા આપે છે, જ્યારે રેતાળ દરિયાકિનારાઓ માળો બાંધવાની જગ્યાઓ પૂરી પાડે છે, જોકે ઓડિશા જેવા અન્ય પ્રદેશોની સરખામણીમાં નાના પાયે.",
    "ગ્રીન સી કાચબા મુખ્યત્વે શાકાહારી છે, જે મુખ્યત્વે દરિયાઈ ઘાસ અને શેવાળને ખવડાવે છે, જે દરિયાઈ ઘાસના પથારીના સ્વાસ્થ્યને જાળવવામાં મદદ કરે છે. જો કે, કિશોરો વધુ સર્વભક્ષી હોય છે, જેલીફિશ અને જળચરો જેવા અપૃષ્ઠવંશી પ્રાણીઓને ખવડાવે છે. આ કાચબાઓ તેમના ખોરાકની જમીન વચ્ચે લાંબા સ્થળાંતર માટે જાણીતા છે. અને માળો બનાવવાની જગ્યાઓ, કેટલીકવાર હજારો કિલોમીટરની મુસાફરી કરે છે.\nઇંડા મૂકવાની વર્તણૂક: માદાઓ દરિયાકિનારા પર પાછા ફરે છે જ્યાં તેઓ ઇંડા મૂકવા માટે જન્મ્યા હતા, ઘણી વાર આ માળો બનાવવા માટે વિશાળ અંતરની મુસાફરી કરીને તેઓ રાત્રે ઊંડો ખાડો ખોદીને કિનારે આવે છે તેમના ફ્લિપર્સ જ્યાં તેઓ લગભગ 100-200 ઇંડા મૂકે છે, ગુજરાતના દરિયાકાંઠે, માળો બાંધવાનું ઓછું સામાન્ય છે, પરંતુ તેઓ મુખ્યત્વે રહેઠાણની વિક્ષેપ અને શિકારના કારણે પડકારોનો સામનો કરે છે કચ્છ, જામનગર અને જૂનાગઢ/પોરબંદર જિલ્લામાં આવતા દરિયા કિનારે ગુજરાત રાજ્યના દરિયાકાંઠે માળો બાંધવા માટે આવતી બે દરિયાઈ કાચબાની પ્રજાતિઓ (ગ્રીન અને ઓલિવ રીડલી) પૈકી 95% લીલા સમુદ્રી કાચબા છે. પૂર્વીય દરિયાકાંઠાની સરખામણીમાં અહીં સામૂહિક માળાઓ બનાવવાની ઘટનાઓ ઓછી સામાન્ય છે.\n",
    "તેઓ અસંખ્ય જોખમોનો સામનો કરે છે, જેમાં રહેઠાણની ખોટ, તેમના ઇંડા અને માંસનો શિકાર, માછીમારીમાં બાયકેચ, જહાજો/નૌકાઓ સાથે પ્રહાર, પ્લાસ્ટિક અને દરિયાઈ પાણીના અન્ય પ્રકારનું પ્રદૂષણ અને આબોહવા પરિવર્તન. આબોહવા પરિવર્તન તેમના માળખાના સ્થળો અને વાતાવરણ બંનેને અસર કરે છે. તાપમાન-આધારિત લિંગ નિર્ધારણને કારણે બચ્ચાંનો જાતિ ગુણોત્તર.",
    "વર્લ્ડ: ધ ગ્રીન સી ટર્ટલને IUCN રેડ લિસ્ટમાં લુપ્તપ્રાય (EN) તરીકે વર્ગીકૃત કરવામાં આવ્યું છે.\nભારત: ભારતમાં, ગ્રીન સી ટર્ટલને વન્યજીવ સંરક્ષણ અધિનિયમ, 1972ના શેડ્યૂલ I હેઠળ સંરક્ષિત છે, જેમાં વન્યપ્રાણી સંરક્ષણ સુધારા 2022નો સમાવેશ થાય છે. આ દરજ્જો તેમને ઉચ્ચતમ સ્તરનું કાનૂની રક્ષણ પૂરું પાડે છે, જેનો હેતુ શિકાર અને વસવાટના વિનાશને રોકવાનો છે.\nગુજરાત: ગુજરાતમાં, ખાસ કરીને કચ્છના અખાતમાં, ગ્રીન સી કાચબાઓ પર દેખરેખ રાખવા અને તેનું રક્ષણ કરવા માટે સંરક્ષણ પ્રયાસો ચાલુ છે દરિયાકાંઠાના વિકાસ, પ્રદૂષણ અને માછીમારીના ગિયરમાં આકસ્મિક કેપ્ચર દ્વારા ઊભા થયેલા પડકારોને પહોંચી વળવા કેન્દ્રિત પહેલની જરૂર છે.",
    "ગ્રીન સી ટર્ટલ એ દરિયાઈ જીવસૃષ્ટિમાં એક મુખ્ય પ્રજાતિ છે, જેનું જીવન ચક્ર વિશાળ સમુદ્રી અંતર સુધી ફેલાયેલું છે અને તેના અસ્તિત્વ માટે પાર્થિવ અને દરિયાઈ બંને પ્રકારના વસવાટની જરૂર છે. ગુજરાતના દરિયાકાંઠે, આ કાચબાઓ પ્રદેશની સમૃદ્ધ દરિયાઈ જૈવવિવિધતાને પ્રકાશિત કરે છે. તેમના નિવાસસ્થાનોનું રક્ષણ કરે છે. અને જોખમો ઘટાડવા એ તેમની સતત હાજરી અને અમારા દરિયાકાંઠાના ઇકોસિસ્ટમના સ્વાસ્થ્યને સુનિશ્ચિત કરવા માટે જરૂરી પગલાં છે, સંરક્ષણના પ્રયાસોને સમર્થન આપીને, અમે માત્ર ગ્રીન સી ટર્ટલને જ નહીં પરંતુ ગુજરાતના દરિયાકાંઠે દરિયાઇ જીવનના સંતુલનને પણ સાચવવામાં યોગદાન આપીએ છીએ.",
  ];

  final List<String> RIDLEY_TURTLE = [
    "The Olive Oliver Ridlley Turtle (Lepidochelys olivacea) is one of the most well-known marine turtles, recognized for its mass nesting behavior called arribada, where thousands of females come ashore simultaneously to lay eggs. This species is named for its olive-colored carapace and is the smallest and most abundant of all sea turtles. Despite their numbers, they face significant threats that have led to their conservation status being a global concern.",
    "Olive Oliver Ridlley Turtles have a heart-shaped carapace that is smooth and relatively flat, with an average length of 60 to 70 cm and a weight of around 35 to 50 kg. Their carapace varies from olive to gray-green, while the plastron (underside) is lighter in color, often yellowish. They have a unique arrangement of scutes (bony external plates) with typically five to nine pairs of costal scutes. These turtles possess a triangular head with a slightly hooked beak, adapted for their omnivorous diet.",
    "World: Olive Oliver Ridlley Turtles inhabit warm and tropical waters of the Pacific, Atlantic, and Indian Oceans. They are found in coastal areas and open seas but are most famous for nesting on sandy beaches.\nIndia: In India, the eastern coast, particularly Odisha, is renowned for mass nesting sites like Gahirmatha Beach, Rushikulya, and Devi River mouth. These beaches host one of the largest arribadas in the world.\nGujarat Coast: Along the Gujarat coast, Olive Oliver Ridlley Turtles are seen, with reports of nesting on isolated beaches falling in Kachchh, Jamnagar and Junagadh/Porbandar districts and to small extent, in Amreli and Bhavnagar districts. Mass nesting events are less common here compared to the eastern coast. ",
    "Olive Oliver Ridlley Turtles are omnivorous, feeding on a wide range of prey including jellyfish, algae, crabs, and shrimp. They are known for their solitary oceanic lifestyle but exhibit strong natal homing behaviour, returning to the beaches where they were born to lay eggs.\nEgg-laying Behaviour: Females come ashore during the night to lay eggs, digging a pit with their hind flippers. They lay about 100-150 eggs per clutch, covering them with sand before returning to the sea. On the Gujarat coast, nesting is sporadic, and the turtles may face challenges due to beach erosion, human disturbance, and predation by animals like dogs and birds. Nesting recorded mainly on sea coast falling in Kachchh, Jamnagar and Junagadh/Porbandar districts. It is observed that of the two nesting sea turtle species (Green and Olive Ridley) coming on the coast of Gujarat state for nesting, 5% are Olive Oliver Ridlley Turtles.",
    "They face numerous threats, including habitat loss, poaching for their eggs and meat, accidental capture in fishing gear (bycatch), striking with ships/boats, plastic and other types of pollution of sea-water and climate change. Climate change affects both their nesting sites and the sex ratio of hatchlings due to temperature-dependent sex determination.",
    "World: The Olive Oliver Ridlley Turtle is classified as Vulnerable(VU) on the IUCN Red List.\nIndia: In India, the Olive Ridley is protected under Schedule I of the Wildlife Protection Act, 1972, including the Wildlife Protection Amendment 2022, which offers them the highest level of protection. Major conservation efforts, particularly on the Odisha coast, have been successful in safeguarding their nesting grounds.\nGujarat: In Gujarat, while there is growing awareness, conservation efforts need strengthening, especially in monitoring and protecting sporadic nesting sites. The relatively low nesting numbers on the Gujarat coast call for targeted local conservation strategies to ensure their protection.",
    "The Olive Oliver Ridlley Turtle, though the most abundant sea turtle species, faces significant conservation challenges worldwide. On the Gujarat coast, these turtles are a symbol of marine biodiversity and require concerted efforts for their protection. By safeguarding their nesting and foraging habitats, we contribute not only to the survival of this remarkable species but also to the health of our marine ecosystems."
  ];

  final List<String> RIDLEY_TURTLE_GUJ = [
    "ઓલિવ રિડલી ટર્ટલ (લેપિડોચેલિસ ઓલિવેસીઆ) એ સૌથી જાણીતા દરિયાઈ કાચબાઓમાંનું એક છે, જે તેના અરિબાડા નામના સામૂહિક માળખાના વર્તન માટે ઓળખાય છે, જ્યાં હજારો માદાઓ એક સાથે ઈંડા મૂકવા માટે કિનારે આવે છે. આ પ્રજાતિનું નામ તેના ઓલિવ-રંગીન કારાપેસ માટે રાખવામાં આવ્યું છે. અને તમામ દરિયાઈ કાચબાઓમાં સૌથી નાના અને વિપુલ પ્રમાણમાં છે, તેમની સંખ્યા હોવા છતાં, તેઓ નોંધપાત્ર જોખમોનો સામનો કરે છે જેના કારણે તેમના સંરક્ષણની સ્થિતિ વૈશ્વિક ચિંતા બની ગઈ છે.",
    "ઓલિવ રીડલી કાચબામાં હૃદયના આકારના કારાપેસ હોય છે જે સરળ અને પ્રમાણમાં સપાટ હોય છે, જેની સરેરાશ લંબાઈ 60 થી 70 સે.મી. અને વજન લગભગ 35 થી 50 કિગ્રા હોય છે. તેમની કારાપેસ ઓલિવથી ગ્રે-લીલા સુધી બદલાય છે, જ્યારે પ્લાસ્ટ્રોન ( અંડરસાઇડ) રંગમાં હળવા હોય છે, મોટેભાગે પીળા રંગના હોય છે, જેમાં સામાન્ય રીતે પાંચથી નવ જોડી કોસ્ટલ સ્ક્યુટ્સ હોય છે, જે તેમના સર્વભક્ષી આહાર માટે અનુકૂળ હોય છે. ",
    "વિશ્વ: ઓલિવ રીડલી કાચબાઓ પેસિફિક, એટલાન્ટિક અને હિંદ મહાસાગરોના ગરમ અને ઉષ્ણકટિબંધીય પાણીમાં રહે છે. તેઓ દરિયાકાંઠાના વિસ્તારોમાં અને ખુલ્લા સમુદ્રમાં જોવા મળે છે પરંતુ રેતાળ દરિયાકિનારા પર માળો બાંધવા માટે સૌથી વધુ પ્રખ્યાત છે.\nભારત: ભારતમાં, પૂર્વીય કિનારે, ખાસ કરીને ઓડિશા, ગહિરમાથા બીચ, રૂષિકુલ્યા અને દેવી નદીના મુખ જેવા સામૂહિક માળાઓ માટે પ્રખ્યાત છે. કચ્છ, જામનગર અને જૂનાગઢ/પોરબંદર જીલ્લામાં આવતા અલગ-અલગ દરિયાકિનારા પર માળો બાંધવાની ઘટનાઓ અમરેલી અને ભાવનગર જીલ્લામાં પૂર્વીય દરિયાકાંઠાની સરખામણીમાં ઓછી જોવા મળે છે.",
    "ઓલિવ રિડલી કાચબા સર્વભક્ષી છે, જેલીફિશ, શેવાળ, કરચલાં અને ઝીંગા સહિત શિકારની વિશાળ શ્રેણીને ખવડાવે છે. તેઓ તેમની એકાંત દરિયાઈ જીવનશૈલી માટે જાણીતા છે પરંતુ મજબૂત નેટલ હોમિંગ વર્તન દર્શાવે છે, દરિયાકિનારા પર પાછા ફરે છે જ્યાં તેઓ ઇંડા મૂકવા માટે જન્મ્યા હતા. .\nઇંડા મૂકવાની વર્તણૂક: માદાઓ તેમના હિન્દ ફ્લિપર્સ સાથે ખાડો ખોદવા માટે રાત્રે દરિયા કિનારે આવે છે, તેઓ દરિયામાં પાછા ફરતા પહેલા તેમને રેતીથી ઢાંકીને મૂકે છે. માળો છૂટાછવાયા હોય છે, અને કચ્છ, જામનગર અને જૂનાગઢ/પોરબંદર જિલ્લાઓમાં દરિયા કિનારે નોંધાયેલા માળાઓ જેવા કે દરિયાકિનારાના ધોવાણ, માનવીય ખલેલ અને પ્રાણીઓના શિકારને કારણે કાચબાને પડકારોનો સામનો કરવો પડી શકે છે ગુજરાત રાજ્યના દરિયાકાંઠે માળો બાંધવા માટે આવતા દરિયાઈ કાચબાની બે પ્રજાતિઓ (ગ્રીન અને ઓલિવ રિડલી) 5% ઓલિવ રિડલી કાચબા છે.",
    "તેઓ અસંખ્ય જોખમોનો સામનો કરે છે, જેમાં રહેઠાણની ખોટ, તેમના ઇંડા અને માંસનો શિકાર, માછીમારીના ગિયરમાં આકસ્મિક રીતે પકડવું (બાયકેચ), જહાજો/બોટ સાથે પ્રહાર, પ્લાસ્ટિક અને દરિયાઈ પાણીના અન્ય પ્રકારના પ્રદૂષણ અને આબોહવા પરિવર્તનનો સમાવેશ થાય છે. આબોહવા પરિવર્તન બંનેને અસર કરે છે. તાપમાન-આધારિત લિંગ નિર્ધારણને કારણે તેમના માળાઓની જગ્યાઓ અને બચ્ચાઓનું જાતિ ગુણોત્તર.",
    "વર્લ્ડ: ધ ઓલિવ રિડલી ટર્ટલને IUCN રેડ લિસ્ટમાં નબળા (VU) તરીકે વર્ગીકૃત કરવામાં આવ્યું છે.\nભારત: ભારતમાં, ઓલિવ રિડલીને વન્યપ્રાણી સંરક્ષણ અધિનિયમ, 1972 ના અનુસૂચિ I હેઠળ સંરક્ષિત છે, જેમાં વન્યજીવ સંરક્ષણ સુધારો 2022નો સમાવેશ થાય છે. તેમને સર્વોચ્ચ સ્તરનું સંરક્ષણ પ્રદાન કરે છે, ખાસ કરીને ઓડિશાના દરિયાકાંઠે, તેમના માળખાને સુરક્ષિત કરવામાં સફળ રહ્યા છે. નેસ્ટિંગ સાઇટ્સ ગુજરાતના દરિયાકાંઠે પ્રમાણમાં ઓછી સંખ્યાઓ તેમની સુરક્ષાને સુનિશ્ચિત કરવા માટે લક્ષિત સ્થાનિક સંરક્ષણ વ્યૂહરચનાઓ માટે કહે છે.",
    "ઓલિવ રીડલી ટર્ટલ, દરિયાઈ કાચબાની સૌથી વધુ વિપુલ પ્રજાતિ હોવા છતાં, વિશ્વભરમાં નોંધપાત્ર સંરક્ષણ પડકારોનો સામનો કરે છે. ગુજરાતના દરિયાકાંઠે, આ કાચબાઓ દરિયાઈ જૈવવિવિધતાનું પ્રતીક છે અને તેમના રક્ષણ માટે સંયુક્ત પ્રયાસોની જરૂર છે. તેમના માળાઓ અને ઘાસચારાના રહેઠાણોને સુરક્ષિત કરીને, અમે આ અદ્ભુત પ્રજાતિના અસ્તિત્વમાં જ નહીં પણ આપણી દરિયાઈ જીવસૃષ્ટિના સ્વાસ્થ્યમાં પણ ફાળો આપે છે.",
  ];

  final List<String> MALABAR_SNAKE = [
    "The Malabar Sea Snake (Hydrophis malabaricus) is a highly venomous marine snake that inhabits the coastal and offshore waters of the Indian Ocean. Named after the Malabar coast of India, where it was first described, this species is known for its distinct adaptations to marine life, making it an important part of the coastal marine ecosystem. Despite its ecological significance, the Malabar Sea Snake remains relatively lesser-known compared to other sea snakes, with its distribution and population trends needing further study.",
    "The Malabar Sea Snake has a cylindrical body, typical of sea snakes, and can grow to a length of 1.2 to 1.5 meters. Its body is compressed laterally, aiding in swimming, and it has a distinct paddle-shaped tail for propulsion in water. The coloration of the Malabar Sea Snake varies but generally includes a pattern of dark bands or rings over a lighter background, ranging from pale yellowish to greenish-grey. The head is relatively small and slightly flattened, with large, nostrils located high on the snout to facilitate breathing at the water's surface. Its scales are smooth and hexagonal, giving the snake a sleek, streamlined appearance.",
    "World: The Malabar Sea Snake is distributed across the coastal waters of the Indian Ocean, from the Arabian Sea to the Bay of Bengal, extending into Southeast Asia. It is typically found in shallow coastal waters, estuaries, and coral reefs, where it can hunt for prey.\nIndia: In India, the Malabar Sea Snake is found along the western and eastern coasts, including the Andaman and Nicobar Islands. It is particularly associated with the Malabar coast in Kerala, where it is relatively more common. The species is also present in other coastal regions but is less frequently encountered.\nGujarat Coast: On the Gujarat coast, the Malabar Sea Snake is less common but has been recorded in areas such as the Gulf of Kachchh. The coastal and mangrove habitats in this region provide potential habitats, though sightings are rare. The species' presence in Gujarat highlights the diverse marine life in the state's coastal waters, though the exact population size and distribution remain poorly understood.",
    "The Malabar Sea Snake is fully adapted to marine life, spending most of its time underwater. It feeds primarily on small fish and eels, which it captures using its potent venom. Unlike terrestrial snakes, it can absorb oxygen through its skin while submerged, allowing it to remain underwater for extended periods. The species is ovoviviparous, meaning females give birth to live young rather than laying eggs, an adaptation that suits its aquatic lifestyle.\nThreats: The primary threats to the Malabar Sea Snake include habitat destruction, particularly the degradation of coral reefs and mangroves due to coastal development, pollution, and overfishing. Accidental capture in fishing nets (bycatch) is also a significant threat, as the species often gets trapped and killed in trawling operations. In Gujarat, the expanding industrialization along the coast, particularly in the Gulf of Kachchh, poses additional risks to its habitat.",
    "Lorem Ipsum",
    "World: Globally, the conservation status of the Malabar Sea Snake is not well-documented, but like many sea snakes, it may face declining populations due to habitat loss and bycatch. The species is not currently listed on the IUCN Red List, but its status may require reassessment given the increasing threats to marine environments.\nIndia: In India, the Malabar Sea Snake is protected under the Wildlife Protection Act, 1972, though it is not listed under the most critical schedules like some other species. This protection provides a legal framework to prevent the killing or capture of the species, but enforcement can be challenging, especially in remote coastal areas.\nGujarat: In Gujarat, specific data on the Malabar Sea Snake's population and distribution are limited. However, the species' presence in the Gulf of Kachchh indicates the need for conservation measures to protect its habitat from industrial pollution, overfishing, and habitat destruction. Awareness and research are essential to understand its ecology and to implement effective conservation strategies in the region.",
    "The Malabar Sea Snake, though less commonly known, is an integral part of India's coastal marine biodiversity. Its presence on the Gujarat coast underscores the state's rich marine ecosystem, which requires ongoing protection and conservation efforts. By preserving the habitats of such species, we ensure the sustainability of marine life and the overall health of our coastal environments. Increased research and conservation initiatives are needed to safeguard the future of the Malabar Sea Snake and other marine species in Gujarat and beyond."
  ];
  final List<String> MALABAR_SNAKE_GUJ = [
    "માલાબાર સમુદ્રી સાપ (હાઈડ્રોફિસ માલાબેરિકસ) એક અત્યંત ઝેરી દરિયાઈ સાપ છે જે હિંદ મહાસાગરના દરિયાકાંઠાના અને દરિયાકાંઠાના પાણીમાં વસે છે. ભારતના મલબાર દરિયાકાંઠે નામ આપવામાં આવ્યું છે, જ્યાં તેનું સૌપ્રથમ વર્ણન કરવામાં આવ્યું હતું, આ પ્રજાતિ તેના વિશિષ્ટ અનુકૂલન માટે જાણીતી છે. દરિયાઇ જીવન, તેને દરિયાકાંઠાના દરિયાઇ ઇકોસિસ્ટમનો એક મહત્વપૂર્ણ ભાગ બનાવે છે, તેના ઇકોલોજીકલ મહત્વ હોવા છતાં, મલબાર સી સાપ અન્ય દરિયાઇ સાપની તુલનામાં પ્રમાણમાં ઓછો જાણીતો છે, તેના વિતરણ અને વસ્તીના વલણોને વધુ અભ્યાસની જરૂર છે.",
    "માલાબાર સી સાપનું શરીર નળાકાર હોય છે, જે દરિયાઈ સાપની લાક્ષણિકતા હોય છે, અને તે 1.2 થી 1.5 મીટરની લંબાઇ સુધી વધી શકે છે. તેનું શરીર બાજુથી સંકુચિત હોય છે, સ્વિમિંગમાં મદદ કરે છે, અને પાણીમાં આગળ વધવા માટે તેની પાસે એક વિશિષ્ટ ચપ્પુ આકારની પૂંછડી હોય છે. મલબાર સી સાપનો રંગ બદલાય છે પરંતુ સામાન્ય રીતે હળવા બેકગ્રાઉન્ડ પર ડાર્ક બેન્ડ અથવા રિંગ્સનો સમાવેશ થાય છે, જેમાં માથું પ્રમાણમાં નાનું અને સહેજ ચપટી હોય છે, જેમાં નસકોરા ઊંચા હોય છે પાણીની સપાટી પર શ્વાસ લેવાની સુવિધા માટે સ્નોટ તેના ભીંગડા સરળ અને ષટ્કોણ છે, જે સાપને આકર્ષક, સુવ્યવસ્થિત દેખાવ આપે છે.",
    "વિશ્વ: મલબાર સમુદ્ર સાપ હિંદ મહાસાગરના દરિયાકાંઠાના પાણીમાં, અરબી સમુદ્રથી બંગાળની ખાડી સુધી, દક્ષિણપૂર્વ એશિયામાં વિસ્તરેલો છે. તે સામાન્ય રીતે છીછરા દરિયાકાંઠાના પાણી, નદીમુખો અને કોરલ રીફ્સમાં જોવા મળે છે, જ્યાં તે શિકાર માટે શિકાર કરી શકે છે પ્રજાતિઓ અન્ય દરિયાકાંઠાના પ્રદેશોમાં પણ જોવા મળે છે પરંતુ તે ઓછી વાર જોવા મળે છે.\nગુજરાત કિનારે, મલબાર સમુદ્રી સાપ ઓછા જોવા મળે છે પરંતુ કચ્છના અખાત જેવા વિસ્તારોમાં તેની નોંધ કરવામાં આવી છે પ્રદેશ સંભવિત રહેઠાણો પૂરા પાડે છે, જોકે ગુજરાતમાં પ્રજાતિઓની હાજરી રાજ્યના દરિયાકાંઠાના પાણીમાં વૈવિધ્યસભર દરિયાઈ જીવનને પ્રકાશિત કરે છે, જો કે ચોક્કસ વસ્તીનું કદ અને વિતરણ ખરાબ રીતે સમજાયું છે.",
    "માલાબાર સમુદ્રી સાપ દરિયાઇ જીવન માટે સંપૂર્ણ રીતે અનુકૂળ છે, તેનો મોટાભાગનો સમય પાણીની અંદર વિતાવે છે. તે મુખ્યત્વે નાની માછલીઓ અને ઇલને ખવડાવે છે, જેને તે તેના શક્તિશાળી ઝેરનો ઉપયોગ કરીને પકડે છે. પાર્થિવ સાપથી વિપરીત, તે ડૂબી જાય ત્યારે તેની ત્વચા દ્વારા ઓક્સિજનને શોષી શકે છે, તેને લાંબા સમય સુધી પાણીની અંદર રહેવાની મંજૂરી આપવી આ પ્રજાતિ ઓવોવિવિપેરસ છે, એટલે કે માદા ઇંડા મૂકવાને બદલે યુવાનને જન્મ આપે છે, જે તેની જળચર જીવનશૈલીને અનુરૂપ અનુકૂલન છે. દરિયાકાંઠાના વિકાસ, પ્રદૂષણ અને વધુ પડતા માછીમારીને કારણે પરવાળાના ખડકોનું અધઃપતન પણ નોંધપાત્ર જોખમ છે, કારણ કે ગુજરાતમાં ઔદ્યોગિકીકરણના વિસ્તરણને કારણે પ્રજાતિઓ વારંવાર ફસાઈ જાય છે દરિયાકાંઠો, ખાસ કરીને કચ્છના અખાતમાં, તેના રહેઠાણ માટે વધારાનું જોખમ ઊભું કરે છે.",
    "Lorem Ipsum",
    "વિશ્વ: વૈશ્વિક સ્તરે, મલબાર સમુદ્ર સાપની સંરક્ષણ સ્થિતિ સારી રીતે દસ્તાવેજીકૃત નથી, પરંતુ ઘણા દરિયાઈ સાપની જેમ, તે વસવાટના નુકશાન અને બાયકેચને કારણે ઘટતી વસ્તીનો સામનો કરી શકે છે. પ્રજાતિ હાલમાં IUCN રેડ લિસ્ટમાં સૂચિબદ્ધ નથી, પરંતુ દરિયાઈ પર્યાવરણ માટેના વધતા જોખમોને ધ્યાનમાં રાખીને તેની સ્થિતિ માટે પુનઃમૂલ્યાંકનની જરૂર પડી શકે છે.\nભારત: ભારતમાં, મલબાર સી સાપને વન્યજીવન સંરક્ષણ અધિનિયમ, 1972 હેઠળ સંરક્ષિત કરવામાં આવે છે, જો કે તે કેટલીક અન્ય પ્રજાતિઓની જેમ સૌથી મહત્વપૂર્ણ શેડ્યૂલ હેઠળ સૂચિબદ્ધ નથી પ્રજાતિઓને મારવા અથવા પકડવાથી રોકવા માટે એક કાનૂની માળખું પૂરું પાડે છે, પરંતુ અમલીકરણ પડકારરૂપ હોઈ શકે છે, ખાસ કરીને દૂરના દરિયાકાંઠાના વિસ્તારોમાં.\nગુજરાત: ગુજરાતમાં, મલબાર સમુદ્રી સાપની વસ્તી અને વિતરણ પર ચોક્કસ ડેટા મર્યાદિત છે. કચ્છના અખાતમાં હાજરી તેના વસવાટને ઔદ્યોગિક પ્રદૂષણ, અતિશય માછીમારી અને વસવાટના વિનાશથી બચાવવા માટેના સંરક્ષણ પગલાંની જરૂરિયાત સૂચવે છે અને તેના પર્યાવરણને સમજવા અને આ પ્રદેશમાં અસરકારક સંરક્ષણ વ્યૂહરચના અમલમાં મૂકવા માટે જાગૃતિ અને સંશોધન જરૂરી છે.",
    "મલબાર સમુદ્રી સાપ, જોકે ઓછા જાણીતા છે, તે ભારતના દરિયાકાંઠાની દરિયાઇ જૈવવિવિધતાનો અભિન્ન ભાગ છે. ગુજરાતના દરિયાકાંઠે તેની હાજરી રાજ્યની સમૃદ્ધ દરિયાઇ ઇકોસિસ્ટમને રેખાંકિત કરે છે, જેને સતત સંરક્ષણ અને સંરક્ષણ પ્રયાસોની જરૂર છે. આવી પ્રજાતિઓના નિવાસસ્થાનોને સાચવીને, અમે દરિયાઇ જીવનની ટકાઉપણું અને અમારા દરિયાકાંઠાના વાતાવરણના એકંદર આરોગ્યની ખાતરી કરીએ છીએ.",
  ];

  final List<String> ANNULATED = [
    "The Annulated Sea Snake (Hydrophis cyanocinctus), also known as the Blue-banded Sea Snake, is a highly venomous marine snake recognized by its striking banded appearance. It is part of the larger family of sea snakes that inhabit the warm coastal waters of the Indo-Pacific region. Despite its venomous nature, this species plays a crucial role in marine ecosystems, particularly in controlling fish populations. However, like many sea snakes, the Annulated Sea Snake faces threats from human activities, making its conservation important.",
    "The Annulated Sea Snake typically grows to a length of 1 to 1.5 meters, though some individuals may exceed this size. Its body is long and cylindrical, adapted for swimming, with a distinctly flattened, paddle-like tail that aids in propulsion through water. The snake's body is characterized by alternating dark and light bands that can vary in colour from bluish-grey to black and white or yellow, giving it the \"annulated\" appearance. The head is relatively small and narrow, with large eyes that help it see in its aquatic environment. The scales are smooth and hexagonal, providing a sleek, hydrodynamic form suited for an aquatic lifestyle.",
    "World: The Annulated Sea Snake is widely distributed in the tropical and subtropical waters of the Indo-Pacific region, from the Arabian Sea to Southeast Asia and northern Australia. It inhabits shallow coastal waters, estuaries, and coral reefs, where it hunts for small fish and eels.\nIndia: In India, this species is found along the eastern and western coasts, including the Andaman and Nicobar Islands. It is particularly associated with the coastal waters of Tamil Nadu, Kerala, and the Lakshadweep Islands, where it is relatively common. The Annulated Sea Snake prefers shallow, warm waters where its prey is abundant.\nGujarat Coast: The presence of the Annulated Sea Snake along the Gujarat coast, particularly in the Gulf of Kachchh, has been documented, though it is considered less common in this region compared to other parts of India. The coastal and mangrove ecosystems of the Gulf of Kachchh provide suitable habitats, but sightings are rare, likely due to the species' preference for more tropical waters further south. However, occasional reports indicate that it does occur in these waters, especially in areas with coral reefs and rich fish populations.",
    "The Annulated Sea Snake is a fully aquatic species, spending almost its entire life in the water. It is ovoviviparous, giving birth to live young rather than laying eggs, which is an adaptation to its marine environment. The species primarily feeds on small fish, eels, and occasionally crustaceans, using its potent venom to immobilize prey. It is known to be aggressive if threatened, although it generally avoids human contact.",
    "Major threats to the Annulated Sea Snake include habitat destruction, particularly the degradation of coral reefs and mangroves due to coastal development and pollution. Bycatch in fishing operations is another significant threat, as these snakes often get entangled in fishing nets and are unable to survive. In Gujarat, the expanding industrial activities and pollution in the Gulf of Kachchh pose additional risks to the species' habitat. Furthermore, climate change and rising sea temperatures may impact their prey availability and alter their distribution patterns.",
    "World: Globally, the conservation status of the Annulated Sea Snake is not well-documented, but it is considered to be of Least Concern by the IUCN Red List, though this assessment may not fully reflect current population trends given increasing anthropogenic pressures on marine habitats,\nIndia: In India, the Annulated Sea Snake is protected under the Wildlife Protection Act, 1972, which prohibits the capture, killing, or trade of the species. While not listed under the most critical schedules, it still benefits from legal protections that are crucial for its conservation.\nGujarat: In Gujarat, specific data on the population and distribution of the Annulated Sea Snake are limited. However, the presence of this species in the Gulf of Kachchh highlights the need for conservation efforts, particularly in protecting coral reefs and mangrove habitats from industrial pollution and overfishing. Increased research and monitoring are essential to understand the status of this species in the region and to implement effective conservation measures.",
    "The Annulated Sea Snake, with its distinctive banded appearance, is a fascinating yet vulnerable inhabitant of India's coastal waters. Its presence along the Gujarat coast, though less common, signifies the state's rich marine biodiversity. Protecting the habitats of this and other marine species is critical for maintaining the health of our coastal ecosystems. Through research, awareness, and targeted conservation efforts, we can help ensure the survival of the Annulated Sea Snake and the ecological balance of the regions it inhabits."
  ];

  final List<String> ANNULATED_GUJ = [
    "ધ એન્યુલેટેડ સી સ્નેક (હાઈડ્રોફિસ સાયનોસીક્ટસ), જેને બ્લુ-બેન્ડેડ સી સ્નેક તરીકે પણ ઓળખવામાં આવે છે, તે એક અત્યંત ઝેરી દરિયાઈ સાપ છે જે તેના ત્રાટકતા પટ્ટાવાળા દેખાવ દ્વારા ઓળખાય છે. તે દરિયાઈ સાપના મોટા પરિવારનો એક ભાગ છે જે ગરમ દરિયાકાંઠાના પાણીમાં વસે છે. ઈન્ડો-પેસિફિક પ્રદેશ તેની ઝેરી પ્રકૃતિ હોવા છતાં, આ પ્રજાતિ દરિયાઈ જીવસૃષ્ટિમાં નિર્ણાયક ભૂમિકા ભજવે છે, ખાસ કરીને માછલીઓની વસ્તીને નિયંત્રિત કરવામાં, જો કે, અસંખ્ય દરિયાઈ સાપની જેમ, તેના સંરક્ષણને મહત્વપૂર્ણ બનાવે છે.",
    "એન્યુલેટેડ સી સાપ સામાન્ય રીતે 1 થી 1.5 મીટરની લંબાઇ સુધી વધે છે, જો કે કેટલાક વ્યક્તિઓ આ કદ કરતાં વધી શકે છે. તેનું શરીર લાંબુ અને નળાકાર હોય છે, સ્વિમિંગ માટે અનુકૂળ હોય છે, સ્પષ્ટ રીતે ચપટી, ચપ્પુ જેવી પૂંછડી હોય છે જે પાણી દ્વારા આગળ વધવામાં મદદ કરે છે. સાપનું શરીર વૈકલ્પિક શ્યામ અને હળવા બેન્ડ દ્વારા વર્ગીકૃત થયેલ છે જે વાદળી-ગ્રેથી કાળા અને સફેદ અથવા પીળા રંગમાં બદલાઈ શકે છે, જેનું માથું પ્રમાણમાં નાનું અને સાંકડું હોય છે, જેની આંખો મોટી હોય છે તેને તેના જળચર વાતાવરણમાં જોવામાં મદદ કરે છે.",
    "વર્લ્ડ: એન્યુલેટેડ સી સાપ ઈન્ડો-પેસિફિક ક્ષેત્રના ઉષ્ણકટિબંધીય અને ઉષ્ણકટિબંધીય પાણીમાં, અરબી સમુદ્રથી દક્ષિણપૂર્વ એશિયા અને ઉત્તરીય ઑસ્ટ્રેલિયામાં વ્યાપકપણે વિતરિત થાય છે. તે છીછરા દરિયાકાંઠાના પાણી, નદીમુખો અને પરવાળાના ખડકોમાં રહે છે, જ્યાં તે શિકાર કરે છે. નાની માછલી અને ઇલ.\nભારત: ભારતમાં, આ પ્રજાતિ આંદામાન અને નિકોબાર ટાપુઓ સહિત પૂર્વીય અને પશ્ચિમી દરિયાકાંઠે જોવા મળે છે, તે ખાસ કરીને તમિલનાડુ, કેરળ અને લક્ષદ્વીપ ટાપુઓના દરિયાકાંઠાના પાણી સાથે સંકળાયેલી છે. એન્યુલેટેડ સી સાપ છીછરા, ગરમ પાણીને પસંદ કરે છે જ્યાં તેનો શિકાર વિપુલ પ્રમાણમાં હોય છે.\nગુજરાત કિનારો: ગુજરાતના દરિયાકાંઠે, ખાસ કરીને કચ્છના અખાતમાં એન્યુલેટેડ સી સાપની હાજરી દસ્તાવેજીકૃત કરવામાં આવી છે, જો કે તે માનવામાં આવે છે. ભારતના અન્ય ભાગોની સરખામણીમાં આ પ્રદેશમાં ઓછા સામાન્ય છે. જો કે, પ્રસંગોપાત અહેવાલો સૂચવે છે કે તે આ પાણીમાં થાય છે, ખાસ કરીને કોરલ રીફ અને સમૃદ્ધ માછલીની વસ્તીવાળા વિસ્તારોમાં.",
    "એન્યુલેટેડ સી સાપ એક સંપૂર્ણ જળચર પ્રજાતિ છે, જે તેનું આખું જીવન પાણીમાં વિતાવે છે. તે ઓવોવિવિપેરસ છે, ઇંડા મૂકવાને બદલે યુવાન રહેવા માટે જન્મ આપે છે, જે તેના દરિયાઈ વાતાવરણમાં અનુકૂલન છે. પ્રજાતિઓ મુખ્યત્વે નાની માછલીઓને ખવડાવે છે. , ઇલ અને ક્યારેક ક્રસ્ટેસિયન, શિકારને સ્થિર કરવા માટે તેના શક્તિશાળી ઝેરનો ઉપયોગ કરીને જો ધમકી આપવામાં આવે તો તે આક્રમક માનવામાં આવે છે, જો કે તે સામાન્ય રીતે માનવ સંપર્કને ટાળે છે.",
    "એન્યુલેટેડ સી સાપ માટેના મુખ્ય જોખમોમાં વસવાટનો વિનાશનો સમાવેશ થાય છે, ખાસ કરીને દરિયાકાંઠાના વિકાસ અને પ્રદૂષણને કારણે કોરલ રીફ્સ અને મેન્ગ્રોવ્સનું અધઃપતન. માછીમારીની કામગીરીમાં બાયકેચ એ અન્ય એક નોંધપાત્ર ખતરો છે, કારણ કે આ સાપ ઘણીવાર માછીમારીની જાળમાં ફસાઈ જાય છે અને જીવી શકતા નથી. .",
    "વિશ્વ: વૈશ્વિક સ્તરે, એન્યુલેટેડ સી સાપની સંરક્ષણ સ્થિતિ સારી રીતે દસ્તાવેજીકૃત નથી, પરંતુ IUCN રેડ લિસ્ટ દ્વારા તેને સૌથી ઓછી ચિંતાનો વિષય માનવામાં આવે છે, જો કે આ મૂલ્યાંકન દરિયાઇ પર વધતા માનવવંશીય દબાણને કારણે વર્તમાન વસ્તી વલણોને સંપૂર્ણપણે પ્રતિબિંબિત કરી શકશે નહીં. વસવાટ,\nભારત: ભારતમાં, એન્યુલેટેડ સી સાપને વાઇલ્ડલાઇફ પ્રોટેક્શન એક્ટ, 1972 હેઠળ સંરક્ષિત કરવામાં આવે છે, જે પ્રજાતિઓને પકડવા, મારવા અથવા વેપાર કરવા પર પ્રતિબંધ મૂકે છે, જ્યારે તે સૌથી મહત્વપૂર્ણ સમયપત્રક હેઠળ સૂચિબદ્ધ નથી, તે હજુ પણ કાનૂની રક્ષણથી લાભ મેળવે છે જે તેના સંરક્ષણ માટે નિર્ણાયક છે.\nગુજરાત: ગુજરાતમાં, એન્યુલેટેડ સી સાપની વસ્તી અને વિતરણ અંગેનો ચોક્કસ ડેટા મર્યાદિત છે, જો કે, કચ્છના અખાતમાં આ પ્રજાતિની હાજરી ખાસ કરીને સંરક્ષણ માટેના પ્રયત્નોની જરૂરિયાત દર્શાવે છે. ઔદ્યોગિક પ્રદૂષણ અને અતિશય માછીમારીથી પરવાળાના ખડકો અને મેન્ગ્રોવ વસવાટ આ પ્રદેશમાં આ પ્રજાતિની સ્થિતિને સમજવા અને અસરકારક સંરક્ષણ પગલાં અમલમાં મૂકવા માટે જરૂરી છે.",
    "અનુલેટેડ સી સાપ, તેના વિશિષ્ટ પટ્ટાવાળા દેખાવ સાથે, ભારતના દરિયાકાંઠાના પાણીમાં એક આકર્ષક છતાં સંવેદનશીલ રહેવાસી છે. ગુજરાતના દરિયાકાંઠે તેની હાજરી, ઓછી સામાન્ય હોવા છતાં, રાજ્યની સમૃદ્ધ દરિયાઈ જૈવવિવિધતા દર્શાવે છે. આ અને અન્ય દરિયાઈ પ્રજાતિઓના નિવાસસ્થાનોનું રક્ષણ કરે છે. સંશોધન, જાગરૂકતા અને લક્ષિત સંરક્ષણ પ્રયાસો દ્વારા અમારા દરિયાકાંઠાના ઇકોસિસ્ટમના સ્વાસ્થ્યને જાળવવા માટે મહત્વપૂર્ણ છે, અમે એન્યુલેટેડ સી સાપના અસ્તિત્વ અને તે જે પ્રદેશોમાં વસવાટ કરે છે તેના પર્યાવરણીય સંતુલનને સુનિશ્ચિત કરવામાં મદદ કરી શકીએ છીએ."
  ];

  final List<String> YELLOW_BELLIED = [
    "The SEA SNAKE Sea Snake (Hydrophis platurus), one of the most widely distributed sea snakes, is renowned for its striking coloration and its remarkable ability to thrive in various marine environments. This highly venomous snake is often found in tropical and subtropical waters across the globe. Its adaptability to a pelagic lifestyle allows it to inhabit open oceans far from land, a characteristic that distinguishes it from other sea snakes. However, despite its extensive range, the SEA SNAKE Sea Snake faces several threats, especially in coastal areas impacted by human activities.",
    "The SEA SNAKE Sea Snake is easily recognizable by its contrasting coloration: a dark brown or black upper body and a bright yellow underside. This color pattern serves as a warning to predators and is a common feature in venomous species. The snake's body is slender and can reach a length of 1 to 1.2 meters. Its tail is distinctly flattened, forming a paddle-like structure that aids in swimming. The head is small and somewhat flattened, with nostrils positioned on the upper surface to facilitate breathing at the water's surface. The scales are smooth and hexagonal, contributing to the snake's streamlined form, which is perfectly adapted for an aquatic lifestyle.",
    "World: The SEA SNAKE Sea Snake is one of the most widespread sea snakes, found in tropical and subtropical waters across the Indian Ocean, Pacific Ocean, and parts of the Atlantic Ocean. It is unique among sea snakes in that it can live entirely in the open ocean, far from any landmass. This pelagic lifestyle means it can be found in a wide range of marine environments, from coastal areas to the open sea.\nIndia: In India, the SEA SNAKE Sea Snake is found along both the eastern and western coasts, as well as around the Andaman and Nicobar Islands. It is relatively common in Indian waters, especially in the warm, tropical regions where it can easily find food and suitable habitats.\nGujarat Coast: The presence of the SEA SNAKE Sea Snake along the Gujarat coast, particularly in the Gulf of Kachchh, has been documented, although it is not as commonly seen as in other parts of India. The Gulf of Kachchh, with its diverse marine habitats, provides potential environments for this species, although the snake is more typically associated with deeper waters. Sightings in Gujarat are relatively rare, likely due to its preference for offshore and open ocean habitats rather than coastal areas heavily influenced by human activities.",
    "The SEA SNAKE Sea Snake is fully aquatic, spending its entire life in the ocean. It is a powerful swimmer, capable of covering vast distances in search of food, which primarily consists of small fish. The species is ovoviviparous, giving birth to live young, which is an adaptation to its marine environment. It can remain submerged for extended periods, absorbing oxygen through its skin, and surfaces only briefly to breathe. The snake is known for its ability to survive in a variety of marine environments, from coastal waters to the open ocean, demonstrating remarkable adaptability.",
    "The SEA SNAKE Sea Snake faces several threats, including habitat degradation, pollution, and bycatch in fishing operations. In Gujarat, industrial activities along the coast, particularly in the Gulf of Kachchh, pose significant risks to marine habitats that could indirectly affect the species. While the snake is less dependent on specific coastal habitats, pollution and changes in water quality can still impact its prey availability and overall health. Additionally, bycatch in commercial fishing nets is a significant threat, as these snakes often become entangled and are unable to escape.",
    "World: Globally, the SEA SNAKE Sea Snake is currently listed as \"Least Concern\" on the IUCN Red List, reflecting its wide distribution and adaptability. However, the species could face localized threats in certain areas, particularly where marine pollution and bycatch are prevalent.\nIndia: Although it is not listed under the highest protection schedules, the law provides a framework for safeguarding the species from exploitation and harm.\nGujarat: Protecting the Gulf of Kachchh's marine ecosystems from pollution and overfishing will be crucial for the continued presence of this and other marine species in Gujarat's waters.",
    "The SEA SNAKE Sea Snake is a remarkable example of marine adaptation, thriving in a variety of oceanic environments worldwide. Its presence in Indian waters, including the Gulf of Kachchh, highlights the rich biodiversity of our seas. However, the increasing threats from human activities, such as pollution and bycatch, underline the need for vigilant conservation efforts. By protecting our marine ecosystems, we can ensure the survival of the SEA SNAKE Sea Snake and the overall health of our oceans."
  ];

  final List<String> YELLOW_BELLIED_GUJ = [
    "યલો-બેલીડ સી સાપ (હાઈડ્રોફિસ પ્લાટ્યુરસ), સૌથી વધુ વિતરિત દરિયાઈ સાપમાંનો એક, તેના આકર્ષક રંગ અને વિવિધ દરિયાઈ વાતાવરણમાં વિકાસ કરવાની તેની નોંધપાત્ર ક્ષમતા માટે પ્રખ્યાત છે. આ અત્યંત ઝેરી સાપ ઘણીવાર ઉષ્ણકટિબંધીય અને ઉષ્ણકટિબંધીય પાણીમાં જોવા મળે છે. સમગ્ર વિશ્વમાં પેલેજિક જીવનશૈલી માટે તેની અનુકૂલનક્ષમતા તેને જમીનથી દૂર ખુલ્લા મહાસાગરોમાં રહેવાની મંજૂરી આપે છે, જે તેને અન્ય દરિયાઈ સાપથી અલગ પાડે છે, જો કે, તેની વ્યાપક શ્રેણી હોવા છતાં, પીળા પેટવાળા સમુદ્રી સાપને ઘણા જોખમોનો સામનો કરવો પડે છે, ખાસ કરીને દરિયાકાંઠામાં. માનવ પ્રવૃત્તિઓથી પ્રભાવિત વિસ્તારો.",
    "પીળા પેટવાળો દરિયાઈ સાપ તેના વિરોધાભાસી રંગ દ્વારા સરળતાથી ઓળખી શકાય છે: ઘેરો કથ્થઈ અથવા કાળો શરીરનો ઉપરનો ભાગ અને નીચેનો ચળકતો પીળો. આ રંગની પેટર્ન શિકારીઓને ચેતવણી તરીકે કામ કરે છે અને ઝેરી પ્રજાતિઓમાં સામાન્ય લક્ષણ છે. સાપનું શરીર છે. પાતળી અને 1 થી 1.2 મીટરની લંબાઈ સુધી પહોંચી શકે છે, તેની પૂંછડી એક ચપ્પુ જેવી રચના બનાવે છે જે તરવામાં મદદ કરે છે. સપાટી સરળ અને ષટ્કોણ છે, જે સાપના સુવ્યવસ્થિત સ્વરૂપમાં ફાળો આપે છે, જે જળચર જીવનશૈલી માટે સંપૂર્ણ રીતે અનુકૂળ છે.",
    "વર્લ્ડ: ધ યલો-બેલીડ સી સ્નેક એ સૌથી વધુ વ્યાપક દરિયાઈ સાપ છે, જે હિંદ મહાસાગર, પેસિફિક મહાસાગર અને એટલાન્ટિક મહાસાગરના કેટલાક ભાગોમાં ઉષ્ણકટિબંધીય અને ઉષ્ણકટિબંધીય પાણીમાં જોવા મળે છે. તે દરિયાઈ સાપમાં અનન્ય છે કે તે જીવી શકે છે. સંપૂર્ણ રીતે ખુલ્લા મહાસાગરમાં, કોઈપણ લેન્ડમાસથી દૂર આ પેલેજિક જીવનશૈલીનો અર્થ છે કે તે દરિયાકાંઠાના વિસ્તારોથી લઈને ખુલ્લા સમુદ્ર સુધીના દરિયાઈ વાતાવરણની વિશાળ શ્રેણીમાં મળી શકે છે. પૂર્વીય અને પશ્ચિમી દરિયાકિનારા, તેમજ આંદામાન અને નિકોબાર ટાપુઓની આસપાસ તે પ્રમાણમાં સામાન્ય છે, ખાસ કરીને ગરમ, ઉષ્ણકટિબંધીય પ્રદેશોમાં જ્યાં તે સરળતાથી ખોરાક અને યોગ્ય રહેઠાણો શોધી શકે છે.\nગુજરાત કોસ્ટ: ની હાજરી. ગુજરાતના દરિયાકાંઠે, ખાસ કરીને કચ્છના અખાતમાં પીળા પેટવાળા દરિયાઈ સાપનું દસ્તાવેજીકરણ કરવામાં આવ્યું છે, જો કે તે ભારતના અન્ય ભાગોમાં જોવા મળતું નથી, તેમ છતાં કચ્છનો અખાત તેના વૈવિધ્યસભર દરિયાઈ વસવાટો સાથે સંભવિત વાતાવરણ પૂરો પાડે છે આ પ્રજાતિ, જોકે સાપ વધુ સામાન્ય રીતે ઊંડા પાણી સાથે સંકળાયેલો છે. માનવીય પ્રવૃત્તિઓથી ભારે પ્રભાવિત દરિયાકાંઠાના વિસ્તારોને બદલે ઓફશોર અને ખુલ્લા સમુદ્રી વસવાટો માટે તેની પસંદગીને કારણે ગુજરાતમાં જોવાનું પ્રમાણ પ્રમાણમાં દુર્લભ છે.",
    "પીળા પેટવાળો સમુદ્રી સાપ સંપૂર્ણ રીતે જળચર છે, તેનું આખું જીવન સમુદ્રમાં વિતાવે છે. તે એક શક્તિશાળી તરવૈયા છે, જે ખોરાકની શોધમાં વિશાળ અંતર કાપવામાં સક્ષમ છે, જેમાં મુખ્યત્વે નાની માછલીઓનો સમાવેશ થાય છે. આ પ્રજાતિ ઓવોવિવિપેરસ છે, જે બાળકોને જન્મ આપે છે. જીવંત યુવાન, જે તેના દરિયાઈ વાતાવરણમાં અનુકૂલન છે, તે લાંબા સમય સુધી તેની ત્વચા દ્વારા ઓક્સિજનને શોષી શકે છે, અને સાપ તેની વિવિધ દરિયાઈ વાતાવરણમાં ટકી રહેવાની ક્ષમતા માટે જાણીતો છે ખુલ્લા મહાસાગરમાં દરિયાકાંઠાના પાણી, નોંધપાત્ર અનુકૂલનક્ષમતા દર્શાવે છે.",
    "પીળા પેટવાળા સમુદ્રી સાપને વસવાટના અધોગતિ, પ્રદૂષણ અને માછીમારીની કામગીરીમાં બાયકેચ સહિતના અનેક જોખમોનો સામનો કરવો પડે છે. ગુજરાતમાં, દરિયાકાંઠેની ઔદ્યોગિક પ્રવૃત્તિઓ, ખાસ કરીને કચ્છના અખાતમાં, દરિયાઇ વસવાટો માટે નોંધપાત્ર જોખમ ઊભું કરે છે જે પરોક્ષ રીતે અસર કરી શકે છે. પ્રજાતિઓ જ્યારે સાપ ચોક્કસ દરિયાકાંઠાના રહેઠાણો પર ઓછો આધાર રાખે છે, ત્યારે પ્રદૂષણ અને પાણીની ગુણવત્તા હજુ પણ તેના શિકારની ઉપલબ્ધતા અને એકંદર આરોગ્યને અસર કરી શકે છે. છટકી જવા માટે.",
    "વિશ્વ: વૈશ્વિક સ્તરે, પીળા પેટવાળા દરિયાઈ સાપને હાલમાં IUCN રેડ લિસ્ટમાં \"ઓછામાં ઓછી ચિંતા\" તરીકે સૂચિબદ્ધ કરવામાં આવ્યો છે, જે તેના વ્યાપક વિતરણ અને અનુકૂલનક્ષમતાને પ્રતિબિંબિત કરે છે. જો કે, પ્રજાતિઓ ચોક્કસ વિસ્તારોમાં સ્થાનિક જોખમોનો સામનો કરી શકે છે, ખાસ કરીને જ્યાં દરિયાઈ પ્રદૂષણ અને બાયકેચ પ્રચલિત છે.\nભારત: જો કે તે સર્વોચ્ચ સુરક્ષા સમયપત્રક હેઠળ સૂચિબદ્ધ નથી, કાયદો શોષણ અને નુકસાનથી પ્રજાતિઓને સુરક્ષિત રાખવા માટે એક માળખું પૂરું પાડે છે.\nગુજરાત: પ્રદૂષણ અને અતિશય માછીમારીથી કચ્છના અખાતની દરિયાઈ જીવસૃષ્ટિનું રક્ષણ કરવું નિર્ણાયક બનશે. ગુજરાતના પાણીમાં આ અને અન્ય દરિયાઈ પ્રજાતિઓની સતત હાજરી માટે.",
    "પીળા પેટવાળો દરિયાઈ સાપ એ દરિયાઈ અનુકૂલનનું એક અદ્ભુત ઉદાહરણ છે, જે વિશ્વભરમાં વિવિધ સમુદ્રી વાતાવરણમાં ખીલે છે. કચ્છના અખાત સહિત ભારતીય પાણીમાં તેની હાજરી, આપણા સમુદ્રની સમૃદ્ધ જૈવવિવિધતાને પ્રકાશિત કરે છે. જો કે, તેનાથી વધતા જોખમો માનવીય પ્રવૃત્તિઓ, જેમ કે પ્રદૂષણ અને બાયકેચ, અમારા દરિયાઈ જીવસૃષ્ટિનું રક્ષણ કરીને, અમે પીળા પેટવાળા સમુદ્રી સાપનું અસ્તિત્વ અને આપણા મહાસાગરોના એકંદર સ્વાસ્થ્યને સુનિશ્ચિત કરી શકીએ છીએ."
  ];

  final List<String> HOOK_NOSED = [
    "The Hook-nosed Sea Snake (Hydrophis curtus) is a lesser-known species of sea snake distinguished by its unique head structure, featuring a hooked snout. This venomous marine snake is adapted to a fully aquatic lifestyle, inhabiting shallow coastal waters and estuaries throughout its range. Despite its specialized adaptations and ecological role, the Hook-nosed Sea Snake faces several conservation challenges due to human activities impacting its habitat.",
    "The Hook-nosed Sea Snake is notable for its distinctive head shape. The snout is elongated and curved downwards, forming a hook-like structure that aids in foraging for prey buried in sand or mud. It typically grows to a length of about 1 to 1.2 meters. The body is cylindrical and laterally flattened, with a paddle-shaped tail that facilitates efficient swimming. The coloration varies but generally includes a pattern of dark bands or spots on a lighter background, providing camouflage in its marine environment. The scales are smooth and arranged in hexagonal patterns, contributing to the snake's streamlined appearance.",
    "World: The Hook-nosed Sea Snake is found in the tropical and subtropical regions of the Indian and Pacific Oceans. Its distribution includes coastal waters and estuaries, where it can be seen in shallow sandy or muddy areas. It is adapted to living in environments with abundant prey and suitable conditions for its specialized feeding behavior.\nIndia: In India, the Hook-nosed Sea Snake is present along both the eastern and western coasts. It is found in various coastal regions, including the Andaman and Nicobar Islands. The species is relatively common in the Indian subcontinent, particularly in areas with suitable shallow water habitats.\nGujarat Coast: On the Gujarat coast, particularly in the Gulf of Kachchh, the Hook-nosed Sea Snake has been recorded, though it is not as commonly observed as some other sea snake species. The Gulf of Kachchh provides a suitable habitat with its estuarine and coastal environments, but sightings are relatively rare compared to more frequently studied regions. The specific population status in Gujarat remains less well-documented, indicating a need for further research.",
    "The Hook-nosed Sea Snake is adapted to a life in shallow waters, where it uses its hooked snout to probe for prey such as small fish and crustaceans in the sand or mud. It is ovoviviparous, giving birth to live young, which is advantageous for survival in its aquatic environment. The snake is well-adapted to swimming and can remain submerged for extended periods, relying on its specialized feeding techniques to capture prey.",
    "The Hook-nosed Sea Snake faces several threats, including habitat destruction, pollution, and bycatch. In Gujarat, industrialization and development along the coast, especially in the Gulf of Kachchh, pose risks to the species' habitat. Coastal pollution and degradation of estuarine environments impact the availability of suitable habitats and prey. Additionally, accidental capture in fishing gear is a significant threat, as the species can become entangled and suffer mortality.",
    "World: Globally, the Hook-nosed Sea Snake is not listed on the IUCN Red List, which means its conservation status is not as well-documented as some other sea snake species.\nIndia:  Although it is not listed under the highest protection schedules, the law provides a framework for safeguarding the species from exploitation and harm.\nGujarat: Protecting the Gulf of Kachchh's marine ecosystems from pollution and overfishing will be crucial for the continued presence of this and other marine species in Gujarat's waters.",
    "The Hook-nosed Sea Snake is a fascinating example of marine adaptation with its unique head structure and specialized feeding behavior. Its presence along the Gujarat coast underscores the region's rich marine biodiversity. Protecting the habitats of such species is crucial for maintaining ecological balance and ensuring the health of our coastal ecosystems. Through continued research and conservation efforts, we can help safeguard the Hook-nosed Sea Snake and other marine life in Gujarat and beyond."
  ];

  final List<String> HOOK_NOSED_GUJ = [
    "ધ હૂક-નોઝ્ડ સી સાપ (હાઈડ્રોફિસ કર્ટસ) એ દરિયાઈ સાપની ઓછી જાણીતી પ્રજાતિ છે જે તેના માથાના અનોખા બંધારણ દ્વારા અલગ પડે છે, જેમાં હૂક સ્નોટ હોય છે. આ ઝેરી દરિયાઈ સાપ સંપૂર્ણપણે જળચર જીવનશૈલીને અનુરૂપ છે, છીછરા દરિયાકાંઠાના પાણીમાં વસવાટ કરે છે. તેની સમગ્ર શ્રેણીમાં તેના વિશિષ્ટ અનુકૂલન અને પર્યાવરણીય ભૂમિકા હોવા છતાં, હૂક-નોઝ્ડ સી સ્નેક તેના નિવાસસ્થાનને અસર કરતી માનવ પ્રવૃત્તિઓને કારણે અનેક સંરક્ષણ પડકારોનો સામનો કરે છે.",
    "હૂક-નાકવાળો દરિયાઈ સાપ તેના વિશિષ્ટ માથાના આકાર માટે નોંધપાત્ર છે. સ્નોટ વિસ્તરેલ અને નીચેની તરફ વળેલું હોય છે, જે હૂક જેવું માળખું બનાવે છે જે રેતી અથવા કાદવમાં દટાયેલા શિકારને ઘાસચારામાં મદદ કરે છે. તે સામાન્ય રીતે લગભગ 1 ની લંબાઈ સુધી વધે છે. 1.2 મીટર સુધીનું શરીર નળાકાર અને પાછળથી ચપટી છે, જે કાર્યક્ષમ સ્વિમિંગની સુવિધા આપે છે, પરંતુ સામાન્ય રીતે તેના દરિયાઇ વાતાવરણમાં છદ્માવરણ પ્રદાન કરતી ડાર્ક બેન્ડ્સ અથવા ફોલ્લીઓનો સમાવેશ થાય છે સાપના સુવ્યવસ્થિત દેખાવમાં ફાળો આપે છે.",
    "વર્લ્ડ: હૂક-નોઝ્ડ સી સાપ ભારતીય અને પેસિફિક મહાસાગરોના ઉષ્ણકટિબંધીય અને ઉષ્ણકટિબંધીય પ્રદેશોમાં જોવા મળે છે. તેના વિતરણમાં દરિયાકાંઠાના પાણી અને નદીમુખોનો સમાવેશ થાય છે, જ્યાં તે છીછરા રેતાળ અથવા કાદવવાળા વિસ્તારોમાં જોઈ શકાય છે. તે રહેવા માટે અનુકૂળ છે. વિપુલ પ્રમાણમાં શિકાર અને તેના વિશિષ્ટ ખોરાકની વર્તણૂક માટે યોગ્ય પરિસ્થિતિઓ સાથેનું વાતાવરણ.\nભારત: ભારતમાં, હૂક-નોઝ્ડ સી સાપ પૂર્વીય અને પશ્ચિમી બંને કિનારે હાજર છે, તે આંદામાન અને નિકોબાર ટાપુઓ સહિત વિવિધ દરિયાકાંઠાના પ્રદેશોમાં જોવા મળે છે. ભારતીય ઉપખંડમાં આ પ્રજાતિ પ્રમાણમાં સામાન્ય છે, ખાસ કરીને છીછરા પાણીના યોગ્ય વસવાટ ધરાવતા વિસ્તારોમાં.\nગુજરાત કિનારો: ગુજરાતના દરિયાકાંઠે, ખાસ કરીને કચ્છના અખાતમાં, હૂક-નોઝ્ડ સી સાપ નોંધવામાં આવ્યો છે, જોકે તે આટલો નથી. સામાન્ય રીતે અમુક અન્ય દરિયાઈ સાપની પ્રજાતિઓ તરીકે જોવામાં આવે છે. ગુજરાતમાં વસ્તીની ચોક્કસ સ્થિતિ ઓછી સારી રીતે દસ્તાવેજીકૃત રહી છે, જે વધુ સંશોધનની જરૂરિયાત દર્શાવે છે.",
    "હૂક-નાકવાળો દરિયાઈ સાપ છીછરા પાણીમાં જીવન માટે અનુકૂળ છે, જ્યાં તે રેતી અથવા કાદવમાં નાની માછલીઓ અને ક્રસ્ટેશિયન્સ જેવા શિકારની તપાસ માટે તેના હૂકવાળા સ્નોટનો ઉપયોગ કરે છે. તે ઓવોવિવિપેરસ છે, જે યુવાનને જન્મ આપે છે, જે તેના જળચર વાતાવરણમાં અસ્તિત્વ ટકાવી રાખવા માટે ફાયદાકારક છે.",
    "હૂક-નોઝ્ડ સી સાપને વસવાટનો વિનાશ, પ્રદૂષણ અને બાયકેચ સહિતના અનેક જોખમોનો સામનો કરવો પડે છે. ગુજરાતમાં, દરિયાકાંઠે, ખાસ કરીને કચ્છના અખાતમાં ઔદ્યોગિકીકરણ અને વિકાસ, પ્રજાતિઓના રહેઠાણ માટે જોખમ ઊભું કરે છે. દરિયાકાંઠાનું પ્રદૂષણ અને અધોગતિ નદીનું વાતાવરણ યોગ્ય રહેઠાણો અને શિકારની ઉપલબ્ધતાને અસર કરે છે વધુમાં, માછીમારીના સાધનોમાં આકસ્મિક રીતે પકડવું એ એક નોંધપાત્ર ખતરો છે, કારણ કે પ્રજાતિઓ ફસાઈ શકે છે અને મૃત્યુદરનો ભોગ બની શકે છે.",
    "વિશ્વ: વૈશ્વિક સ્તરે, હૂક-નોઝ્ડ સી સાપ IUCN રેડ લિસ્ટમાં સૂચિબદ્ધ નથી, જેનો અર્થ છે કે તેની સંરક્ષણ સ્થિતિ કેટલીક અન્ય દરિયાઈ સાપની પ્રજાતિઓ જેટલી સારી રીતે દસ્તાવેજીકૃત નથી.\nભારત: જો કે તે સર્વોચ્ચ સંરક્ષણ હેઠળ સૂચિબદ્ધ નથી સમયપત્રક, કાયદો પ્રજાતિઓને શોષણ અને નુકસાનથી બચાવવા માટેનું માળખું પૂરું પાડે છે.\nગુજરાત: ગુજરાતના પાણીમાં આ અને અન્ય દરિયાઈ પ્રજાતિઓની સતત હાજરી માટે કચ્છના અખાતની દરિયાઈ જીવસૃષ્ટિને પ્રદૂષણ અને અતિશય માછીમારીથી સુરક્ષિત કરવી મહત્ત્વપૂર્ણ બની રહેશે.",
    "હૂક-નોઝ્ડ સી સ્નેક તેના માથાના અનોખા બંધારણ અને વિશિષ્ટ ખોરાકની વર્તણૂક સાથે દરિયાઇ અનુકૂલનનું આકર્ષક ઉદાહરણ છે. ગુજરાતના દરિયાકાંઠે તેની હાજરી પ્રદેશની સમૃદ્ધ દરિયાઇ જૈવવિવિધતાને રેખાંકિત કરે છે. પર્યાવરણીય સંતુલન જાળવવા માટે આવી પ્રજાતિઓના નિવાસસ્થાનોનું રક્ષણ કરવું મહત્વપૂર્ણ છે. અમારા દરિયાકાંઠાના ઇકોસિસ્ટમના સ્વાસ્થ્યને સુનિશ્ચિત કરીને સતત સંશોધન અને સંરક્ષણ પ્રયાસો દ્વારા, અમે હૂક-નોઝ્ડ સી સ્નેક અને ગુજરાત અને તેની બહારના અન્ય દરિયાઇ જીવોને સુરક્ષિત કરવામાં મદદ કરી શકીએ છીએ."
  ];
  final List<String> OFFSHORE_GULLS = [
    "Gulls and terns are prominent members of coastal and offshore avifauna, known for their striking appearance and dynamic behaviours. These seabirds play critical roles in marine ecosystems, including controlling fish populations and serving as indicators of environmental health. Gujarat, with its extensive coastline along the Arabian Sea and the Gulf of Kachchh, provides essential habitats for a variety of gulls and terns. This region supports both resident and migratory species, contributing to its rich avian biodiversity.",
    "Gulls in the coastal areas of Gujarat are generally medium to large birds with robust bodies and long wings. They have stout, slightly hooked beaks, often yellow or red, which are well-suited for their varied diet. Their plumage is typically white or gray, with darker wingtips and back, and they often show a stark contrast between their pale body and dark flight feathers. Gulls have webbed feet, making them strong swimmers, and their legs are usually pink, yellow, or black. During breeding season, some species may display distinctive head markings, which can vary between black hoods or caps.\nTerns, on the other hand, are more slender and graceful than gulls, with a sleek, streamlined appearance. They have long, pointed wings and a deeply forked tail that aids in their agile flight, often seen hovering or diving to catch fish. Terns typically have a sharp, pointed bill that can be red, orange, or black, depending on the species. Their plumage is generally pale, with a contrasting black cap on their heads during the breeding season. Terns are known for their elegant and buoyant flight, often skimming the water surface, and their legs are usually shorter and more delicate compared to those of gulls.",
    "Gulls: In Gujarat, gulls are generally common, particularly during the winter migratory season. Some common Gulls on Gujarat coast include Black-headed Gull, Brown-headed Gull, Heuglin’s Gull, Steppe Gull AND Pallas’s Gull. Some Uncommon to Rare species include Slender-billed Gull (uncommon to common), Mew Gull(vagrant), Mongolian Gull (vagrant), Taimir Gull (rare) and Caspian Gull (rare). All gulls are winter visitors to Gujarat except Slender-billed Gull which can be resident and winter visitor.\nTerns: Terns are also relatively common in Gujarat, with several species regularly observed along the coast. Some common terns on Gujarat coast include Gull-billed Tern, Caspian Tern, Lesser Crested Tern, Little Tern, Whiskered Tern.  Some uncommon to rare (including vagrant) terns include Bridled Tern, Sooty Tern, Brown Noddy, Black Noddy, White-winged Tern, Saunder’s Tern, White-cheeked Tern, Common Tern, Greater Crested Tern, Sandwich Tern. Except Little Tern and Saunder’s Tern, almost all species of terns that can occur on coast of Gujarat are migratory or resident-migratory.",
    "Offshore gulls, such as the black-legged kittiwake and lesser black-backed gull, have specific life requisites that enable them to thrive in marine environments. These seabirds rely heavily on coastal and offshore habitats for feeding, nesting, and roosting. They are well-adapted to oceanic conditions, feeding primarily on fish, squid, and other marine organisms. Offshore gulls depend on coastal cliffs, islands, or human-made structures for breeding, where they build nests safe from predators. Access to abundant food sources and suitable nesting sites, along with clear airspace for flight, are essential for their survival. Additionally, gulls require clean waters free from pollution, as contamination can affect both their health and the availability of prey. Climate change and habitat disturbance pose significant threats, making the conservation of their marine environment critical for sustaining healthy populations.",
    "The main threats to gulls and terns occurring on in Gujarat’s coast include habitat loss due to coastal development, pollution, and human disturbance. Coastal areas are increasingly being developed for tourism and industrial purposes, leading to the loss of critical feeding and nesting sites. Pollution, particularly marine litter and oil spills, also poses significant risks to gull populations, affecting their health and food availability.",
    "All the gulls occurring in coastal area of the state are categorised globally as Least Concern (LC) as per IUCN Red List of Threatened Species. All the terns mentioned earlier belong to either Least Concern (LC) or Near Threatened (NT) categories of IUCN Red List of Threatened Species.",
    "Gujarat's coastal and offshore areas support a diverse range of gulls and terns, contributing to the region's rich avian biodiversity. These seabirds play essential roles in marine ecosystems and are indicators of environmental health. However, they face significant threats from habitat loss, pollution, and human disturbance. Protecting and conserving their habitats is crucial to ensuring the survival of these species and maintaining the ecological balance of Gujarat's coastal and offshore environments. Continued research and conservation efforts are needed to address these challenges and safeguard the future of gulls and terns in the region.",
  ];
  final List<String> OFFSHORE_GULLS_GUJ = [
    "ગુલ્સ અને ટર્ન એ દરિયાકાંઠાના અને અપતટીય એવિફૌનાના અગ્રણી સભ્યો છે, જે તેમના આકર્ષક દેખાવ અને ગતિશીલ વર્તણૂક માટે જાણીતા છે. આ દરિયાઈ પક્ષીઓ માછલીની વસ્તીને નિયંત્રિત કરવા અને પર્યાવરણીય સ્વાસ્થ્યના સૂચક તરીકે સેવા આપવા સહિત દરિયાઈ જીવસૃષ્ટિમાં નિર્ણાયક ભૂમિકા ભજવે છે. ગુજરાત, તેના વ્યાપક દરિયાકિનારા સાથે. અરબી સમુદ્ર અને કચ્છનો અખાત, વિવિધ પ્રકારના ગુલ અને ટર્ન માટે આવશ્યક વસવાટ પૂરો પાડે છે, આ પ્રદેશ તેની સમૃદ્ધ એવિયન જૈવવિવિધતામાં ફાળો આપે છે.",
    "ગુજરાતના દરિયાકાંઠાના વિસ્તારોમાં ગુલ સામાન્ય રીતે મજબુત શરીર અને લાંબી પાંખોવાળા મધ્યમથી મોટા પક્ષીઓ હોય છે. તેમની પાસે જાડી, સહેજ હૂકવાળી ચાંચ હોય છે, ઘણીવાર પીળી અથવા લાલ હોય છે, જે તેમના વૈવિધ્યસભર આહાર માટે યોગ્ય હોય છે. તેમનો પ્લમેજ સામાન્ય રીતે સફેદ અથવા સફેદ હોય છે. ભૂખરા, પાંખો અને પીઠના ઘાટા રંગના, અને તેઓ ઘણીવાર તેમના નિસ્તેજ શરીર અને ઘાટા ફ્લાઇટ પીંછાઓ વચ્ચે તદ્દન વિપરીત દર્શાવે છે, જે તેમને મજબૂત તરવૈયા બનાવે છે, અને તેમના પગ સામાન્ય રીતે ગુલાબી, પીળા અથવા કાળા હોય છે. કેટલીક પ્રજાતિઓ માથાના વિશિષ્ટ નિશાનો પ્રદર્શિત કરી શકે છે, જે કાળા હૂડ અથવા કેપ્સ વચ્ચે બદલાઈ શકે છે.\nબીજી તરફ, ટર્ન્સ ગુલ કરતાં વધુ પાતળી અને આકર્ષક હોય છે, જેમાં આકર્ષક, સુવ્યવસ્થિત દેખાવ હોય છે અને તેમની પાંખો લાંબી હોય છે પૂંછડી જે તેમની ચપળ ઉડ્ડયનમાં મદદ કરે છે, તે ઘણીવાર માછલી પકડવા માટે તીક્ષ્ણ, પોઈન્ટેડ બીલ ધરાવે છે જે પ્રજાતિના આધારે સામાન્ય રીતે નિસ્તેજ હોય છે, જે વિરોધાભાસી કાળી હોય છે સંવર્ધન સીઝન દરમિયાન તેમના માથા પર ટોપી. ટર્ન્સ તેમની ભવ્ય અને ઉડાઉ ઉડાન માટે જાણીતું છે, ઘણી વખત પાણીની સપાટીને સ્કિમિંગ કરે છે, અને તેમના પગ સામાન્ય રીતે ગુલની તુલનામાં ટૂંકા અને વધુ નાજુક હોય છે.",
    "ગુલ: ગુજરાતમાં, ગુલ સામાન્ય રીતે જોવા મળે છે, ખાસ કરીને શિયાળાની સ્થળાંતર ઋતુમાં. ગુજરાતના દરિયાકાંઠે કેટલાક સામાન્ય ગુલમાં બ્લેક-હેડેડ ગુલ, બ્રાઉન-હેડેડ ગુલ, હ્યુગલિનનો ગુલ, સ્ટેપ ગુલ અને પલ્લાસ ગુલનો સમાવેશ થાય છે. કેટલીક અસામાન્યથી દુર્લભ પ્રજાતિઓનો સમાવેશ થાય છે. સ્લેન્ડર-બિલ્ડ ગુલ (અસામાન્યથી સામાન્ય), મેવ ગુલ (અવગ્રન્ટ), મોંગોલિયન ગુલ (અવગ્રન્ટ), તૈમીર ગુલ (દુર્લભ) અને કેસ્પિયન ગુલ (દુર્લભ) સ્લેન્ડર-બિલ્ડ ગુલ સિવાયના તમામ ગુલ શિયાળાના મુલાકાતીઓ છે જે નિવાસી હોઈ શકે છે અને શિયાળુ મુલાકાતીઓ.\nટર્ન્સ ગુજરાતમાં પણ પ્રમાણમાં સામાન્ય છે, ગુજરાતના દરિયાકાંઠે કેટલીક સામાન્ય ટર્નમાં ગુલ-બિલ્ડ ટર્ન, લેસર ક્રેસ્ટેડ ટર્ન, લિટલ ટર્ન, વિસ્કર્ડ ટર્નનો સમાવેશ થાય છે દુર્લભથી લઈને દુર્લભ ટર્નમાં બ્રિડલ ટર્ન, સૂટી ટર્ન, બ્રાઉન નોડી, બ્લેક નોડી, વ્હાઇટ-વીન્ગ્ડ ટર્ન, સોન્ડર્સ ટર્ન, વ્હાઇટ-ચીક ટર્ન, કોમન ટર્ન, ગ્રેટર ક્રેસ્ટેડ ટર્ન, સેન્ડવિચ ટર્નનો સમાવેશ થાય છે , ગુજરાતના દરિયાકાંઠે ઉદ્ભવતી ટર્ન્સની લગભગ તમામ પ્રજાતિઓ સ્થળાંતરિત અથવા નિવાસી-સ્થળાંતર કરનાર છે.",
    "ઓફશોર ગુલ્સ, જેમ કે કાળા પગવાળા કિટ્ટીવેક અને ઓછા કાળા પીઠવાળા ગુલમાં, ચોક્કસ જીવન જરૂરિયાતો ધરાવે છે જે તેમને દરિયાઈ વાતાવરણમાં ખીલવા માટે સક્ષમ બનાવે છે. આ દરિયાઈ પક્ષીઓ ખોરાક, માળો બાંધવા અને કૂતરાં બાંધવા માટે દરિયાકાંઠાના અને દરિયાકાંઠાના આવાસ પર ખૂબ આધાર રાખે છે. તેઓ દરિયાઈ પરિસ્થિતિઓમાં સારી રીતે અનુકૂળ છે, મુખ્યત્વે માછલી, સ્ક્વિડ અને અન્ય દરિયાઈ જીવોને ખોરાક આપે છે. ઓફશોર ગુલ્સ સંવર્ધન માટે દરિયાકાંઠાના ખડકો, ટાપુઓ અથવા માનવ નિર્મિત માળખા પર આધાર રાખે છે, જ્યાં તેઓ શિકારીથી સુરક્ષિત માળો બાંધે છે. તેમના અસ્તિત્વ માટે વિપુલ પ્રમાણમાં ખાદ્ય સ્ત્રોતો અને યોગ્ય માળખાના સ્થળોની ઍક્સેસ, ફ્લાઇટ માટે સ્પષ્ટ એરસ્પેસ સાથે, તેમના અસ્તિત્વ માટે જરૂરી છે. વધુમાં, ગુલને પ્રદૂષણથી મુક્ત સ્વચ્છ પાણીની જરૂર હોય છે, કારણ કે દૂષણ તેમના સ્વાસ્થ્ય અને શિકારની ઉપલબ્ધતા બંનેને અસર કરી શકે છે. આબોહવા પરિવર્તન અને વસવાટની વિક્ષેપ નોંધપાત્ર જોખમો પેદા કરે છે, જે તંદુરસ્ત વસ્તીને ટકાવી રાખવા માટે તેમના દરિયાઇ પર્યાવરણના સંરક્ષણને મહત્વપૂર્ણ બનાવે છે.",
    "ગુજરાતના દરિયાકાંઠે બનતા ગુલ અને ટર્ન માટેના મુખ્ય જોખમોમાં દરિયાકાંઠાના વિકાસ, પ્રદૂષણ અને માનવ વિક્ષેપને કારણે રહેઠાણની ખોટનો સમાવેશ થાય છે. દરિયાકાંઠાના વિસ્તારો પર્યટન અને ઔદ્યોગિક હેતુઓ માટે વધુને વધુ વિકસિત થઈ રહ્યા છે, જેના કારણે ખોરાક અને માળખાના મહત્વના સ્થળોને નુકસાન થઈ રહ્યું છે. પ્રદૂષણ, ખાસ કરીને દરિયાઈ કચરા અને તેલના ઢોળાવ, ગુલની વસ્તી માટે નોંધપાત્ર જોખમો પણ ઉભો કરે છે, જે તેમના આરોગ્ય અને ખોરાકની ઉપલબ્ધતાને અસર કરે છે.",
    "રાજ્યના દરિયાકાંઠાના વિસ્તારમાં બનતા તમામ ગુલને IUCN રેડ લિસ્ટ મુજબ જોખમી પ્રજાતિઓની વૈશ્વિક સ્તરે ઓછામાં ઓછી ચિંતા (LC) તરીકે વર્ગીકૃત કરવામાં આવી છે. અગાઉ ઉલ્લેખિત તમામ ટર્ન કાં તો ઓછામાં ઓછી ચિંતા (LC) અથવા નજીકના જોખમી (NT) કેટેગરીના છે. જોખમી પ્રજાતિઓની IUCN રેડ લિસ્ટ.",
    "ગુજરાતના દરિયાકાંઠાના અને અપતટીય વિસ્તારો વિવિધ પ્રકારના ગુલ અને ટર્નને ટેકો આપે છે, જે પ્રદેશની સમૃદ્ધ એવિયન જૈવવિવિધતામાં ફાળો આપે છે. આ દરિયાઈ પક્ષીઓ દરિયાઈ જીવસૃષ્ટિમાં આવશ્યક ભૂમિકા ભજવે છે અને પર્યાવરણીય સ્વાસ્થ્યના સૂચક છે. જો કે, તેઓ વસવાટના નુકશાન, પ્રદૂષણ, વગેરેના નોંધપાત્ર જોખમોનો સામનો કરે છે. અને માનવીય ખલેલ આ પ્રજાતિઓના અસ્તિત્વને સુનિશ્ચિત કરવા અને ગુજરાતના દરિયાકાંઠાના અને દરિયાકાંઠાના પર્યાવરણના પર્યાવરણીય સંતુલનને જાળવવા અને આ પડકારોનો સામનો કરવા માટે સતત સંશોધન અને સંરક્ષણ પ્રયાસો જરૂરી છે. પ્રદેશ.",
  ];

  final List<String> SHOREBIRDS = [
    "Gujarat’s extensive coastlines, stretching along the Arabian Sea and the Gulf of Kachchh, provide vital habitats for a diverse array of shorebirds. These birds, which include species from the families of sandpipers, plovers, and avocets, play crucial roles in coastal ecosystems. They are important indicators of environmental health and biodiversity, as their presence and abundance can reflect the quality of their habitats. Gujarat’s varied coastal landscapes, from sandy beaches to mudflats and estuaries, support a range of shorebird species, many of which are migratory, passing through or overwintering in this region.",
    "Sandpipers: The Gujarat coast is home to several species of sandpipers, such as the Common Sandpiper (Actitis hypoleucos), the Dunlin (Calidris alpina), the Curlew Sandpiper (Calidris ferruginea), the Marsh Sandpier (Tringa stagnatilis), the Broad-billed Sandpiper (Calidris falcinellus) and the Terrek Sandpiper (Tringa threek). These sandpipers are typically seen foraging in mudflats and shallow waters, taking advantage of the rich invertebrate communities in these habitats. Species such as the Dunlin and Curlew Sandpiper are seen in large numbers during their migratory seasons, typically from September to March. Gujarat provides critical stopover sites for these birds, which are essential for their long migratory journeys.",
    "Gujarat's shorebird population includes a mix of resident and migratory species. Key shorebirds found along the Gujarat coasts include:\n• Plovers: Notable plovers include the Lesser Sand Plover (Charadrius mongolus), the Greater Sand Plover (Charadrius leschenaultii), Grey Plover (Pluvialis squatarola), Golden Plover (Pluvialis dominica), the Kentish Plover (Charadrius alexandrinus) and Little Ringed Plover (Charadrius dubius).  These species are commonly observed on sandy beaches and estuarine shores, where they feed on small invertebrates and occasionally lay their eggs. These species migrate from their breeding grounds in Central Asia, Siberia, and other northern regions, following the Central Asian Flyway. Resident shorebirds like the Kentish Plover and the Black-winged Stilt are found year-round along Gujarat’s coasts. These species are relatively common and can be seen regularly in appropriate habitats throughout the year.\n• Sandpipers: The Gujarat coast is home to several species of sandpipers, such as the Common Sandpiper (Actitis hypoleucos), the Dunlin (Calidris alpina), the Curlew Sandpiper (Calidris ferruginea), the Marsh Sandpier (Tringa stagnatilis), the Broad-billed Sandpiper (Calidris falcinellus) and the Terrek Sandpiper (Tringa threek). These sandpipers are typically seen foraging in mudflats and shallow waters, taking advantage of the rich invertebrate communities in these habitats. Species such as the Dunlin and Curlew Sandpiper are seen in large numbers during their migratory seasons, typically from September to March. Gujarat provides critical stopover sites for these birds, which are essential for their long migratory journeys.\n• Avocets and Stilts: The Pied Avocet (Recurvirostra avosetta) and the Black-winged Stilt (Himantopus himantopus) are also present along Gujarat's coasts. These birds are typically found in wetlands and shallow water areas, where they use their long legs and bills to probe for food.\n• Godwits: The Bar-tailed Godwit (Limosa lapponica) and the Black-tailed Godwit (Limosa limosa) are known to migrate through Gujarat. They are typically seen in mudflats and estuaries, where they feed on invertebrates. These species travel vast distances from their breeding grounds in the Arctic and northern Europe, following the Central Asian Flyway.",
    "Curlews and Whimbrels: The Eurasian Curlew (Numenius arquata) and the Whimbrel (Numenius phaeopus) are notable for their distinctive long bills and are commonly found in coastal wetlands and estuaries during migration. These species migrate from their breeding grounds in northern Europe and Asia, following the Central Asian Flyway.\n• Oystercatchers: The Eurasian Oystercatcher (Haematopus ostralegus) is occasionally observed along the Gujarat coast, where it forages for mollusks and other marine invertebrates. This species migrates from its breeding grounds in northern Europe and Asia, following coastal routes along the Central Asian Flyway.\n• Turnstones: The Ruddy Turnstone (Arenaria interpres) is frequently seen in Gujarat, particularly on rocky shores and sandy beaches, where it turns over pebbles and debris in search of food. This species follows a long migration route from its Arctic breeding grounds, traveling through various coastal regions worldwide, including Gujarat.\n• Stints: The Little Stint (Calidris minuta) and the Temminck’s Stint (Calidris temminckii) are small shorebirds that migrate through Gujarat, often found in mudflats and shallow lagoons. These birds follow migration pathways from their breeding grounds in the Arctic tundra, traveling southward to wintering areas in Africa, the Middle East, and South Asia.\n• Sanderlings: The Sanderling (Calidris alba) is a small, plump shorebird known for its strikingly pale plumage and black legs. It is often seen scurrying along sandy beaches, following the ebb and flow of waves as it forages for small invertebrates. Sanderlings are long-distance migrants, breeding in the high Arctic and wintering along coastlines worldwide, including in India. Along Gujarat's coast, they are commonly observed running in synchronisation with tides during the winter months, particularly on sandy shores and tidal flats.\n• Shanks (Redshanks and Greenshanks): The Common Redshank (Tringa totanus) and the Common Greenshank (Tringa nebularia) are regularly observed in Gujarat’s wetlands and estuaries, where they feed on insects and small invertebrates. These species migrate from their breeding grounds in Europe and Asia, traveling along the Central Asian Flyway to reach their wintering sites.\n• Knot: Some shorebird species are less common in Gujarat. For example, the Great Knot (Calidris tenuirostris), which occasionally visits Gujarat, is considered near-threatened globally. The Great Knot migrates from its breeding grounds in the Arctic, traveling along the East Asia-Australasia Flyway.",
    "One of the most significant threats to shorebirds in Gujarat is habitat loss due to coastal development. Expansion of urban areas, industrialization, and tourism development along the coast reduce the availability of critical feeding and nesting sites. This is particularly concerning for species that rely on specific types of coastal habitats.\n• Pollution, including oil spills, plastic waste, and chemical runoff, affects shorebird health and food availability. Contaminants can poison shorebirds directly or degrade the quality of their food sources, leading to declines in bird populations.\nHuman Disturbance: Increased human activity along coastlines, including recreational activities and fishing, can disturb shorebirds and disrupt their feeding and breeding behaviours. Nesting sites can be abandoned due to disturbances, leading to reduced reproductive success.\n• Climate change poses a long-term threat to shorebirds by altering their habitats and food availability. Rising sea levels, changing temperatures, and increased frequency of extreme weather events can impact coastal ecosystems and the species that depend on them.",
    "Pollution, including oil spills, plastic waste, and chemical runoff, affects shorebird health and food availability. Contaminants can poison shorebirds directly or degrade the quality of their food sources, leading to declines in bird populations.",
    "Human Disturbance: Increased human activity along coastlines, including recreational activities and fishing, can disturb shorebirds and disrupt their feeding and breeding behaviours. Nesting sites can be abandoned due to disturbances, leading to reduced reproductive success.• Climate change poses a long-term threat to shorebirds by altering their habitats and food availability. Rising sea levels, changing temperatures, and increased frequency of extreme weather events can impact coastal ecosystems and the species that depend on them.",
    "Gujarat's coasts are crucial for a variety of shorebird species, providing essential habitats for both resident and migratory birds. The region’s diverse coastal environments support a range of shorebirds that contribute to the ecological richness of the area. However, these birds face significant threats from habitat loss, pollution, human disturbance, and climate change. Effective conservation measures are needed to protect these critical habitats and ensure the continued presence of shorebirds along Gujarat's coasts. By addressing these challenges and fostering a deeper understanding of shorebird ecology, we can work towards safeguarding the future of these remarkable avian residents and migrants."
  ];

  final List<String> SHOREBIRDS_GUJ = [
    "ગુજરાતની વ્યાપક દરિયાકિનારો, અરબી સમુદ્ર અને કચ્છના અખાતમાં વિસ્તરેલો, વિવિધ પ્રકારના કિનારાના પક્ષીઓ માટે મહત્વપૂર્ણ રહેઠાણો પૂરો પાડે છે. આ પક્ષીઓ, જેમાં સેન્ડપાઈપર્સ, પ્લવર્સ અને એવોકેટ્સના પરિવારોની પ્રજાતિઓનો સમાવેશ થાય છે, તે દરિયાકાંઠાના ઇકોસિસ્ટમમાં નિર્ણાયક ભૂમિકા ભજવે છે. તેઓ પર્યાવરણીય સ્વાસ્થ્ય અને જૈવવિવિધતાના મહત્વપૂર્ણ સૂચક છે, કારણ કે તેમની હાજરી અને વિપુલતા તેમના નિવાસસ્થાનોની ગુણવત્તાને પ્રતિબિંબિત કરી શકે છે, રેતાળ દરિયાકિનારાથી લઈને કાદવ-કચરા અને નદીમુખો સુધી, દરિયાકિનારાની ઘણી પ્રજાતિઓને ટેકો આપે છે, જેમાંથી ઘણા સ્થળાંતર કરે છે. આ પ્રદેશમાં શિયાળો પસાર થઈ રહ્યો છે.",
    "સેન્ડપાઈપર્સ: ગુજરાતનો દરિયાકિનારો સેન્ડપાઈપરની ઘણી પ્રજાતિઓનું ઘર છે, જેમ કે કોમન સેન્ડપાઈપર (એક્ટીટીસ હાઈપોલ્યુકોસ), ડનલિન (કેલિડ્રિસ અલ્પિના), કર્લ્યુ સેન્ડપાઈપર (કેલિડ્રિસ ફેરુગિનીયા), માર્શ સેન્ડપિયર (ટ્રિંગા સ્ટેગ્નાટિલિસ), બ્રોડ-પાઈપર. બિલ્ડ સેન્ડપાઈપર (કેલિડ્રિસ ફાલ્સિનેલસ) અને ટેરેક સેન્ડપાઈપર (ત્રિંગા થ્રીક) સામાન્ય રીતે માટીના ફ્લેટ અને છીછરા પાણીમાં ચારો લેતા જોવા મળે છે, આ વસવાટોમાં સમૃદ્ધ અપૃષ્ઠવંશી સમુદાયોનો લાભ લે છે જેમ કે ડનલિન અને કર્લ્યુ સેન્ડપાઈપર તેમની સ્થળાંતર ઋતુઓ દરમિયાન, ખાસ કરીને સપ્ટેમ્બરથી માર્ચ સુધી ગુજરાત આ પક્ષીઓ માટે નિર્ણાયક સ્ટોપઓવર સાઇટ્સ પ્રદાન કરે છે, જે તેમના લાંબા સ્થળાંતર પ્રવાસ માટે જરૂરી છે.",
    "ગુજરાતની કિનારાની પક્ષીઓની વસ્તીમાં નિવાસી અને સ્થળાંતરીત પ્રજાતિઓના મિશ્રણનો સમાવેશ થાય છે. ગુજરાતના દરિયાકાંઠે જોવા મળતા મુખ્ય કિનારાના પક્ષીઓનો સમાવેશ થાય છે:\n• પ્લવર્સ: નોંધપાત્ર પ્લોવર્સમાં લેસર સેન્ડ પ્લોવર (કેરાડ્રિયસ મોંગોલસ), ગ્રેટર સેન્ડ પ્લોવર (ચેરાડ્રિયસ લેશેનોલ્ટી), ગ્રે પ્લોવરનો સમાવેશ થાય છે. (Pluvialis squatarola), ગોલ્ડન પ્લોવર (Pluvialis dominica), ધ કેન્ટિશ પ્લોવર (Charadrius alexandrinus) અને લિટલ રીંગ્ડ પ્લોવર (Charadrius dubius) આ પ્રજાતિઓ સામાન્ય રીતે રેતાળ દરિયાકિનારા અને નદીના કિનારા પર જોવા મળે છે, જ્યાં તેઓ તેમના નાના અપૃષ્ઠવંશી પ્રાણીઓને ખવડાવે છે. આ પ્રજાતિઓ મધ્ય એશિયા, સાઇબિરીયા અને અન્ય ઉત્તરીય પ્રદેશોમાંથી સ્થળાંતર કરે છે પ્રમાણમાં સામાન્ય છે અને આખા વર્ષ દરમિયાન યોગ્ય રહેઠાણોમાં નિયમિતપણે જોઈ શકાય છે.\n• સેન્ડપાઈપર્સ: ગુજરાતનો દરિયાકિનારો સેન્ડપાઈપરની ઘણી પ્રજાતિઓનું ઘર છે, જેમ કે સામાન્ય સેન્ડપાઈપર (એક્ટિટિસ હાઈપોલ્યુકોસ), ડનલિન (કેલિડ્રિસ આલ્પિના), કર્લ્યુ સેન્ડપાઈપર (કેલિડ્રિસ ફેરુગિનીયા), માર્શ સેન્ડપિયર (ટ્રિંગા સ્ટેગ્નાટિલિસ), બ્રોડ-બિલ્ડ સેન્ડપાઇપર (કેલિડ્રિસ ફાલ્સિનેલસ) અને ટેરેક સેન્ડપાઇપર (ટ્રિંગા થ્રીક). આ સેન્ડપાઈપર્સ સામાન્ય રીતે કાદવના ફ્લેટ અને છીછરા પાણીમાં ઘાસચારો કરતા જોવા મળે છે, આ વસવાટોમાં સમૃદ્ધ અપૃષ્ઠવંશી સમુદાયોનો લાભ લે છે. ડનલિન અને કર્લ્યુ સેન્ડપાઇપર જેવી પ્રજાતિઓ તેમની સ્થળાંતર ઋતુઓ દરમિયાન, ખાસ કરીને સપ્ટેમ્બરથી માર્ચ દરમિયાન મોટી સંખ્યામાં જોવા મળે છે. ગુજરાત આ પક્ષીઓ માટે નિર્ણાયક સ્ટોપઓવર સાઇટ્સ પ્રદાન કરે છે, જે તેમના લાંબા સ્થળાંતર પ્રવાસ માટે જરૂરી છે.\n• એવોસેટ્સ અને સ્ટિલ્ટ્સ: ધ પાઈડ એવોસેટ (રિકરવિરોસ્ટ્રા એવોસેટા) અને બ્લેક-પાંખવાળા સ્ટિલ્ટ (હિમન્ટોપસ હિમન્ટોપસ) પણ ગુજરાતના દરિયાકિનારા પર હાજર છે. આ પક્ષીઓ સામાન્ય રીતે ભેજવાળી જમીન અને છીછરા પાણીના વિસ્તારોમાં જોવા મળે છે, જ્યાં તેઓ ખોરાકની તપાસ માટે તેમના લાંબા પગ અને બીલનો ઉપયોગ કરે છે.\n• ગોડવિટ્સ: બાર-ટેલ્ડ ગોડવિટ (લિમોસા લેપોનિકા) અને બ્લેક-ટેલ્ડ ગોડવિટ (લિમોસા લિમોસા) છે. ગુજરાતમાંથી સ્થળાંતર કરવા માટે જાણીતા છે. તેઓ સામાન્ય રીતે મડફ્લેટ્સ અને નદીમુખોમાં જોવા મળે છે, જ્યાં તેઓ અપૃષ્ઠવંશી પ્રાણીઓને ખવડાવે છે. આ પ્રજાતિઓ મધ્ય એશિયાઈ ફ્લાયવેને અનુસરીને આર્ક્ટિક અને ઉત્તર યુરોપમાં તેમના સંવર્ધન સ્થાનોથી વિશાળ અંતરની મુસાફરી કરે છે.",
    "કર્લ્યુઝ અને વ્હિમ્બ્રેલ્સ: યુરેશિયન કર્લ્યુ (ન્યુમેનિયસ આર્ક્વાટા) અને વ્હિમ્બ્રેલ (ન્યુમેનિયસ ફેઓપસ) તેમના વિશિષ્ટ લાંબા બીલ માટે નોંધપાત્ર છે અને સામાન્ય રીતે સ્થળાંતર દરમિયાન દરિયાકાંઠાના ભેજવાળી જમીનો અને નદીમુખોમાં જોવા મળે છે. આ પ્રજાતિઓ ઉત્તર એશિયા અને યુરોપમાં તેમના પ્રજનન ભૂમિમાંથી સ્થળાંતર કરે છે. , સેન્ટ્રલ એશિયન ફ્લાયવેને અનુસરે છે.\n• ઓઇસ્ટરકેચર: યુરેશિયન ઓઇસ્ટરકેચર (હેમેટોપસ ઓસ્ટ્રેલેગસ) ક્યારેક ક્યારેક ગુજરાતના દરિયાકાંઠે જોવા મળે છે, જ્યાં તે મોલસ્ક અને અન્ય દરિયાઇ અપૃષ્ઠવંશી પ્રાણીઓ માટે ઘાસચારો કરે છે. મધ્ય એશિયન ફ્લાયવે સાથે દરિયાકાંઠાના માર્ગો.\n• ટર્નસ્ટોન્સ: રડી ટર્નસ્ટોન (એરેનારિયા ઇન્ટરપ્રેઝ) ગુજરાતમાં વારંવાર જોવા મળે છે, ખાસ કરીને ખડકાળ કિનારાઓ અને રેતાળ દરિયાકિનારા પર, જ્યાં તે ખોરાકની શોધમાં કાંકરા અને કાટમાળને ફેરવે છે તેના આર્કટિક સંવર્ધન ભૂમિમાંથી એક લાંબો સ્થળાંતર માર્ગ, ગુજરાત સહિત વિશ્વભરના વિવિધ દરિયાકાંઠાના પ્રદેશોમાંથી પસાર થાય છે.\n• સ્ટિંટ્સ: ધ લિટલ સ્ટંટ (કેલિડ્રિસ મિનુટા) અને ટેમ્મિંક્સ સ્ટંટ (કેલિડ્રિસ ટેમિંકી) એ નાના કિનારાના પક્ષીઓ છે જે ગુજરાતમાંથી સ્થળાંતર કરે છે, ઘણીવાર જોવા મળે છે. મડફ્લેટ અને છીછરા લગૂનમાં. આ પક્ષીઓ આર્ક્ટિક ટુંડ્રમાં તેમના સંવર્ધન સ્થાનોમાંથી સ્થળાંતર માર્ગને અનુસરે છે, આફ્રિકા, મધ્ય પૂર્વ અને દક્ષિણ એશિયામાં શિયાળાના વિસ્તારોમાં દક્ષિણ તરફ પ્રવાસ કરે છે.\n• સેન્ડરલિંગ: સેન્ડરલિંગ (કેલિડ્રિસ આલ્બા) એક નાનું, ભરાવદાર કિનારાનું પક્ષી છે જે તેના માટે જાણીતું છે. આઘાતજનક રીતે નિસ્તેજ પ્લમેજ અને કાળા પગ. તે મોટાભાગે રેતાળ દરિયાકિનારા પર ભટકતા જોવા મળે છે, તરંગોના પ્રવાહને પગલે તે નાના અપૃષ્ઠવંશી પ્રાણીઓ માટે ચારો બનાવે છે. સેન્ડરલિંગ લાંબા અંતરના સ્થળાંતર કરનારાઓ છે, જે ઉચ્ચ આર્કટિકમાં પ્રજનન કરે છે અને ભારત સહિત વિશ્વભરમાં દરિયાકિનારા પર શિયાળામાં રહે છે. ગુજરાતના દરિયાકાંઠે, તેઓ સામાન્ય રીતે શિયાળાના મહિનાઓમાં ભરતી સાથે સુમેળમાં દોડતા જોવા મળે છે, ખાસ કરીને રેતાળ કિનારાઓ અને ભરતીના સપાટ પર.\n• શૅંક્સ (રેડશેંક્સ અને ગ્રીનશૅંક્સ): કૉમન રેડશેંક (ટ્રિંગા ટોટેનસ) અને કૉમન ગ્રીનશૅન્ક (ટ્રિંગા નેબ્યુલેરિયા) ) ગુજરાતની ભીની જમીનો અને નદીમુખોમાં નિયમિતપણે જોવા મળે છે, જ્યાં તેઓ જંતુઓ અને નાના અપૃષ્ઠવંશી પ્રાણીઓને ખવડાવે છે. આ પ્રજાતિઓ યુરોપ અને એશિયામાં તેમના સંવર્ધન સ્થાનોમાંથી સ્થળાંતર કરે છે, મધ્ય એશિયન ફ્લાયવે સાથે મુસાફરી કરીને તેમની શિયાળાની જગ્યાઓ સુધી પહોંચે છે.\n• નોટ: ગુજરાતમાં શોરબર્ડની કેટલીક પ્રજાતિઓ ઓછી જોવા મળે છે. ઉદાહરણ તરીકે, ગ્રેટ નોટ (કેલિડ્રિસ ટેનુરોસ્ટ્રિસ), જે અવારનવાર ગુજરાતની મુલાકાત લે છે, તેને વૈશ્વિક સ્તરે નજીકના જોખમમાં ગણવામાં આવે છે. ધ ગ્રેટ નોટ આર્કટિકમાં તેના સંવર્ધન સ્થાનોમાંથી સ્થળાંતર કરે છે, પૂર્વ એશિયા-ઓસ્ટ્રેલિયા ફ્લાયવે સાથે મુસાફરી કરે છે.",
    "• ગુજરાતમાં દરિયાકાંઠાના પક્ષીઓ માટેના સૌથી નોંધપાત્ર જોખમોમાંનું એક દરિયાકાંઠાના વિકાસને કારણે વસવાટનું નુકસાન છે. દરિયાકાંઠે શહેરી વિસ્તારોના વિસ્તરણ, ઔદ્યોગિકીકરણ અને પ્રવાસન વિકાસને લીધે મહત્વપૂર્ણ ખોરાક અને માળાઓની ઉપલબ્ધતામાં ઘટાડો થાય છે. આ ખાસ કરીને પ્રજાતિઓ માટે ચિંતાજનક છે. ચોક્કસ પ્રકારના દરિયાકાંઠાના રહેઠાણો પર આધાર રાખે છે.\n• પ્રદૂષણ, જેમાં ઓઈલ સ્પીલ, પ્લાસ્ટિકનો કચરો અને રાસાયણિક વહેણનો સમાવેશ થાય છે, તે કિનારાના પક્ષીઓના સ્વાસ્થ્ય અને ખોરાકની ઉપલબ્ધતાને અસર કરે છે અથવા દૂષકો સીધા જ કિનારાના પક્ષીઓને ઝેર આપી શકે છે અથવા તેમના ખાદ્ય સ્ત્રોતોની ગુણવત્તાને બગાડે છે, જેનાથી પક્ષીઓમાં ઘટાડો થાય છે. વસ્તી.\nમાનવ વિક્ષેપ: દરિયાકાંઠે વધતી માનવ પ્રવૃત્તિ, જેમાં મનોરંજનની પ્રવૃત્તિઓ અને માછીમારીનો સમાવેશ થાય છે, તે કિનારાના પક્ષીઓને ખલેલ પહોંચાડી શકે છે અને તેમના ખોરાક અને સંવર્ધનની વર્તણૂકને વિક્ષેપિત કરી શકે છે, જે વિક્ષેપને કારણે માળો બનાવવાની જગ્યાઓ છોડી શકે છે. દરિયાકાંઠાના પક્ષીઓ માટે તેમના રહેઠાણો અને ખોરાકની ઉપલબ્ધતામાં ફેરફાર કરીને, તાપમાનમાં ફેરફાર અને આત્યંતિક હવામાનની ઘટનાઓની વધતી જતી આવર્તન દરિયાકાંઠાની જીવસૃષ્ટિ અને તેના પર નિર્ભર રહેતી પ્રજાતિઓને અસર કરી શકે છે.",
    "માનવીય ખલેલ: દરિયાકિનારા પર માનવીય પ્રવૃત્તિમાં વધારો, જેમાં મનોરંજનની પ્રવૃત્તિઓ અને માછીમારીનો સમાવેશ થાય છે, તે કિનારાના પક્ષીઓને ખલેલ પહોંચાડી શકે છે અને તેમના ખોરાક અને સંવર્ધનની વર્તણૂકને વિક્ષેપિત કરી શકે છે. ખલેલને કારણે માળો બાંધવાની જગ્યાઓ છોડી શકાય છે, જે પ્રજનનક્ષમ સફળતામાં ઘટાડો તરફ દોરી જાય છે. • આબોહવા પરિવર્તન તેમના રહેઠાણો અને ખોરાકની ઉપલબ્ધતામાં ફેરફાર કરીને કિનારાના પક્ષીઓ માટે લાંબા ગાળાનો ખતરો ઉભો કરે છે. દરિયાના સ્તરમાં વધારો, બદલાતા તાપમાન અને આત્યંતિક હવામાનની ઘટનાઓની વધેલી આવર્તન દરિયાકાંઠાની ઇકોસિસ્ટમ્સ અને તેના પર આધાર રાખતી પ્રજાતિઓને અસર કરી શકે છે.",
    "ગુજરાતનો દરિયાકિનારો વિવિધ પ્રકારની કિનારાની પક્ષીઓની પ્રજાતિઓ માટે નિર્ણાયક છે, જે નિવાસી અને સ્થળાંતર કરનારા પક્ષીઓ બંને માટે આવશ્યક આવાસ પૂરો પાડે છે. આ પ્રદેશનું વૈવિધ્યસભર દરિયાકાંઠાનું વાતાવરણ કિનારાના પક્ષીઓની શ્રેણીને સમર્થન આપે છે જે વિસ્તારની ઇકોલોજીકલ સમૃદ્ધિમાં ફાળો આપે છે. જો કે, આ પક્ષીઓ નોંધપાત્ર જોખમોનો સામનો કરે છે. આ નિર્ણાયક રહેઠાણોને સુરક્ષિત રાખવા અને કિનારાના પક્ષીઓની સતત હાજરીને સુનિશ્ચિત કરવા માટે વસવાટનું નુકશાન, પ્રદૂષણ, માનવીય વિક્ષેપ અને આબોહવા પરિવર્તનની જરૂર છે. આ નોંધપાત્ર એવિયન રહેવાસીઓ અને સ્થળાંતર કરનારાઓના ભવિષ્યની સુરક્ષા."
  ];
  final List<String> WHALE_SHARK = [
    "The Whale Shark (Rhincodon typus) is the largest species of shark and the largest living fish, renowned for its gentle nature and impressive size. Despite its enormity, the Whale Shark poses no threat to humans, as it primarily feeds on plankton and small fish. Its distinctive pattern of spots and stripes makes it a favourite among marine enthusiasts. In India, Whale Sharks are known to frequent several coastal regions, including Gujarat, where they are observed particularly around Veraval and the Saurashtra region. This note explores the occurrence of Whale Sharks in Gujarat, their behaviours, and conservation concerns.",
    "Gujarat, with its extensive coastline along the Arabian Sea, provides an essential habitat for the Whale Shark. The region around Veraval, a port town in Saurashtra, is particularly significant for sightings of this majestic creature. Whale Sharks are known to undertake long migratory journeys, and the Veraval coast lies along a migratory route that these sharks follow in the Indian Ocean. The region’s coastal waters provide a resting and feeding stopover for Whale Sharks during their migrations. The sea surface temperature and oceanographic conditions around Veraval are conducive to Whale Sharks. The relatively warm waters in this region, coupled with favourable currents, create an environment that is both comfortable for the species and supportive of their prey. The Veraval coast, like much of the Saurashtra region, experiences significant upwelling during and after the monsoon season. This upwelling brings nutrient-rich water from the deep sea to the surface, leading to plankton blooms. Whale Sharks, being filter feeders that primarily consume plankton, are attracted to these areas with abundant food sources.",
    "Whale Sharks are typically sighted in Gujarat’s waters from September to April, with peak sightings often occurring between November and March. During this period, the productivity of the marine environment, driven by the monsoon and associated upwelling, supports the high abundance of plankton and small fish that Whale Sharks feed on.",
    "In recent years, there have been numerous documented sightings of Whale Sharks near Veraval and in other parts of the Saurashtra region. The Gujarat Maritime Board and local marine conservation groups have reported several instances of Whale Sharks being seen by local fishermen and during dedicated marine wildlife surveys. The presence of Whale Sharks in these waters has garnered attention from conservationists and marine researchers, highlighting the ecological importance of the region.",
    "Feeding Habits: Whale Sharks are filter feeders, utilizing their gill rakers to sieve plankton, small fish, and other microscopic organisms from the water. They often feed by slowly swimming with their mouths open, allowing water to pass through their gills while trapping their prey. This feeding strategy is highly effective in nutrient-rich waters, which is why regions with high plankton concentrations, such as those around Veraval, are attractive to them.\nReproductive Behaviour\nWhale Sharks are ovoviviparous, meaning they give birth to live young that develop from eggs retained within the mother’s body. Observations of mating and birthing behaviors in the wild are rare due to the deep and often inaccessible waters where these events likely occur. However, the presence of young Whale Sharks in Gujarat's waters indicates successful reproduction in the region.\nMigration Patterns\nWhale Sharks are known for their extensive migratory behaviour, traveling thousands of kilometres across oceans in search of food and suitable breeding grounds. The migration patterns of Whale Sharks are influenced by oceanographic conditions, such as sea surface temperatures and plankton blooms.",
    "Whale Sharks face several threats globally, including bycatch in commercial fishing operations, habitat degradation, and marine pollution. In Gujarat, the primary threat comes from accidental entanglement in fishing gear, such as gillnets and trawl nets. As Whale Sharks are often caught unintentionally during fishing operations, this incidental catch poses a significant risk to their populations.",
    "Whale Shark is listed on the International Union for Conservation of Nature (IUCN) Red List as \"Endangered\"(EN) reflecting its vulnerability to extinction. In India, Whale Sharks are protected under the Wildlife Protection Act of 1972, and their capture and trade are illegal. Conservation measures in Gujarat aim to enforce these protections and promote sustainable fishing practices.\nVarious conservation initiatives are in place to protect Whale Sharks in Gujarat. These include monitoring programs to track sightings, awareness campaigns to educate local fishermen about the importance of Whale Sharks and how to avoid accidental catches, and efforts to establish Marine Protected Areas (MPAs) that safeguard critical habitats.",
  ];

  final List<String> WHALE_SHARK_GUJ = [
    "વ્હેલ શાર્ક (રિનકોડોન ટાઈપસ) એ શાર્કની સૌથી મોટી પ્રજાતિ અને સૌથી મોટી જીવંત માછલી છે, જે તેના સૌમ્ય સ્વભાવ અને પ્રભાવશાળી કદ માટે જાણીતી છે. તેની વિશાળતા હોવા છતાં, વ્હેલ શાર્ક મનુષ્યો માટે કોઈ ખતરો નથી, કારણ કે તે મુખ્યત્વે પ્લાન્કટોન અને નાના પ્રાણીઓને ખવડાવે છે. તેની વિશિષ્ટ પેટર્ન અને પટ્ટાઓ તેને દરિયાઈ ઉત્સાહીઓમાં પ્રિય બનાવે છે, જેમાં ગુજરાત સહિત અનેક દરિયાકાંઠાના પ્રદેશો જોવા મળે છે, જ્યાં તેઓ ખાસ કરીને વેરાવળ અને સૌરાષ્ટ્ર વિસ્તારમાં જોવા મળે છે ગુજરાતમાં વ્હેલ શાર્ક, તેમના વર્તન અને સંરક્ષણની ચિંતાઓ.",
    "ગુજરાત, અરબી સમુદ્ર સાથે તેના વ્યાપક દરિયાકિનારા સાથે, વ્હેલ શાર્ક માટે આવશ્યક નિવાસસ્થાન પૂરો પાડે છે. સૌરાષ્ટ્રના બંદર શહેર વેરાવળની આસપાસનો વિસ્તાર આ ભવ્ય પ્રાણીને જોવા માટે ખાસ કરીને નોંધપાત્ર છે. વ્હેલ શાર્ક લાંબા સમય સુધી સ્થળાંતર કરવા માટે જાણીતી છે. પ્રવાસ, અને વેરાવળનો દરિયાકિનારો હિંદ મહાસાગરમાં આ શાર્ક અનુસરે છે તે સ્થળાંતર દરમિયાન વ્હેલ શાર્કને આરામ અને ખોરાક આપવા માટેનો માર્ગ પૂરો પાડે છે આ પ્રદેશમાં સાનુકૂળ પ્રવાહો સાથે પ્રમાણમાં ગરમ ​​પાણી, સૌરાષ્ટ્રના મોટા ભાગની જેમ વેરાવળના દરિયાકાંઠે પણ ચોમાસા દરમિયાન અને પછી નોંધપાત્ર ઉછાળો અનુભવે છે તેવું વાતાવરણ બનાવે છે. આ મોસમ ઊંડા સમુદ્રમાંથી પોષક તત્ત્વોથી ભરપૂર પાણીને સપાટી પર લાવે છે, જે પ્લાન્કટોન મોર તરફ દોરી જાય છે. વ્હેલ શાર્ક, ફિલ્ટર ફીડર હોવાને કારણે જે મુખ્યત્વે પ્લાન્કટોનનો વપરાશ કરે છે, વિપુલ પ્રમાણમાં ખાદ્ય સ્ત્રોતો ધરાવતા આ વિસ્તારો તરફ આકર્ષાય છે.",
    "વ્હેલ શાર્ક સામાન્ય રીતે ગુજરાતના પાણીમાં સપ્ટેમ્બરથી એપ્રિલ દરમિયાન જોવા મળે છે, જેમાં ટોચના સ્થળો નવેમ્બર અને માર્ચની વચ્ચે જોવા મળે છે. આ સમયગાળા દરમિયાન, દરિયાઈ પર્યાવરણની ઉત્પાદકતા, ચોમાસા અને તેની સાથે સંકળાયેલ ઉન્નતિ, પ્લાન્કટોનની ઉચ્ચ વિપુલતાને સમર્થન આપે છે. નાની માછલી જેને વ્હેલ શાર્ક ખવડાવે છે.",
    "તાજેતરના વર્ષોમાં, વેરાવળ નજીક અને સૌરાષ્ટ્ર વિસ્તારના અન્ય ભાગોમાં વ્હેલ શાર્કના અસંખ્ય દસ્તાવેજીકૃત દૃશ્યો જોવા મળ્યા છે. ગુજરાત મેરીટાઇમ બોર્ડ અને સ્થાનિક દરિયાઈ સંરક્ષણ જૂથોએ સ્થાનિક માછીમારો દ્વારા અને સમર્પિત દરિયાઈ દરમિયાન વ્હેલ શાર્કને જોવાના ઘણા કિસ્સા નોંધાયા છે. વન્યજીવન સર્વેક્ષણો આ પાણીમાં વ્હેલ શાર્કની હાજરીએ સંરક્ષણવાદીઓ અને દરિયાઈ સંશોધકોનું ધ્યાન આકર્ષિત કર્યું છે, જે પ્રદેશના પર્યાવરણીય મહત્વને પ્રકાશિત કરે છે.",
    "ખોરાકની આદતો: વ્હેલ શાર્ક ફિલ્ટર ફીડર છે, જે પાણીમાંથી પ્લાન્કટોન, નાની માછલીઓ અને અન્ય સૂક્ષ્મ જીવોને ચાળવા માટે તેમના ગિલ રેકરનો ઉપયોગ કરે છે. તેઓ વારંવાર તેમના મોં ખુલ્લા રાખીને ધીમે ધીમે તરીને ખોરાક લે છે, જ્યારે તેમની જાળમાં પાણીને તેમના ગિલ્સમાંથી પસાર થવા દે છે. આ ખોરાકની વ્યૂહરચના પોષક તત્ત્વોથી ભરપૂર પાણીમાં અત્યંત અસરકારક છે, તેથી જ વેરાવળની આસપાસના વિસ્તારો, જેમ કે ઉચ્ચ પ્લાન્કટોન સાંદ્રતા ધરાવતા પ્રદેશો તેમના માટે આકર્ષક છે. જે માતાના શરીરમાં જાળવવામાં આવેલા ઇંડામાંથી વિકાસ પામે છે તે ઊંડા અને ઘણીવાર દુર્ગમ પાણીના કારણે જોવા મળે છે, જો કે, ગુજરાતના પાણીમાં યુવાન વ્હેલ શાર્કની હાજરી સફળ પ્રજનન સૂચવે છે પ્રદેશ.\nસ્થળાંતર પેટર્ન\nવ્હેલ શાર્ક તેમના વ્યાપક સ્થળાંતર વર્તણૂક માટે જાણીતી છે, ખોરાક અને યોગ્ય સંવર્ધન સ્થળની શોધમાં હજારો કિલોમીટર સમુદ્રમાં મુસાફરી કરે છે. વ્હેલ શાર્કની સ્થળાંતર પેટર્ન દરિયાની સપાટીના તાપમાન અને પ્લાન્કટોન મોર જેવી સમુદ્રશાસ્ત્રીય પરિસ્થિતિઓથી પ્રભાવિત છે.",
    "વ્હેલ શાર્કને વૈશ્વિક સ્તરે અનેક જોખમોનો સામનો કરવો પડે છે, જેમાં વાણિજ્યિક માછીમારીની કામગીરીમાં બાયકેચ, રહેઠાણનું અધોગતિ અને દરિયાઈ પ્રદૂષણનો સમાવેશ થાય છે. ગુજરાતમાં, પ્રાથમિક ખતરો માછીમારીના ગિયરમાં આકસ્મિક ફસાઈ જવાથી આવે છે, જેમ કે ગિલનેટ અને ટ્રોલ નેટ્સ. કારણ કે વ્હેલ શાર્ક ઘણીવાર અજાણતાં પકડાય છે. માછીમારીની કામગીરી દરમિયાન, આ આકસ્મિક કેચ તેમની વસ્તી માટે નોંધપાત્ર જોખમ ઊભું કરે છે.",
    "વ્હેલ શાર્કને ઈન્ટરનેશનલ યુનિયન ફોર કન્ઝર્વેશન ઓફ નેચર (IUCN)ની લાલ યાદીમાં \"એન્ડેન્જર્ડ\"(EN) તરીકે સૂચિબદ્ધ કરવામાં આવી છે જે તેની લુપ્ત થવાની નબળાઈને પ્રતિબિંબિત કરે છે. ભારતમાં, વ્હેલ શાર્ક 1972ના વન્યજીવ સંરક્ષણ અધિનિયમ હેઠળ સંરક્ષિત છે, અને તેમની ગુજરાતમાં કબજે કરવા અને વેપાર કરવા માટેના સંરક્ષણ પગલાંનો હેતુ આ સંરક્ષણોને લાગુ કરવાનો અને ટકાઉ માછીમારી પ્રથાઓને પ્રોત્સાહન આપવાનો છે વ્હેલ શાર્કનું મહત્વ અને આકસ્મિક કેચથી કેવી રીતે બચવું, અને નિર્ણાયક રહેઠાણોને સુરક્ષિત રાખતા મરીન પ્રોટેક્ટેડ એરિયાઝ (એમપીએ) સ્થાપિત કરવાના પ્રયાસો.",
  ];
  @override
  void initState() {
    super.initState();
    name = widget.title;
    if (name == 'HUMPBACK DOLPHIN') {
      hey = Dolphin;
      carouselImages = [
        'assets/images/new-image/dolphine1.jpg',
        'assets/images/new-image/dolphine2.jpg',
        'assets/images/new-image/dolphine3.jpg'
      ];
    }
    if (name == 'હમ્પબેક ડોલ્ફિન') {
      hey = Dolphin_guj;
      carouselImages = [
        'assets/images/new-image/dolphine1.jpg',
        'assets/images/new-image/dolphine2.jpg',
        'assets/images/new-image/dolphine3.jpg'
      ];
    } else if (name == "FINLESS PORPOISE") {
      hey = FINLESS_PORPOISE;
      carouselImages = [
        'assets/images/new-image/porpoise1.jpg',
        'assets/images/new-image/porpoise2.jpg',
        'assets/images/new-image/porpoise3.jpg'
      ];
    } else if (name == 'ફિનલેસ્સ પોર્પોઈસે') {
      hey = FINLESS_PORPOISE_guj;
      carouselImages = [
        'assets/images/new-image/porpoise1.jpg',
        'assets/images/new-image/porpoise2.jpg',
        'assets/images/new-image/porpoise3.jpg'
      ];
    } else if (name == "BLUE WHALE") {
      hey = BLUE_WHALE;
      carouselImages = [
        'assets/images/new-image/bluewhale1.jpg',
        'assets/images/new-image/bluewhale2.jpg',
        'assets/images/new-image/bluewhale3.jpg',
      ];
    } else if (name == 'બ્લુ વ્હેલ') {
      hey = BLUE_WHALE_GUJ;
      carouselImages = [
        'assets/images/new-image/bluewhale1.jpg',
        'assets/images/new-image/bluewhale2.jpg',
        'assets/images/new-image/bluewhale3.jpg'
      ];
    } else if (name == "KILLER WHALE") {
      hey = KILLER_WHALE;
      carouselImages = [
        'assets/images/new-image/killerwhale1.jpg',
        'assets/images/new-image/killerwhale2.jpg',
        'assets/images/new-image/killlerwhale3.jpg'
      ];
    } else if (name == 'કિલર વ્હેલ') {
      hey = KILLER_WHALE_GUJ;
      carouselImages = [
        'assets/images/new-image/killerwhale1.jpg',
        'assets/images/new-image/killerwhale2.jpg',
        'assets/images/new-image/killlerwhale3.jpg'
      ];
    } else if (name == "Green Sea Turtle") {
      hey = GREEN_TURTLE;
      carouselImages = [
        'assets/images/new-image/greenturtle1.jpg',
        'assets/images/new-image/greenturtle2.jpg',
        'assets/images/new-image/greenturtle3.jpg'
      ];
    } else if (name == 'ગ્રીન સી ટર્ટલ') {
      hey = GREEN_TURTLE_GUJ;
      carouselImages = [
        'assets/images/new-image/greenturtle1.jpg',
        'assets/images/new-image/greenturtle2.jpg',
        'assets/images/new-image/greenturtle3.jpg'
      ];
    } else if (name == "Oliver Ridlley Turtle") {
      hey = RIDLEY_TURTLE;
      carouselImages = [
        'assets/images/new-image/olive1.jpg',
        'assets/images/new-image/olive2.jpg',
        'assets/images/new-image/olive3.jpg'
      ];
    } else if (name == 'ઓલિવ રિડલી ટર્ટલ') {
      hey = RIDLEY_TURTLE_GUJ;
      carouselImages = [
        'assets/images/new-image/olive1.jpg',
        'assets/images/new-image/olive2.jpg',
        'assets/images/new-image/olive3.jpg'
      ];
    } else if (name == "MALABAR SNAKE") {
      hey = MALABAR_SNAKE;
      carouselImages = [
        'assets/images/new-image/malabar1.jpg',
        'assets/images/new-image/malabar2.jpg',
        'assets/images/new-image/malabar3.jpg',
      ];
    } else if (name == 'મલાબાર સ્નેક') {
      hey = MALABAR_SNAKE_GUJ;
      carouselImages = [
        'assets/images/new-image/malabar1.jpg',
        'assets/images/new-image/malabar2.jpg',
        'assets/images/new-image/malabar3.jpg',
      ];
    } else if (name == "ANNULATED") {
      hey = ANNULATED;
      carouselImages = [
        'assets/images/new-image/annulated1.jpg',
        'assets/images/new-image/annulated2.jpg',
        'assets/images/new-image/annulated3.jpg',
      ];
    } else if (name == 'એન્યુલેટેડ') {
      hey = ANNULATED_GUJ;
      carouselImages = [
        'assets/images/new-image/annulated1.jpg',
        'assets/images/new-image/annulated2.jpg',
        'assets/images/new-image/annulated3.jpg',
      ];
    } else if (name == "SEA SNAKE") {
      hey = YELLOW_BELLIED;
      carouselImages = [
        'assets/images/new-image/yellow1.jpg',
        'assets/images/new-image/yellow2.jpg',
        'assets/images/new-image/yellow3.jpg',
      ];
    } else if (name == 'દરિયાઈ સાપ') {
      hey = YELLOW_BELLIED_GUJ;
      carouselImages = [
        'assets/images/new-image/yellow1.jpg',
        'assets/images/new-image/yellow2.jpg',
        'assets/images/new-image/yellow3.jpg',
      ];
    } else if (name == "HOOK-NOSED") {
      hey = HOOK_NOSED;
      carouselImages = [
        'assets/images/new-image/hook1.jpg',
        'assets/images/new-image/hook2.jpg',
        'assets/images/new-image/hook3.jpg',
      ];
    } else if (name == 'હૂક-નોઝડ') {
      hey = HOOK_NOSED_GUJ;
      carouselImages = [
        'assets/images/new-image/hook1.jpg',
        'assets/images/new-image/hook2.jpg',
        'assets/images/new-image/hook3.jpg',
      ];
    } else if (name == "OFFSHORE GULLS") {
      hey = OFFSHORE_GULLS;
      carouselImages = [
        'assets/images/new-image/offshore1.jpg',
        'assets/images/new-image/offshore2.jpg',
        'assets/images/new-image/offshore3.jpg',
      ];
    } else if (name == 'ઓફશોર ગલ્સ') {
      hey = OFFSHORE_GULLS_GUJ;
      carouselImages = [
        'assets/images/new-image/offshore1.jpg',
        'assets/images/new-image/offshore2.jpg',
        'assets/images/new-image/offshore3.jpg',
      ];
    } else if (name == "SHOREBIRDS") {
      hey = SHOREBIRDS;
      carouselImages = [
        'assets/images/new-image/shore1.jpg',
        'assets/images/new-image/shore2.jpg',
        'assets/images/new-image/shore3.jpg',
      ];
    } else if (name == 'શોરબર્ડ્સ') {
      hey = SHOREBIRDS_GUJ;
      carouselImages = [
        'assets/images/new-image/shore1.jpg',
        'assets/images/new-image/shore2.jpg',
        'assets/images/new-image/shore3.jpg',
      ];
    } else if (name == "WHALE SHARK") {
      hey = WHALE_SHARK;
      carouselImages = [
        'assets/images/new-image/whale1.jpg',
        'assets/images/new-image/whale2.jpg',
        'assets/images/new-image/whale3.jpg',
      ];
    } else if (name == 'વ્હેલ શાર્ક') {
      hey = WHALE_SHARK_GUJ;
      carouselImages = [
        'assets/images/new-image/whale1.jpg',
        'assets/images/new-image/whale2.jpg',
        'assets/images/new-image/whale3.jpg',
      ];
    }
    contentText = hey[selectedTopicIndex];
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isLargeScreen = screenWidth > 1080;
    final ScrollController _scrollController = ScrollController();

    name = widget.title;
    if (name == 'HUMPBACK DOLPHIN') {
      hey = Dolphin;
    }
    if (name == 'હમ્પબેક ડોલ્ફિન') {
      hey = Dolphin_guj;
    } else if (name == "FINLESS PORPOISE") {
      hey = FINLESS_PORPOISE;
    } else if (name == 'ફિનલેસ્સ પોર્પોઈસે') {
      hey = FINLESS_PORPOISE_guj;
    } else if (name == "BLUE WHALE") {
      hey = BLUE_WHALE;
    } else if (name == 'બ્લુ વ્હેલ') {
      hey = BLUE_WHALE_GUJ;
    } else if (name == "KILLER WHALE") {
      hey = KILLER_WHALE;
    } else if (name == 'કિલર વ્હેલ') {
      hey = KILLER_WHALE_GUJ;
    } else if (name == "Green Sea Turtle") {
      hey = GREEN_TURTLE;
    } else if (name == 'ગ્રીન સી ટર્ટલ') {
      hey = GREEN_TURTLE_GUJ;
    } else if (name == "Oliver Ridlley Turtle") {
      hey = RIDLEY_TURTLE;
    } else if (name == 'ઓલિવ રિડલી ટર્ટલ') {
      hey = RIDLEY_TURTLE_GUJ;
    } else if (name == "MALABAR SNAKE") {
      hey = MALABAR_SNAKE;
    } else if (name == 'મલાબાર સ્નેક') {
      hey = MALABAR_SNAKE_GUJ;
    } else if (name == "ANNULATED") {
      hey = ANNULATED;
    } else if (name == 'એન્યુલેટેડ') {
      hey = ANNULATED_GUJ;
    } else if (name == "SEA SNAKE") {
      hey = YELLOW_BELLIED;
    } else if (name == 'દરિયાઈ સાપ') {
      hey = YELLOW_BELLIED_GUJ;
    } else if (name == "HOOK-NOSED") {
      hey = HOOK_NOSED;
    } else if (name == 'હૂક-નોઝડ') {
      hey = HOOK_NOSED_GUJ;
    } else if (name == "OFFSHORE GULLS") {
      hey = OFFSHORE_GULLS;
    } else if (name == 'ઓફશોર ગલ્સ') {
      hey = OFFSHORE_GULLS_GUJ;
    } else if (name == "SHOREBIRDS") {
      hey = SHOREBIRDS;
    } else if (name == 'શોરબર્ડ્સ') {
      hey = SHOREBIRDS_GUJ;
    } else if (name == "WHALE SHARK") {
      hey = WHALE_SHARK;
    } else if (name == 'વ્હેલ શાર્ક') {
      hey = WHALE_SHARK_GUJ;
    }
    ScreenUtil.init(context,
        designSize: const Size(3840, 2160),
        minTextAdapt: true,
        splitScreenMode: true);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Screen dimensions using ScreenUtil for responsiveness
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          // Use ScreenUtil to scale font size, padding, and widths
          double scaleFont(double fontSize) {
            return fontSize
                .sp; // Use 'sp' to scale font sizes based on screen size
          }

          double scalePadding(double padding) {
            return padding
                .w; // Use 'w' to scale widths and paddings based on screen width
          }

          return Container(
            color: const Color(0xFF6096BA),
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.1),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: screenHeight * 0.4,
                          autoPlay: false,
                          enableInfiniteScroll: true,
                          enlargeCenterPage: false,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                        carouselController:
                        _carouselController, // Add this line
                        items: carouselImages.map((imagePath) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: screenWidth,
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.cover,
                                  // width: screenWidth,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: isLargeScreen ? screenHeight * 0.01 : 5),
                    Positioned(
                      top: screenHeight * -0.04,
                      child: SvgPicture.asset(
                        "assets/images/top.svg",
                        fit: BoxFit.cover,
                        width: screenWidth,
                      ),
                    ),
                    Positioned(
                      top: screenHeight * 0.05,
                      left: screenWidth * 0.02,
                      child: Container(
                        margin: EdgeInsets.only(left: screenWidth*0.03),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: scaleFont(220), // Scale font dynamically
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenHeight*0.3,
                      left: 10,
                      child: IconButton(
                        onPressed: () {
                          _carouselController.previousPage();
                          if (_currentIndex > 0) {
                            _carouselController.previousPage();
                          }
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: isLargeScreen
                              ? 250.sp
                              : 20.sp, // Adjusted arrow icon size
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenHeight*0.3,
                      right: 10,
                      child: IconButton(
                        onPressed: () {
                          _carouselController.nextPage();
                          if (_currentIndex < carouselImages.length - 1) {
                            _carouselController.nextPage();

                          }
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color:  Colors.white,
                          size: isLargeScreen
                              ? 250.sp
                              : 20.sp, // Adjusted arrow icon size
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      // Content Area
                      Expanded(
                        flex: 3, // Increase the width by changing the flex value
                        child: Container(
                          height: screenHeight * 0.4, // Reduce the height of the scrollbar
                          child: RawScrollbar(
                            controller: _scrollController, // Ensure you have defined a ScrollController in your state
                            padding:  EdgeInsets.only(right: screenWidth*0.01,), // Added right padding
                            thumbColor: Colors.white,
                            thickness: 20.0,
                            radius: const Radius.circular(20.0),
                            thumbVisibility: true,
                            trackVisibility: true,
                            trackColor: const Color(0x99685543),
                            trackRadius: const Radius.circular(20.0),
                            scrollbarOrientation: ScrollbarOrientation.right,
                            child: SingleChildScrollView(
                              controller: _scrollController,
                              child: Padding(
                                padding: EdgeInsets.only(left: screenWidth*0.02,right: screenWidth*0.03),
                                child: Container(
                                  margin: EdgeInsets.only(left: screenWidth*0.03),
                                  child: Text(
                                    contentText,
                                    softWrap: true,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: scaleFont(148), // Scale content font size
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Topics to Read Area
                      Expanded(
                        flex: 2,
                        child: Container(
                          // width: screenWidth*0.7,
                          // height: screenHeight*0.55,
                          decoration: const BoxDecoration(
                            color: Color(0xFF274C77),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                               SizedBox(height: 90.h,),
                              ...List.generate(topics.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedTopicIndex = index;
                                      contentText = hey[index];
                                      _scrollController.jumpTo(0);
                                    });
                                  },
                                  child: AnimatedContainer(
                                    height: screenWidth * 0.07,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    margin:
                                    const EdgeInsets.fromLTRB(11, 12, 0, 0),
                                    padding:
                                    const EdgeInsets.fromLTRB(5, 12, 0, 0),
                                    width: selectedTopicIndex == index
                                        ? screenHeight * 0.3
                                        : screenWidth * 0.35,
                                    decoration: BoxDecoration(
                                      color: selectedTopicIndex == index
                                          ? Colors.white
                                          : const Color.fromARGB(
                                          255, 96, 150, 186),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(25.0),
                                        bottomLeft: Radius.circular(25.0),
                                      ),
                                      boxShadow: selectedTopicIndex == index
                                          ? [
                                        const BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 10,
                                          spreadRadius: 2,
                                          offset: Offset(0, 5),
                                        ),
                                      ]
                                          : [],
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.only(
                                          top: screenHeight*0.004,left: 12),
                                      child: Text(
                                        globals.selectedLanguage == 'en'
                                            ? topics[index]
                                            : topics_guj[index],
                                        style: TextStyle(
                                          color: selectedTopicIndex == index
                                              ? const Color(0xFF274C77)
                                              : Colors.white,
                                          fontSize: scaleFont(
                                              selectedTopicIndex == index
                                                  ? screenWidth*0.05
                                                  : screenWidth*0.045), // Adjust topic font size
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0,
                                  screenHeight * 0.02, scalePadding(screenWidth * 0.15), 0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: screenHeight * 0.05,
                                        width: screenWidth * 0.07,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                              Radius.elliptical(60, 80)),
                                        ),
                                        // padding: EdgeInsets.symmetric(
                                        //   horizontal: scalePadding(10.0),
                                        //   vertical: scalePadding(13.0),
                                        // ),
                                        child: Transform(
                                          alignment: Alignment.center,
                                          transform: Matrix4.rotationY(pi),
                                          child: Icon(
                                            Icons.exit_to_app_outlined,
                                            color: const Color(0xFF274C77),
                                            size:
                                            scaleFont(120.0), // Scale icon size
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Back',
                                        style: TextStyle(
                                          color: const Color(0xFFEFEFEF),
                                          fontSize: scaleFont(75),
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}