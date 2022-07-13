

import 'dart:math';

int resultRandomNum = _randomVerseGenerator();

const List<String> themesVerse = ['О любви', 'О маме', 'Философская лирика', 'О войне','Городская лирика', 'Не изданные стихи'];

const String previewTitle = 'Поэзия Максима Невесомого. Только лучшие стихи : ';

const String aboutInfo = 'Член союза писателей Республики Беларусь. Дипломант XII Международных Дельфийких игр в номинации поэзия. Автор сборников стихов "На звездных качелях", "По кольцевой до самых звезд"...';


const String _map1 = 'Он припадал к ее губам,\n Как к травам утренний туман,\n Как схимник к монастырским стенам,\n Как телескоп к иным вселенным';
const String _map2 = 'Ну так проедь немного прямо,\n Стряхнув усталость, грусти лень,\n Скажи в свой самый битый день\n «Спасибо, что живу я, мама!';
const String _map3 = 'Мы родимся снова,\n Пусть никто не вечен.\n Будет в конце слово,\n И оно «до встречи»!';
const String _map4 = 'Снова дети, как котята,\n Разбежались кто куда.\n Испугались они «Града»\n — Это мертвая «вода»';
const String _map5 = 'Вечерний Минск манящий, томный, сладкий.\n Вечерний Минск — прохладный свежий бриз.\n Он ждет тебя, он приберег загадки\n Среди огней аллей и звездных линз';
const String _map6 = 'Все тяжелей дыхание,\n Все тяжелей виски.\n Агония сознания\n С тлетворностью тоски.';
const String _map7 = 'Подушки снами полнятся\n На тысячи часов,\n Но ты, моя бессонница,\n Из тысячи стихов.';



const String verseKGybam = 'Он припадал к ее губам,\n Как волны к светлым берегам,\n Как сны к магнитам подсознанья,\n Как ток к источникам питанья —\n С порога припадал к губам.\n И все, что было за окном:\n Разлитый городской бетон,\n Гуденье транспорта и пробки\n Огромной городской коробки —\n Все затихало за окном.\n Он припадал к ее губам,\n Как к травам утренний туман,\n Как схимник к монастырским стенам,\n Как телескоп к иным вселенным,\n Он снова припадал к губам.\n А все, что было за окном,\n Терялось в мареве ночном.';
const String verseSled = ' Потолок «разорван в клочья»,\n А бетонный порошок\n Аккуратный кто-то ночью\n Смел со звездами в мешок.\n Вижу небо я с кровати,\n Как проекцию кино,\n И луна в вечернем платье\n Проплывает перед сном… \n Ночь, загадочная эра,\n Манит, манит, как магнит!\n А мое земное тело\n В вечный космос улетит!\n Пусть соткутся мои гены\n С прочным атомом планет.\n Пусть хранит душа Вселенной\n Мой земной, мой яркий след.';
const String verseVecherniyMinsk = 'Вечерний Минск простой и бесподобный.\n Вечерний Минск как дивная страна.\n Вот Ратуша и блики нити водной,\n Вот по Немиге катится луна…\n Вечерний Минск манящий, томный, сладкий.\n Вечерний Минск — прохладный свежий бриз.\n Он ждет тебя, он приберег загадки\n Среди огней аллей и звездных линз.\n Вечерний Минск — душевная отрада.\n Вечерний Минск — красивейший роман.\n Тут чувственность и страсти ходят рядом…\n Я им дышу — и каждым вдохом пьян!\n Вечерний Минск — обитель ощущений.\n Вечерний Минск… Ты как ни назови\n — Он как Рождественский, Асадов и Есенин\n — Весь для любви, весь только для любви!';
const String verseOsenniyHmel = 'Из фонаря, как из стакана,\n Свет аккуратно перелит\n В бутыль бездонную тумана —\n И запах осени пьянит.\n Быть может, листья, что лежали\n На всех дорогах и в углах,\n Перебродили под дождями,\n Как вина в темных погребах…\n И я от хмеля заплетаюсь,\n Вдыхая терпкий аромат,\n По пьяной осени скитаюсь,\n Бреду без цели наугад…';
const String verseIskyshenie = 'Твой путь запутан и неясен,\n Ты неопознанный объект.\n Но как коварен и опасен\n Твой ум —  змеиный интеллект.\n И образ тени черно-белый\n Для описания непрост:\n Навеян тайнами Венеры\n И серым дымом папирос.\n Я знаю, ты —  та, роковая!\n Но я люблю тяжелый рок.\n Тобою часто измеряю\n Свою греховность и порок.\n И может, это я… неясен?\n И может, грешник… это я?\n Сошел героем старых басен\n За близорукого царя!\n И роем мыслей воспаленных\n Все подвожу под темный фон\n Всех светлых, всех неискушенных,\n Всех не пришедших на поклон!\n Но ты мне хитро улыбнулась,\n Словами душу закляня:\n «Я — искушение, ты — юность!\n Беги же, милый, от меня!»';
const String verseOsseniy  = 'Сошла дождями позолота,\n В осенней сердцевине — медь.\n Все ищут что-то, ждут чего-то,\n Чтоб на нее лишь не смотреть\n И до последнего не верить\n Сырой, бесцветной нищете…\n Так взять ее бы и заклеить,\n Как окна, лентой важных дел!\n Иному хватит поцелуя,\n Чтоб позабыть о холодах —\n И воспарит, и заворкует,\n Как белый голубь в облаках…';
const String verseBitiyDen = 'На сотни дел разбитый день.\n Дела все — мелкие осколки.\n Подсчет идет им от парковки,\n Но время прытко, как олень.\n Вот-вот сорвется с циферблата.\n И ты — отчаянно за ним.\n Дороги все уводят в Рим,\n Где Рим — достойная оплата\n За горы чуждых сердцу дел,\n А этих дел на три кармана.\n Откуда третий? Третий яма.\n В нее прошедший день слетел,\n Сойдя с пути на повороте,\n Свернувшись в часовой клубок.\n И пусть ты даже быстроног,\n Но этот день всегда уходит…\n Постой же! Что ты обронил?\n Какой-то радужный кусочек!\n На нем красивый мамин почерк,\n А ты совсем ее забыл…\n Ну так проедь немного прямо,\n Стряхнув усталость, грусти лень,\n Скажи в свой самый битый день\n «Спасибо, что живу я, мама!';
const String verseBesmertie = 'Мы родимся снова\n В измененной форме.\n Жизнь — первооснова,\n И вместе с тем — трансформер.\n Вечна перестройка\n Из иных материй.\n Постоянен только\n Космос, он же гений.\n Мы родимся снова\n В этой круговерти.\n Первым было слово,\n И оно «бессмертье».\n А до слова были\n Мы еще однажды\n Крошкой звездной пыли\n И планетной сажей.\n Мы родимся снова,\n Пусть никто не вечен.\n Будет в конце слово,\n И оно «до встречи»!';
const String verseDeti = 'Снова дети, как котята,\n Разбежались кто куда.\n Испугались они «Града»\n — Это мертвая «вода».\n По каморкам и подвалам\n Дети — тише колоска.\n Злая бабка их искала,\n С нею длинная коса.\n Капюшон ее измятый,\n Зубы кривы и остры,\n Залетала вихрем в хаты,\n Била окна, жгла костры.\n Так искала, так кричала —\n Не нашла она детей.\n Не нашла… Но чья-то мама\n Уходила вместе с ней';
const String verseAgonia = 'Ты взаперти, ты в панике,\n Стучишься о бетон.\n Как пассажир в Титанике\n Почти что обречен.\n Все тяжелей дыхание,\n Все тяжелей виски.\n Агония сознания\n С тлетворностью тоски.\n И стены исцарапаны,\n И ногти до крови,\n И кто- то злобный клапаны\n В сосудах перекрыл.\n Последние метания -\n Движений круговерть.\n Последнее отчаяние,\n И не приходит смерть.\n Ты жив, но тучкой серою\n Не человек, а мышь.\n Побитой и несмелою,\n И не живешь, а спишь\n В глухом мирке как в панцире\n Безвкусно и без сил\n А знаешь... В темном карцере\n Ты сам себя закрыл!';
const String verseBessonitsa = 'Подушки снами полнятся\n На тысячи часов,\n Но ты, моя бессонница,\n Из тысячи стихов.\n Рифмую до банальности,\n Не нахожу ответ:\n В момент какой лояльности\n Ты мне не скажешь «нет»?\n На диске полнолунья\n Прокрутится винил.\n Поешь ты сладко, лгунья…\n И я тебя простил.\n Довел себя до крайности,\n Боюсь, не удержусь…\n И скоро от усталости\n Я снами захлебнусь.\n Пора уснуть, но кажется,\n В кромешной темноте\n Все светлое размажется,\n Как краски на холсте,\n И канешь ты в бездонности,\n А я утрачу нить,\n Как в неопределенности\n Так горячо любить.';

const Map<String, String> verses = {
  'СЛЕД':verseSled, 
  'ВЕЧЕРНИЙ МИНСК': verseVecherniyMinsk,
  'ОСЕННИЙ ХМЕЛЬ' : verseOsenniyHmel,
  'ИСКУШЕНИЕ' : verseIskyshenie,
  'ОСЕНЬЮ' : verseOsseniy  ,
  'К ЕЕ ГУБАМ': verseKGybam,
  'БИТЫЙ ДЕНЬ': verseBitiyDen,
  'БЕССМЕРТИЕ': verseBesmertie,
  'ДЕТИ' : verseDeti,
  'АГОНИЯ' : verseAgonia,
  'БЕССОННОЕ': verseBessonitsa
};

 Map<String, String> themesVersesExample = {
   themesVerse[0]: resultRandomNum == 0? _map1 : _map7, 
   themesVerse[1]:_map2,
   themesVerse[2]:_map3,
   themesVerse[3]:_map4,
   themesVerse[4]:_map5,
   themesVerse[5]:_map6,
};

 Map<String, String> versesHeaderKey = {
  'О любви': resultRandomNum == 0? 'К ЕЕ ГУБАМ' : 'БЕССОННОЕ',
  'О маме': 'БИТЫЙ ДЕНЬ',
  'Философская лирика': 'БЕССМЕРТИЕ',
  'О войне' : 'ДЕТИ',
  'Городская лирика' : 'ВЕЧЕРНИЙ МИНСК',
  'Не изданные стихи' : 'АГОНИЯ'
};


int _randomVerseGenerator() {
  var rng = Random();
  var result = rng.nextInt(2);
  return result;
}