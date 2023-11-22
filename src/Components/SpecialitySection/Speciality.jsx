import { useState } from 'react';
import styles from "./Speciality.module.css"

// Icons

// rose
import { IoIosRose } from "react-icons/io";

// import { IoRoseOutline } from "react-icons/io5";
// heart
import { FaHeart } from "react-icons/fa";
// pulse
import { IoMdPulse } from "react-icons/io";
// radio
import { LuRadio } from "react-icons/lu";
// medkit
import { IoMdMedkit } from "react-icons/io";
//contacts
import { IoMdContacts } from "react-icons/io";
//flask
import { IoFlaskSharp } from "react-icons/io5";

// import { LiaFlaskSolid } from "react-icons/lia";

const Speciality = () => {
   
   let [lang,SetLang] = useState('En')

   let h2Content = {
      En:"AI-Powered Medicine: Transforming Healthcare with Innovative Technological Solutions",
      Ar:"الطب المدعوم بالذكاء الاصطناعي: تحويل الرعاية الصحية باستخدام الحلول التكنولوجية المبتكرة"
   }
   
   let paragraphContent = {
      En: "Elevate your healthcare experience with our medical AI website. From personalized diagnoses to advanced treatments, we pioneer innovation for better patient outcomes globally.",
      Ar: "ارفع مستوى تجربتك في مجال الرعاية الصحية من خلال موقعنا الإلكتروني للذكاء الاصطناعي الطبي. بدءًا من التشخيصات الشخصية وحتى العلاجات المتقدمة، نحن رائدون في الابتكار لتحقيق نتائج أفضل للمرضى على مستوى العالم."
   } 

   let ulContent = {
      En: [
            "ai doctor",
            "symptoms diagnosis",
            "brain tumor",
            "skin cancer",
            "drug interactions",
            "chat bot",
            "bone fracture",
            "soon!"
      ],
      Ar: [
            "الطبيب الذكى",
            "تشخيص الأعراض",
            "ورم المخ",
            "سرطان الجلد",
            "تفاعل الأدوية",
            "روبوت الدردشة",
            "كسر العظام",
            "!قريبا"
      ]
   } 
   let routingPages = [
      "services/diagnosis",
      "link",
      "link",
      "link",
      "link",
      "link",
      "link",
      "link"
   ]
   let ourSpeciality = {
      En:"our speciality",
      Ar:"اختصاصنا"
   }
   
   return (
      <div className='container-fluid container-md'>
         <section className={`${styles.speciality} row`}>
            
            <div className={`col-12 col-lg-6 row justify-content-center align-items-center`}>
               <div className={`${styles.solarSystem}`}>
                  
                  <div className={styles.outer}>
                     <span className={styles.spanIcon} style={{backgroundColor:"var(--secondary-main)", "--rotate-degree":"0deg", padding:"15px"}}>
                        <IoMdMedkit color='white' size={60}/>
                     </span>

                     <span className={styles.spanIcon} style={{backgroundColor:"var(--tertiary-main)", "--rotate-degree":"225deg"}}>
                        <IoMdContacts color='white' size={35}/>
                     </span>

                     <span className={styles.spanIcon} style={{backgroundColor:"var(--primary-main)", "--rotate-degree":"315deg", padding:"15px"}}>
                        <IoFlaskSharp color='white' size={60}/>
                     </span>
                  </div>

                  <div className={styles.middle}>
                     <span className={styles.spanIcon} style={{backgroundColor:"var(--tertiary-main)", "--rotate-degree":"45deg"}}>
                        <FaHeart color='white'/>
                     </span>

                     <span className={styles.spanIcon} style={{backgroundColor:"var(--primary-main)", "--rotate-degree":"80deg"}}>
                        <IoIosRose color='white' size={40}/>

                     </span>
                     
                     <span className={styles.spanIcon} style={{backgroundColor:"var(--tertiary-main)", "--rotate-degree":"150deg", padding:"15px"}}>
                        <IoMdPulse color='white' size={80}/>
                     </span>

                     <span className={styles.spanIcon} style={{backgroundColor:"var(--secondary-main)", "--rotate-degree":"225deg"}}>
                        <LuRadio color='white' size={50}/>
                     </span>
                     
                  </div>

                  <div className={styles.inner}>
                     {ourSpeciality[lang]}
                  </div>


               </div>
            </div>
            
            <div className={`col-12 col-lg-6 row align-items-center`}>
               <div className={`${styles.content}`}>
                  
                  <h2>{h2Content[lang]}</h2>
                  <p> {paragraphContent[lang]} </p>
                  <ul>
                     {
                        ulContent[lang].map((el,idx) => {
                           return (
                              <li key={idx}>
                                 <a href={routingPages[idx]}> {el} </a>
                              </li>
                           )
                        })
                     }
                  </ul>
               </div>
            </div>
         </section>
      </div>
   );
};

export default Speciality;