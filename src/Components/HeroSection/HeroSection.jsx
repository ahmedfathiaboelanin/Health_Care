import { useState } from "react";
import styles from "./HeroSection.module.css"

// image
import docImg from "./pexels-anna-shvets-4586993.jpg"
const HeroSection = () => {
   let [lang,setLang] = useState("En")
   
   let h1Content = {
      En:"Protect yourself and your family",
      Ar:"احمِ نفسك وعائلتك"
   }

   let pContent = {
      En:"Your health and wellbeing is important to us.",
      Ar:"صحتك ورفاهيتك مهمة بالنسبة لنا."
   }

   return (
      <div className="container">
         <section className={`${styles.hero} row text-center text-lg-start`}>
            <div className={`${styles["circle"]} ${styles["circle-top"]}`}></div>
            <div className={`${styles["circle"]} ${styles["circle-right"]}`}></div>
            
            <div className={`${styles["intro-col"]} col-12 col-lg-6`}>
               <h1> {h1Content[lang]} </h1>
               <p>{pContent[lang]}</p>
            </div>

            <div className={`${styles["video-col"]} col-12 col-lg-6`}>
               <div className={styles["video-div"]}>
               </div>
            </div>
            
         </section>
      </div>
   );
};

export default HeroSection;