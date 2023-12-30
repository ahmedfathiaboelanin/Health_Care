-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2023 at 09:07 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `user_id`, `image`, `phone_number`, `created_at`, `updated_at`) VALUES
(1, 5, NULL, '01223344556', '2023-12-28 21:59:25', '2023-12-28 21:59:25'),
(2, 6, NULL, '01223344556', '2023-12-28 21:59:25', '2023-12-28 21:59:25');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `previous_appointment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `appointment_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

CREATE TABLE `diseases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialist` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precuations` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ar_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ar_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ar_specialist` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ar_precuations` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diseases`
--

INSERT INTO `diseases` (`id`, `name`, `description`, `specialist`, `precuations`, `ar_name`, `ar_description`, `ar_specialist`, `ar_precuations`, `created_at`, `updated_at`) VALUES
(1, 'Drug Reaction', 'An adverse drug reaction (ADR) is an injury caused by taking medication. ADRs may occur following a single dose or prolonged administration of a drug or result from the combination of two or more drugs.', 'Allergist', 'stop irritation,consult nearest hospital,stop taking drug,follow up', 'رد فعل المخدرات', 'رد فعل الدواء السلبي (ADR) هو إصابة بسبب تناول الدواء.قد تحدث ADRs بعد جرعة واحدة أو إعطاء طويل من دواء أو ناتج عن مزيج من عقارين أو أكثر.', 'أخصائي الحساسية', 'توقف عن التهيج,استشر أقرب مستشفى,توقف عن تناول المخدرات,متابعة', NULL, NULL),
(2, 'Malaria', 'An infectious disease caused by protozoan parasites from the Plasmodium family that can be transmitted by the bite of the Anopheles mosquito or by a contaminated needle or transfusion. Falciparum malaria is the most deadly type.', 'Internal Medicine', 'Consult nearest hospital,avoid oily food,avoid non veg food,keep mosquitos out', 'ملاريا', 'مرض معدي ناتج عن طفيليات بروتوزوان من عائلة البلازوديوم التي يمكن أن تنتقل عن طريق لدغة البعوض الأنوفيل أو إبرة ملوثة أو نقل.Falciparum Malaria هو النوع الأكثر فتكا.', 'الطب الباطني', 'استشر أقرب مستشفى,تجنب الطعام الدهنية,تجنب الطعام غير الخضار,الحفاظ على البعوض خارج', NULL, NULL),
(3, 'Allergy', 'An allergy is an immune system response to a foreign substance that\'s not typically harmful to your body.They can include certain foods, pollen, or pet dander. Your immune system\'s job is to keep you healthy by fighting harmful pathogens.', 'Allergist', 'apply calamine,cover area with bandage,use ice to compress itching', 'حساسية', 'الحساسية هي استجابة لجهاز المناعة لمادة غريبة غير ضارة عادة لجسمك. يمكن أن تشمل بعض الأطعمة أو حبوب اللقاح أو الأليف.وظيفة نظام المناعة لديك هي الحفاظ على صحتك من خلال محاربة مسببات الأمراض الضارة.', 'أخصائي الحساسية', 'تطبيق كالامين,منطقة الغلاف مع ضمادة,استخدم الجليد لضغط الحكة', NULL, NULL),
(4, 'Hypothyroidism', 'Hypothyroidism, also called underactive thyroid or low thyroid, is a disorder of the endocrine system in which the thyroid gland does not produce enough thyroid hormone.', 'Endocrinologist', 'reduce stress,exercise,eat healthy,get proper sleep', 'قصور الغدة الدرقية', 'قصور الغدة الدرقية ، الذي يطلق عليه أيضًا الغدة الدرقية النشطة أو الغدة الدرقية المنخفضة ، هو اضطراب في نظام الغدد الصماء التي لا تنتج فيها الغدة الدرقية هرمون الغدة الدرقية.', 'أخصائي الغدد الصماء', 'الحد من التوتر,يمارس,تناول طعام صحي,احصل على نوم مناسب', NULL, NULL),
(5, 'Psoriasis', 'Psoriasis is a common skin disorder that forms thick, red, bumpy patches covered with silvery scales. They can pop up anywhere, but most appear on the scalp, elbows, knees, and lower back. Psoriasis can\'t be passed from person to person. It does sometimes', 'Dermatologist', 'wash hands with warm soapy water,stop bleeding using pressure,consult doctor,salt baths', 'صدفية', 'الصدفية هو اضطراب جلدي شائع يشكل بقع سميكة حمراء وعرة مغطاة بمقاييس فضية.يمكن أن يطفو على السطح في أي مكان ، لكن معظمهم يظهرون على فروة الرأس والمرفقين والركبتين والظهر السفلي.لا يمكن تمرير الصدفية من شخص لآخر.في بعض الأحيان', 'طبيب الجلدية', 'اغسل اليدين بالماء الصابون الدافئ,توقف عن النزيف باستخدام الضغط,استشارة الطبيب,حمامات الملح', NULL, NULL),
(6, 'GERD', 'Gastroesophageal reflux disease, or GERD, is a digestive disorder that affects the lower esophageal sphincter (LES), the ring of muscle between the esophagus and stomach. Many people, including pregnant women, suffer from heartburn or acid indigestion cau', 'Gastroenterologist', 'avoid fatty spicy food,avoid lying down after eating,maintain healthy weight,exercise', 'ارتجاع المريء', 'مرض الجزر المعدي المريء ، أو ارتجاع المريء ، هو اضطراب هضمي يؤثر على انخفاض العضلة العاصرة المريء (LES) ، حلقة العضلات بين المريء والمعدة.كثير من الناس ، بما في ذلك النساء الحوامل ، يعانون من حرقة أو عسر الهضم الحمضي', 'أخصائي الجهاز الهضمي', 'تجنب الطعام الحار الدهني,تجنب الاستلقاء بعد الأكل,الحفاظ على وزن صحي,يمارس', NULL, NULL),
(7, 'Chronic Cholestasis', 'Chronic cholestatic diseases, whether occurring in infancy, childhood or adulthood, are characterized by defective bile acid transport from the liver to the intestine, which is caused by primary damage to the biliary epithelium in most cases', 'Hepatologist', 'cold baths,anti itch medicine,consult doctor,eat healthy', 'ركود الصفراوي المزمن', 'تتميز أمراض الصفراوات الفائقة المزمنة ، سواء تحدث في طفولتها أو الطفولة أو مرحلة البلوغ ، بنقل حمض الصفراء المعيب من الكبد إلى الأمعاء ، وهو سبب الأضرار الأولية للظهارة الصفراوية في معظم الحالات', 'طبيب الكبد', 'حمامات باردة,الطب المضاد للحكة,استشارة الطبيب,تناول طعام صحي', NULL, NULL),
(8, 'Hepatitis A', 'Hepatitis A is a highly contagious liver infection caused by the hepatitis A virus. The virus is one of several types of hepatitis viruses that cause inflammation and affect your liver\'s ability to function.', 'Hepatologist', 'Consult nearest hospital,wash hands through,avoid fatty spicy food,medication', 'إلتهاب الكبد أ', 'التهاب الكبد A هو عدوى الكبد المعدية للغاية الناجمة عن فيروس التهاب الكبد A.يعتبر الفيروس أحد أنواع فيروسات التهاب الكبد العديدة التي تسبب الالتهاب وتؤثر على قدرة الكبد على العمل.', 'طبيب الكبد', 'استشر أقرب مستشفى,اغسل اليدين,تجنب الطعام الحار الدهني,دواء', NULL, NULL),
(9, 'Osteoarthristis', 'Osteoarthritis is the most common form of arthritis, affecting millions of people worldwide. It occurs when the protective cartilage that cushions the ends of your bones wears down over time.', 'Rheumatologist', 'acetaminophen,consult nearest hospital,follow up,salt baths', 'هشاشة العظام', 'هشاشة العظام هو الشكل الأكثر شيوعًا لالتهاب المفاصل ، ويؤثر على ملايين الناس في جميع أنحاء العالم.يحدث ذلك عندما تلبس الغضروف الواقي الذي يسيطر على نهايات عظامك مع مرور الوقت.', 'أخصائي الروماتيزم', 'أسِيتامينُوفين,استشر أقرب مستشفى,متابعة,حمامات الملح', NULL, NULL),
(10, 'Paroymsal Positional Vertigo', 'Benign paroxysmal positional vertigo (BPPV) is one of the most common causes of vertigo — the sudden sensation that you\'re spinning or that the inside of your head is spinning. Benign paroxysmal positional vertigo causes brief episodes of mild to intense ', 'Otolaryngologist', 'lie down,avoid sudden change in body,avoid abrupt head movment,relax', 'ParoxySmal الموضعية الدوار', 'يعد الدوار الموضعي الحميد البالي (BPPV) أحد أكثر الأسباب شيوعًا للدوار - الإحساس المفاجئ الذي تدور فيه أو أن يكون داخل رأسك يدور.الدوار الموضعي الحميد الناعم يسبب حلقات مختصرة من المعتدل إلى مكثف', 'أخصائي الأنف والأذن والحنجرة', 'اضطجع,تجنب التغيير المفاجئ في الجسم,تجنب حركة الرأس المفاجئة,يستريح', NULL, NULL),
(11, 'Hypoglycemia', 'Hypoglycemia is a condition in which your blood sugar (glucose) level is lower than normal. Glucose is your body\'s main energy source. Hypoglycemia is often related to diabetes treatment. But other drugs and a variety of conditions — many rare — can cause', 'Endocrinologist', 'lie down on side,check in pulse,drink sugary drinks,consult doctor', 'نقص سكر الدم', 'نقص السكر في الدم هو حالة يكون فيها مستوى السكر في الدم (الجلوكوز) أقل من المعتاد.الجلوكوز هو مصدر الطاقة الرئيسي لجسمك.غالبًا ما يرتبط نقص السكر في الدم بعلاج مرض السكري.لكن الأدوية الأخرى ومجموعة متنوعة من الحالات - كثير - نادر - يمكن أن تسبب', 'أخصائي الغدد الصماء', 'استلقي على الجانب,تحقق في النبض,شرب المشروبات السكرية,استشارة الطبيب', NULL, NULL),
(12, 'Acne', 'Acne vulgaris is the formation of comedones, papules, pustules, nodules, and/or cysts as a result of obstruction and inflammation of pilosebaceous units (hair follicles and their accompanying sebaceous gland). Acne develops on the face and upper trunk. It', 'Dermatologist', 'bath twice,avoid fatty spicy food,drink plenty of water,avoid too many products', 'حَبُّ الشّبَاب', 'حب الشباب المبتذلة هو تكوين الكوميديا ، الحطاطات ، البث ، العقيدات ، و/أو الخراجات نتيجة لعرقلة وحدات بيلوزيباسوس (بصيلات الشعر والغدة الدهنية المصاحبة لها).يتطور حب الشباب على الوجه والجذع العلوي.هو - هي', 'طبيب الجلدية', 'حمام مرتين,تجنب الطعام الحار الدهني,اشرب الكثير من الماء,تجنب الكثير من المنتجات', NULL, NULL),
(13, 'Diabetes', 'Diabetes is a disease that occurs when your blood glucose, also called blood sugar, is too high. Blood glucose is your main source of energy and comes from the food you eat. Insulin, a hormone made by the pancreas, helps glucose from food get into your ce', 'Endocrinologist', 'have balanced diet,exercise,consult doctor,follow up', 'السكري', 'مرض السكري هو مرض يحدث عندما يكون الجلوكوز في الدم ، الذي يطلق عليه أيضًا نسبة السكر في الدم ، مرتفعًا جدًا.الجلوكوز في الدم هو مصدر الطاقة الرئيسي الخاص بك ويأتي من الطعام الذي تتناوله.الأنسولين ، هرمون مصنوع من البنكرياس ، يساعد الجلوكوز من الوصول إلى CE', 'أخصائي الغدد الصماء', 'لديك نظام غذائي متوازن,يمارس,استشارة الطبيب,متابعة', NULL, NULL),
(14, 'Impetigo', 'Impetigo (im-puh-TIE-go) is a common and highly contagious skin infection that mainly affects infants and children. Impetigo usually appears as red sores on the face, especially around a child\'s nose and mouth, and on hands and feet. The sores burst and d', 'Dermatologist', 'soak affected area in warm water,use antibiotics,remove scabs with wet compressed cloth,consult doctor', 'الانغماس', 'إن Impetigo (im-puh-tie-go) هو عدوى جلدية شائعة ومعدية للغاية تؤثر بشكل أساسي على الأطفال والأطفال.عادة ما يظهر Impetigo كقروح حمراء على الوجه ، وخاصة حول أنف وفم الطفل ، وعلى اليدين والقدمين.انفجار القروح و د', 'طبيب الجلدية', 'نقع المنطقة المصابة في الماء الدافئ,استخدام المضادات الحيوية,قم بإزالة الجربات بقطعة قماش مضغوطة مبللة,استشارة الطبيب', NULL, NULL),
(15, 'Hypertension', 'Hypertension (HTN or HT), also known as high blood pressure (HBP), is a long-term medical condition in which the blood pressure in the arteries is persistently elevated. High blood pressure typically does not cause symptoms.', 'Cardiologist', 'meditation,salt baths,reduce stress,get proper sleep', 'ارتفاع ضغط الدم', 'ارتفاع ضغط الدم (HTN أو HT) ، والمعروف أيضًا باسم ارتفاع ضغط الدم (HBP) ، هو حالة طبية طويلة الأجل يتم فيها ارتفاع ضغط الدم في الشرايين باستمرار.ارتفاع ضغط الدم عادة لا يسبب الأعراض.', 'طبيب القلب', 'تأمل,حمامات الملح,الحد من التوتر,احصل على نوم مناسب', NULL, NULL),
(16, 'Peptic Ulcer Disease', 'Peptic ulcer disease (PUD) is a break in the inner lining of the stomach, the first part of the small intestine, or sometimes the lower esophagus. An ulcer in the stomach is called a gastric ulcer, while one in the first part of the intestines is a duoden', 'Gastroenterologist', 'avoid fatty spicy food,consume probiotic food,eliminate milk,limit alcohol', 'مرض القرحة الهضمية', 'مرض القرحة الهضمية (PUD) هو استراحة في البطانة الداخلية للمعدة ، أو الجزء الأول من الأمعاء الدقيقة ، أو في بعض الأحيان المريء السفلي.يُطلق على قرحة في المعدة قرحة المعدة ، في حين أن أحدهم في الجزء الأول من الأمعاء هو ديوودن', 'أخصائي الجهاز الهضمي', 'تجنب الطعام الحار الدهني,تستهلك طعام بروبيوتيك,القضاء على الحليب,الحد من الكحول', NULL, NULL),
(17, 'Dimorphic Hemorrhoids (Piles)', 'Hemorrhoids, also spelled haemorrhoids, are vascular structures in the anal canal. In their ... Other names, Haemorrhoids, piles, hemorrhoidal disease .', 'Phlebologist', 'avoid fatty spicy food,consume witch hazel,warm bath with epsom salt,consume alovera juice', 'البواسير النزيف ثنائي الشكل (أكوام)', 'البواسير النزفية ، البواسير المكتوبة أيضًا ، هي هياكل الوعائية في القناة الشرجية.في ... أسماء أخرى ، البواسير ، أكوام ، مرض البواسير.', 'عالم الفلبيني', 'تجنب الطعام الحار الدهني,تستهلك عسلي الساحرة,حمام دافئ مع ملح إبسوم,تستهلك عصير الألوة فيرا', NULL, NULL),
(18, 'Common Cold', 'The common cold is a viral infection of your nose and throat (upper respiratory tract). It\'s usually harmless, although it might not feel that way. Many types of viruses can cause a common cold.', 'Internist', 'drink vitamin c rich drinks,take vapour,avoid cold food,keep fever in check', 'زُكام', 'البرد الشائع هو عدوى فيروسية لأنفك وحلقك (الجهاز التنفسي العلوي).عادة ما يكون غير ضار ، على الرغم من أنه قد لا يشعر بهذه الطريقة.يمكن أن تسبب العديد من أنواع الفيروسات نزلة برد شائعة.', 'طبيب باطني', 'اشرب المشروبات الغنية فيتامين C,خذ البخار,تجنب الطعام البارد,احتفظ بالحمى في الاختيار', NULL, NULL),
(19, 'Chickenpox', 'Chickenpox is a highly contagious disease caused by the varicella-zoster virus (VZV). It can cause an itchy, blister-like rash. The rash first appears on the chest, back, and face, and then spreads over the entire body, causing between 250 and 500 itchy b', 'Pediatrician', 'use neem in bathing,consume neem leaves,take vaccine,avoid public places', 'حُماق', 'جدري الماء هو مرض معدي للغاية ناتج عن فيروس الحماق والزوستر (VZV).يمكن أن يسبب حكة ، لا تشبه الطفح الجلدي.يظهر الطفح الجلدي أولاً على الصدر والظهر والوجه ، ثم ينتشر على الجسم بالكامل ، مما يسبب ما بين 250 و 500 حكة ب', 'طبيب الأطفال', 'استخدم النيم في الاستحمام,تستهلك أوراق النيم,خذ اللقاح,تجنب الأماكن العامة', NULL, NULL),
(20, 'Cervical Spondylosis', 'Cervical spondylosis is a general term for age-related wear and tear affecting the spinal disks in your neck. As the disks dehydrate and shrink, signs of osteoarthritis develop, including bony projections along the edges of bones (bone spurs).', 'Orthopedic Surgeon', 'use heating pad or cold pack,exercise,take otc pain reliver,consult doctor', 'سرطان عنق الرحم', 'الفقار عنق الرحم هو مصطلح عام للارتداء والدموع المرتبطة بالعمر التي يؤثر على الأقراص الشوكية في رقبتك.مع تجفيف الأقراص وتقلصها ، تتطور علامات هشاشة العظام ، بما في ذلك التوقعات العظمية على طول حواف العظام (توتنهام العظام).', 'جراح العظام', 'استخدم وسادة التدفئة أو حزمة باردة,يمارس,خذ مسكن الألم OTC,استشارة الطبيب', NULL, NULL),
(21, 'Hyperthyroidism', 'Hyperthyroidism (overactive thyroid) occurs when your thyroid gland produces too much of the hormone thyroxine. Hyperthyroidism can accelerate your body\'s metabolism, causing unintentional weight loss and a rapid or irregular heartbeat.', 'Endocrinologist', 'eat healthy,massage,use lemon balm,take radioactive iodine treatment', 'فرط نشاط الغدة الدرقية', 'يحدث فرط نشاط الغدة الدرقية (الغدة الدرقية المفرطة النشاط) عندما تنتج غدة الغدة الدرقية الكثير من هرمون الهروكسين.يمكن أن يؤدي فرط نشاط الغدة الدرقية إلى تسريع استقلاب جسمك ، مما يسبب فقدان الوزن غير المقصود ونبض قلب سريع أو غير منتظم.', 'أخصائي الغدد الصماء', 'تناول طعام صحي,تدليك,استخدم بلسم الليمون,خذ علاج اليود المشع', NULL, NULL),
(22, 'Urinary Tract Infection', 'Urinary tract infection: An infection of the kidney, ureter, bladder, or urethra. Abbreviated UTI. Not everyone with a UTI has symptoms, but common symptoms include a frequent urge to urinate and pain or burning when urinating.', 'Urologist', 'drink plenty of water,increase vitamin c intake,drink cranberry juice,take probiotics', 'التهاب المسالك البولية', 'عدوى المسالك البولية: عدوى من الكلى أو الحالب أو المثانة أو مجرى البول.مختصرة UTI.ليس كل من يعاني من التهاب المسالك البولية لديه أعراض ، ولكن الأعراض الشائعة تشمل رغبة متكررة في التبول والألم أو الاحتراق عند التبول.', 'طبيب مسالك بولية', 'اشرب الكثير من الماء,زيادة تناول فيتامين C,شرب عصير التوت البري,خذ البروبيوتيك', NULL, NULL),
(23, 'Varicose Veins', 'A vein that has enlarged and twisted, often appearing as a bulging, blue blood vessel that is clearly visible through the skin. Varicose veins are most common in older adults, particularly women, and occur especially on the legs.', 'Phlebologist', 'lie down flat and raise the leg high,use oinments,use vein compression,dont stand still for long', 'توسع الأوردة', 'الوريد الذي تم توسيعه ولفه ، غالبًا ما يظهر كوعاء دموي منتفخ أزرق واضحة من خلال الجلد.تعتبر الدوالي الأكثر شيوعًا لدى كبار السن ، وخاصة النساء ، ويحدث خاصة على الساقين.', 'عالم الفلبيني', 'استلقي على مسطح ورفع الساق عالياً,استخدام المراهم,استخدام ضغط الوريد,لا تقف لفترة طويلة', NULL, NULL),
(24, 'AIDS', 'Acquired immunodeficiency syndrome (AIDS) is a chronic, potentially life-threatening condition caused by the human immunodeficiency virus (HIV). By damaging your immune system, HIV interferes with your body\'s ability to fight infection and disease.', 'Infectious Disease Specialist', 'avoid open cuts,wear ppe if possible,consult doctor,follow up', 'الإيدز', 'متلازمة نقص المناعة المكتسبة (AIDS) هي حالة مزمنة وربما تهدد الحياة تسببها فيروس نقص المناعة البشرية (فيروس نقص المناعة البشرية).من خلال إتلاف نظام المناعة الخاص بك ، يتداخل فيروس نقص المناعة البشرية مع قدرة جسمك على مكافحة العدوى والمرض.', 'أخصائي المرض المعدي', 'تجنب التخفيضات المفتوحة,ارتداء معدات الوقاية الشخصية إذا كان ذلك ممكنا,استشارة الطبيب,متابعة', NULL, NULL),
(25, 'Paralysis (Brain Hemorrhage)', 'Intracerebral hemorrhage (ICH) is when blood suddenly bursts into brain tissue, causing damage to your brain. Symptoms usually appear suddenly during ICH. They include headache, weakness, confusion, and paralysis, particularly on one side of your body.', 'Neurologist', 'massage,eat healthy,exercise,consult doctor', 'الشلل (نزيف الدماغ)', 'النزيف داخل المخ (ICH) هو عندما ينفجر الدم فجأة في أنسجة المخ ، مما يسبب أضرارًا لدماغك.عادة ما تظهر الأعراض فجأة خلال ICH.وهي تشمل الصداع والضعف والارتباك والشلل ، وخاصة على جانب واحد من جسمك.', 'طبيب الأعصاب', 'تدليك,تناول طعام صحي,يمارس,استشارة الطبيب', NULL, NULL),
(26, 'Typhoid', 'An acute illness characterized by fever caused by infection with the bacterium Salmonella typhi. Typhoid fever has an insidious onset, with fever, headache, constipation, malaise, chills, and muscle pain. Diarrhea is uncommon, and vomiting is not usually ', 'Infectious Disease Specialist', 'eat high calorie vegitables,antiboitic therapy,consult doctor,medication', 'التيفوئيد', 'مرض حاد يتميز بالحمى الناجمة عن العدوى مع البكتيريا السالمونيلا التيفي.يتمتع حمى التيفوئيد ببداية غدرا ، مع الحمى والصداع والإمساك والشعور بالضيق والشعور بقشعريرة وآلام في العضلات.الإسهال غير شائع ، والقيء ليس عادة', 'أخصائي المرض المعدي', 'أكل الخضروات عالية السعرات الحرارية,العلاج بالمضادات الحيوية,استشارة الطبيب,دواء', NULL, NULL),
(27, 'Hepatitis B', 'Hepatitis B is an infection of your liver. It can cause scarring of the organ, liver failure, and cancer. It can be fatal if it isn\'t treated. It\'s spread when people come in contact with the blood, open sores, or body fluids of someone who has the hepati', 'Hepatologist', 'consult nearest hospital,vaccination,eat healthy,medication', 'التهاب الكبد ب', 'التهاب الكبد B هو عدوى من الكبد.يمكن أن يسبب ندبات العضو وفشل الكبد والسرطان.يمكن أن يكون قاتلاً إذا لم يتم علاجه.ينتشر عندما يتواصل الناس مع الدم أو القروح المفتوحة أو سوائل الجسم لشخص لديه الكبد', 'طبيب الكبد', 'استشر أقرب مستشفى,تلقيح,تناول طعام صحي,دواء', NULL, NULL),
(28, 'Fungal Infection', 'In humans, fungal infections occur when an invading fungus takes over an area of the body and is too much for the immune system to handle. Fungi can live in the air, soil, water, and plants. There are also some fungi that live naturally in the human body.', 'Dermatologist', 'bath twice,use detol or neem in bathing water,keep infected area dry,use clean cloths', 'تلوث فطري', 'في البشر ، تحدث الالتهابات الفطرية عندما تسيطر الفطريات الغازية على منطقة من الجسم وهي أكثر من اللازم حتى يتعامل مع الجهاز المناعي.يمكن أن تعيش الفطريات في الهواء والتربة والماء والنباتات.هناك أيضًا بعض الفطريات التي تعيش بشكل طبيعي في جسم الإنسان.', 'طبيب الجلدية', 'حمام مرتين,استخدم dettol أو النيم في ماء الاستحمام,الحفاظ على المنطقة المصابة جافة,استخدم الملابس النظيفة', NULL, NULL),
(29, 'Hepatitis C', 'Inflammation of the liver due to the hepatitis C virus (HCV), which is usually spread via blood transfusion (rare), hemodialysis, and needle sticks. The damage hepatitis C does to the liver can lead to cirrhosis and its complications as well as cancer.', 'Hepatologist', 'Consult nearest hospital,vaccination,eat healthy,medication', 'التهاب الكبد ج', 'التهاب الكبد بسبب فيروس التهاب الكبد الوبائي C (HCV) ، والذي ينتشر عادة عن طريق نقل الدم (نادر) ، غسيل الكلى ، وعصي الإبرة.يمكن أن يؤدي التهاب الكبد C إلى الكبد إلى تليف الكبد ومضاعفاته وكذلك السرطان.', 'طبيب الكبد', 'استشر أقرب مستشفى,تلقيح,تناول طعام صحي,دواء', NULL, NULL),
(30, 'Migraine', 'A migraine can cause severe throbbing pain or a pulsing sensation, usually on one side of the head. It\'s often accompanied by nausea, vomiting, and extreme sensitivity to light and sound. Migraine attacks can last for hours to days, and the pain can be so', 'Neurologist', 'meditation,reduce stress,use poloroid glasses in sun,consult doctor', 'صداع نصفي', 'يمكن أن يسبب الصداع النصفي ألمًا شديد الخفقان أو إحساس نابض ، عادة على جانب واحد من الرأس.غالبًا ما يكون مصحوبًا بالغثيان والقيء والحساسية الشديدة للضوء والصوت.يمكن أن تستمر هجمات الصداع النصفي لساعات إلى أيام ، ويمكن أن يكون الألم كذلك', 'طبيب الأعصاب', 'تأمل,الحد من التوتر,استخدم نظارات بولارويد في الشمس,استشارة الطبيب', NULL, NULL),
(31, 'Bronchial Asthma', 'Bronchial asthma is a medical condition which causes the airway path of the lungs to swell and narrow. Due to this swelling, the air path produces excess mucus making it hard to breathe, which results in coughing, short breath, and wheezing. The disease i', 'Pulmonologist', 'switch to loose cloothing,take deep breaths,get away from trigger,seek help', 'الربو القصبي', 'الربو القصبي هو حالة طبية تتسبب في تضخم مسار مجرى الهواء للرئتين وضيق.بسبب هذا التورم ، ينتج مسار الهواء المخاط الزائد مما يجعل من الصعب التنفس ، مما يؤدي إلى السعال ، والتنفس القصير ، والصفير.المرض أنا', 'أخصائي الرئة', 'قم بالتبديل إلى الملابس الفضفاضة,خذ أنفاس عميقة,ابتعد عن الزناد,طلب المساعدة', NULL, NULL),
(32, 'Alcoholic Hepatitis', 'Alcoholic hepatitis is a diseased, inflammatory condition of the liver caused by heavy alcohol consumption over an extended period of time. It\'s also aggravated by binge drinking and ongoing alcohol use. If you develop this condition, you must stop drinki', 'Hepatologist', 'stop alcohol consumption,consult doctor,medication,follow up', 'التهاب الكبد الكحولي', 'التهاب الكبد الكحولي هو حالة الالتهابات المريضة للكبد الناتجة عن استهلاك الكحول الثقيل على مدى فترة زمنية طويلة.كما أنه يتفاقم عن طريق الشرب الشريرة وتعاطي الكحول المستمر.إذا قمت بتطوير هذه الحالة ، فيجب عليك إيقاف Drinki', 'طبيب الكبد', 'توقف عن استهلاك الكحول,استشارة الطبيب,دواء,متابعة', NULL, NULL),
(33, 'Jaundice', 'Yellow staining of the skin and sclerae (the whites of the eyes) by abnormally high blood levels of the bile pigment bilirubin. The yellowing extends to other tissues and body fluids. Jaundice was once called the \"morbus regius\" (the regal disease) in the', 'Hepatologist', 'drink plenty of water,consume milk thistle,eat fruits and high fiberous food,medication', 'اليرقان', 'تلطيخ أصفر من الجلد والصلص (بياض العيون) بمستويات الدم المرتفعة بشكل غير طبيعي من البيليروبين الصفراء الصفراء.يمتد الصفراء إلى الأنسجة الأخرى وسوائل الجسم.كان يطلق على اليرقان ذات يوم \"Morbus Regius\" (مرض Regal) في', 'طبيب الكبد', 'اشرب الكثير من الماء,تستهلك الحليب الشوك,أكل الفواكه والطعام الليفي العالي,دواء', NULL, NULL),
(34, 'Hepatitis E', 'A rare form of liver inflammation caused by infection with the hepatitis E virus (HEV). It is transmitted via food or drink handled by an infected person or through infected water supplies in areas where fecal matter may get into the water. Hepatitis E do', 'Hepatologist', 'stop alcohol consumption,rest,consult doctor,medication', 'التهاب الكبد ه', 'شكل نادر من التهاب الكبد الناجم عن العدوى بفيروس التهاب الكبد E (HEV).ينتقل عن طريق الطعام أو الشراب الذي يتعامل معه شخص مصاب أو من خلال إمدادات المياه المصابة في المناطق التي قد تدخل فيها المادة البرازية إلى الماء.التهاب الكبد الوبائي', 'طبيب الكبد', 'توقف عن استهلاك الكحول,استراحة,استشارة الطبيب,دواء', NULL, NULL),
(35, 'Dengue', 'an acute infectious disease caused by a flavivirus (species Dengue virus of the genus Flavivirus), transmitted by aedes mosquitoes, and characterized by headache, severe joint pain, and a rash. — called also breakbone fever, dengue fever.', 'Infectious Disease Specialist', 'drink papaya leaf juice,avoid fatty spicy food,keep mosquitos away,keep hydrated', 'حمى الضنك', 'مرض معدي حاد ناتج عن فيروس فلافي (فيروس حمى الضنك من جنس فيروس الفلافيا) ، ينتقل بواسطة البعوض المميت ، ويتميز بالصداع ، وآلام المفاصل الشديدة ، والطفح الجلدي.- يسمى أيضا حمى العظم ، حمى الضنك.', 'أخصائي المرض المعدي', 'اشرب عصير أوراق البابايا,تجنب الطعام الحار الدهني,الحفاظ على البعوض بعيدا,الحفاظ على رطب', NULL, NULL),
(36, 'Hepatitis D', 'Hepatitis D, also known as the hepatitis delta virus, is an infection that causes the liver to become inflamed. This swelling can impair liver function and cause long-term liver problems, including liver scarring and cancer. The condition is caused by the', 'Hepatologist', 'consult doctor,medication,eat healthy,follow up', 'التهاب الكبد د', 'التهاب الكبد D ، والمعروف أيضًا باسم فيروس دلتا التهاب الكبد ، هو عدوى تسبب في أن يصبح الكبد ملتهبًا.هذا التورم يمكن أن يضعف وظيفة الكبد ويسبب مشاكل في الكبد على المدى الطويل ، بما في ذلك ندبات الكبد والسرطان.الشرط ناتج عن', 'طبيب الكبد', 'استشارة الطبيب,دواء,تناول طعام صحي,متابعة', NULL, NULL),
(37, 'Heart Attack', 'The death of heart muscle due to the loss of blood supply. The loss of blood supply is usually caused by a complete blockage of a coronary artery, one of the arteries that supplies blood to the heart muscle.', 'Cardiologist', 'call ambulance,chew or swallow asprin,keep calm', 'نوبة قلبية', 'وفاة عضلة القلب بسبب فقدان الدم.عادة ما يكون فقدان إمدادات الدم بسبب انسداد كامل للشريان التاجي ، أحد الشرايين التي توفر الدم لعضلة القلب.', 'طبيب القلب', 'استدعاء سيارة الإسعاف,مضغ أو ابتلاع الأسبرين,حافظ على  الهدوء', NULL, NULL),
(38, 'Pneumonia', 'Pneumonia is an infection in one or both lungs. Bacteria, viruses, and fungi cause it. The infection causes inflammation in the air sacs in your lungs, which are called alveoli. The alveoli fill with fluid or pus, making it difficult to breathe.', 'Pulmonologist', 'consult doctor,medication,rest,follow up', 'التهاب رئوي', 'الالتهاب الرئوي هو عدوى في رئتي واحد أو كلاهما.البكتيريا والفيروسات والفطريات تسببها.تتسبب العدوى في التهاب في أكياس الهواء في رئتيك ، والتي تسمى الحويصلات الهوائية.تملأ الحويصلات الهوائية بالسوائل أو القيح ، مما يجعل التنفس من الصعب التنفس.', 'أخصائي الرئة', 'استشارة الطبيب,دواء,استراحة,متابعة', NULL, NULL),
(39, 'Arthritis', 'Arthritis is the swelling and tenderness of one or more of your joints. The main symptoms of arthritis are joint pain and stiffness, which typically worsen with age. The most common types of arthritis are osteoarthritis and rheumatoid arthritis.', 'Rheumatologist', 'exercise,use hot and cold therapy,try acupuncture,massage', 'التهاب المفاصل', 'التهاب المفاصل هو تورم وحنان واحد أو أكثر من مفاصلك.الأعراض الرئيسية لالتهاب المفاصل هي آلام وتصلب المفاصل ، والتي عادة ما تتفاقم مع تقدم العمر.الأنواع الأكثر شيوعًا من التهاب المفاصل هي هشاشة العظام والتهاب المفاصل الروماتويدي.', 'أخصائي الروماتيزم', 'يمارس,استخدم العلاج الساخن والبارد,حاول الوخز بالإبر,تدليك', NULL, NULL),
(40, 'Gastroenteritis', 'Gastroenteritis is an inflammation of the digestive tract, particularly the stomach, and large and small intestines. Viral and bacterial gastroenteritis are intestinal infections associated with symptoms of diarrhea , abdominal cramps, nausea , and vomiti', 'Gastroenterologist', 'stop eating solid food for while,try taking small sips of water,rest,ease back into eating', 'التهاب الجهاز الهضمي', 'التهاب الجهاز الهضمي هو التهاب في الجهاز الهضمي ، وخاصة المعدة ، والأمعاء الكبيرة والصغيرة.التهاب المعدة المعدي الفيروسية والبكتيرية هي التهابات معوية مرتبطة بأعراض الإسهال ، وتشنجات البطن ، والغثيان ، والقيء', 'أخصائي الجهاز الهضمي', 'توقف عن تناول الطعام الصلب لفترة,حاول تناول رشفات صغيرة من الماء,استراحة,راحة مرة أخرى إلى الأكل', NULL, NULL),
(41, 'Tuberculosis', 'Tuberculosis (TB) is an infectious disease usually caused by Mycobacterium tuberculosis (MTB) bacteria. Tuberculosis generally affects the lungs, but can also affect other parts of the body. Most infections show no symptoms, in which case it is known as l', 'Pulmonologist', 'cover mouth,consult doctor,medication,rest', 'مرض الدرن', 'مرض السل (TB) هو مرض معدي عادة ما يسببه بكتيريا السل (MTB).مرض السل يؤثر بشكل عام على الرئتين ، ولكن يمكن أن يؤثر أيضًا على أجزاء أخرى من الجسم.معظم العدوى لا تظهر أي أعراض ، وفي هذه الحالة تُعرف باسم L.', 'أخصائي الرئة', 'تغطية الفم,استشارة الطبيب,دواء,استراحة', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `disease_patient_history`
--

CREATE TABLE `disease_patient_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `disease_id` bigint(20) UNSIGNED NOT NULL,
  `patient_history_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_personal_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `specialization` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(8,2) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `re-examination_price` decimal(8,2) DEFAULT 0.00,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `governament1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time1` time DEFAULT NULL,
  `end_time1` time DEFAULT NULL,
  `from2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `governament2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time2` time DEFAULT NULL,
  `end_time2` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `doctor_personal_id`, `user_id`, `specialization`, `rate`, `price`, `re-examination_price`, `image`, `age`, `description`, `from1`, `to1`, `street1`, `city1`, `governament1`, `start_time1`, `end_time1`, `from2`, `to2`, `street2`, `city2`, `governament2`, `start_time2`, `end_time2`, `created_at`, `updated_at`) VALUES
(1, 1234567890, 3, 'Cardiologist', '5.00', '1000.00', '550.00', NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 987654321, 4, 'Endocrinologist', '5.00', '1250.00', '500.00', NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_patient`
--

CREATE TABLE `doctor_patient` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `components` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indications` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dosage_form` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `strength` double(8,2) DEFAULT NULL,
  `prescription_required` tinyint(1) NOT NULL DEFAULT 0,
  `prescription_notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frequency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timing` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_instructions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer_contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `common_side_effects` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `severe_side_effects` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contraindications` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch_or_serial_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `history_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drug_components`
--

CREATE TABLE `drug_components` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `drug_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` double(8,2) NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `user_id`, `date_of_birth`, `weight`, `height`, `image`, `phone_number`, `address`, `created_at`, `updated_at`) VALUES
(1, 1, '2001-08-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-29 17:32:31', '2023-12-29 17:32:31');

-- --------------------------------------------------------

--
-- Table structure for table `patient_drug`
--

CREATE TABLE `patient_drug` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_drugs`
--

CREATE TABLE `patient_drugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `drug_id` bigint(20) UNSIGNED NOT NULL,
  `dosage_form` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dosage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frequency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_histories`
--

CREATE TABLE `patient_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `treatment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diagnosis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_numbers`
--

CREATE TABLE `phone_numbers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middel_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male',
  `email` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middel_name`, `last_name`, `gender`, `email`, `user_name`, `user_type`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ahmed', NULL, 'Abo El-anin', 'male', 'ahmed@mail.com', 'ahmedfathi', 'patient', '$2y$12$hQKS.ydDfWqdJn4XbPy0B.UpuvSxOoMTvzSo/2fQuP3tPXmEmNp1K', NULL, '2023-12-29 05:08:27', '2023-12-29 05:08:27'),
(2, 'Mohamed', NULL, 'El-Masry', 'male', 'elmasry@mail.com', 'mohamedelmasry', 'patient', '$2y$12$hHV5V.zLlxFZZ3yAJGgtE.eLSSyE7cALOGVIrFBEx40pFC8VVk.1i', NULL, '2023-12-29 05:08:27', '2023-12-29 05:08:27'),
(3, 'Belal', NULL, 'Munir', 'male', 'belal@mail.com', 'belal', 'doctor', '$2y$12$pESodxTS0wnOLQcdM9Lg4OeYFnuOk2wVvCYYOWzWEz8p8vp6RZXZG', NULL, '2023-12-29 05:08:27', '2023-12-29 05:08:27'),
(4, 'Khalid', NULL, 'Kurish', 'male', 'khalid@mail.com', 'khalid', 'doctor', '$2y$12$wf4RpAbZDalJxHBTp.IJgO.VydZE9/.JjkPlb7KOKETBBtzO6pUJ.', NULL, '2023-12-29 05:08:27', '2023-12-29 05:08:27'),
(5, 'Ibrahim', NULL, 'El-Shikh', 'male', 'ibrahim@mail.com', 'ibrahim', 'admin', '$2y$12$qhOyQ1kTHdUpNFpShRdLbOtTlZsw2Kq1sbIhmXp7mO71VJEhsYT8W', NULL, '2023-12-29 05:08:27', '2023-12-29 05:08:27'),
(6, 'Yosef', NULL, 'Hassan', 'male', 'yosefhassan@mail', 'yosefhassan', 'admin', '$2y$12$F1FqjYwSrfBcQL6ep96cFu8FIq7O6z96IWxLz3EbosWycLIMK/gNO', NULL, '2023-12-29 05:08:27', '2023-12-29 05:08:27'),
(7, 'Yosef', NULL, 'Khamis', 'male', 'yosefkhamis@mail.com', 'yosefkhamis', 'patient', '$2y$12$f.6TC/LbpKJ6uEU93T7SBuNm6aJVvigGd.FhfSekp3ol/QGF96Nmi', NULL, '2023-12-29 05:08:27', '2023-12-29 05:08:27'),
(8, 'Mohaned', NULL, 'Mosaad', 'male', 'mohaned@mail.com', 'mohaned', 'patient', '$2y$12$v2ymPm2Fj.pDZkJxQz8/v.IMNbOsqvhPJ0a0FyaotNARPUESL6XJG', NULL, NULL, NULL),
(9, 'Mohamed', NULL, 'fathi', 'male', 'mohamedfathi@mail.com', 'mohamedfathi', 'patient', '$2y$12$fEIoltmRv8sKI8lH4Hn33uW4FX2/xrxu1sqRBC4/mkDYfFekeXw6S', NULL, '2023-12-29 02:50:34', '2023-12-29 02:50:34'),
(11, 'osama', NULL, 'ibrahim', 'male', 'osama@mail.com', 'osama', 'patient', '$2y$12$WGEMw/0v0Mp88xg7rD5wzexafalNw.bpVf5BTLO9V7Hz/TmrfqiBK', NULL, '2023-12-29 03:38:21', '2023-12-29 03:38:21'),
(22, 'yasser', NULL, 'ahmed', 'male', 'yasser@mail.com', 'yasser', 'patient', '$2y$12$OzrRbnEobDI1.5qSAThkweqjcraKiycpWEogUhGB4RXwOJB/lzjjC', NULL, '2023-12-29 17:32:31', '2023-12-29 17:32:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admins_user_id_foreign` (`user_id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_patient_id_foreign` (`patient_id`),
  ADD KEY `appointments_doctor_id_foreign` (`doctor_id`),
  ADD KEY `appointments_previous_appointment_id_foreign` (`previous_appointment_id`);

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disease_patient_history`
--
ALTER TABLE `disease_patient_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disease_patient_history_disease_id_foreign` (`disease_id`),
  ADD KEY `disease_patient_history_patient_history_id_foreign` (`patient_history_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctors_doctor_personal_id_unique` (`doctor_personal_id`),
  ADD KEY `doctors_user_id_foreign` (`user_id`);

--
-- Indexes for table `doctor_patient`
--
ALTER TABLE `doctor_patient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_patient_doctor_id_foreign` (`doctor_id`),
  ADD KEY `doctor_patient_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drugs_history_id_foreign` (`history_id`);

--
-- Indexes for table `drug_components`
--
ALTER TABLE `drug_components`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drug_components_drug_id_foreign` (`drug_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patients_user_id_foreign` (`user_id`);

--
-- Indexes for table `patient_drug`
--
ALTER TABLE `patient_drug`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_drugs`
--
ALTER TABLE `patient_drugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_drugs_patient_id_foreign` (`patient_id`),
  ADD KEY `patient_drugs_drug_id_foreign` (`drug_id`);

--
-- Indexes for table `patient_histories`
--
ALTER TABLE `patient_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_histories_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `phone_numbers`
--
ALTER TABLE `phone_numbers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_numbers_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diseases`
--
ALTER TABLE `diseases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `disease_patient_history`
--
ALTER TABLE `disease_patient_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctor_patient`
--
ALTER TABLE `doctor_patient`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drug_components`
--
ALTER TABLE `drug_components`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `patient_drug`
--
ALTER TABLE `patient_drug`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_drugs`
--
ALTER TABLE `patient_drugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_histories`
--
ALTER TABLE `patient_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_numbers`
--
ALTER TABLE `phone_numbers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_previous_appointment_id_foreign` FOREIGN KEY (`previous_appointment_id`) REFERENCES `appointments` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `disease_patient_history`
--
ALTER TABLE `disease_patient_history`
  ADD CONSTRAINT `disease_patient_history_disease_id_foreign` FOREIGN KEY (`disease_id`) REFERENCES `diseases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disease_patient_history_patient_history_id_foreign` FOREIGN KEY (`patient_history_id`) REFERENCES `patient_histories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `doctor_patient`
--
ALTER TABLE `doctor_patient`
  ADD CONSTRAINT `doctor_patient_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `doctor_patient_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drugs`
--
ALTER TABLE `drugs`
  ADD CONSTRAINT `drugs_history_id_foreign` FOREIGN KEY (`history_id`) REFERENCES `patient_histories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drug_components`
--
ALTER TABLE `drug_components`
  ADD CONSTRAINT `drug_components_drug_id_foreign` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `patient_drugs`
--
ALTER TABLE `patient_drugs`
  ADD CONSTRAINT `patient_drugs_drug_id_foreign` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `patient_drugs_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `patient_histories`
--
ALTER TABLE `patient_histories`
  ADD CONSTRAINT `patient_histories_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `phone_numbers`
--
ALTER TABLE `phone_numbers`
  ADD CONSTRAINT `phone_numbers_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
