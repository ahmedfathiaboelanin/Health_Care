
import { useState } from "react"
import styles from "./Footer.module.css"

import Select from "../SelectDropDownMenu/Select";

// logo images
import logo from "../../assets/Luxi-Logo.png"
import logoGrey from "../../assets/Luxi-Logo-grey.png"

// icons
import { TfiFacebook } from "react-icons/tfi";
import { BsLinkedin } from "react-icons/bs";
import { RiTwitterXLine } from "react-icons/ri";
import { BiLogoInstagram } from "react-icons/bi";


const LogoGrey = ({size}) => {

   return (
      <div>
         <img width={size} src={logoGrey} alt="" />
      </div>
   ) 
}

const Logo = ({size}) => {

   return (
      <div>
         <img width={size} src={logo} alt="" />
      </div>
   ) 
}

const Footer = () => {

   let [lang,setLang] = useState("En")
   let paragraphContent = {
      En: "Revolutionary medical AI website, offering personalized diagnoses, cutting-edge research updates, and seamless patient-doctor interaction for advanced healthcare solutions.",
      Ar: "موقع ويب ثوري للذكاء الاصطناعي الطبي، يقدم تشخيصات مخصصة، وتحديثات بحثية متطورة، وتفاعلًا سلسًا بين المريض والطبيب من أجل حلول الرعاية الصحية المتقدمة."
   }

   return (
      <div className="container">
         <section className={`${styles.footer} row text-center text-sm-start`}>
            <div className="col-12 col-lg-3 d-flex flex-column gap-2">

               <div className="d-flex justify-content-center justify-content-sm-start gap-2 align-items-center">
                  <LogoGrey size={80} />
                  <h2 style={{fontSize:"40px", fontWeight:"500"}}> health care </h2>
               </div>

               <p style={{lineHeight:"1.4"}}> {paragraphContent[lang]} </p>
               
               <div>
                  &copy; luxi theme {new Date().getFullYear()}
               </div>
            </div>

            <div className="col-12 col-sm-6 col-md-4 col-lg-3">
               <ul className={styles.ul}>
                  <h2 className={styles.heading}> services</h2>
                  <li className={styles.li}> <a className={styles.link} href="services/diagnosis">AI Doctor</a></li>
               </ul>
            </div>
            
            <div className="col-12 col-sm-6 col-md-4 col-lg-3">
               <ul className={styles.ul}>
                  <h2 className={styles.heading}> resources</h2>
                  <li className={styles.li}> <a className={styles.link} href="">documentation</a></li>
                  <li className={styles.li}> <a className={styles.link} href="">presentation</a></li>
                  <li className={styles.li}> <a className={styles.link} href="">related work</a></li>
               </ul>
            </div>
            
            <div className={`${styles.social} col-12 col-md-4 col-lg-3 d-flex flex-column align-items-center align-items-md-start d-lg-block`}>
               <h2 className={styles.heading}> social</h2>

               <ul className={styles.ulSocial}>
                  <li className={styles.li}> <a href=""><TfiFacebook color="var(--primary-main)"/></a> </li>
                  <li className={styles.li}> <a href=""><BsLinkedin color="var(--primary-main)"/></a> </li>
                  <li className={styles.li}> <a href=""><RiTwitterXLine color="var(--primary-main)"/></a> </li>
                  <li className={styles.li}> <a href=""><BiLogoInstagram color="var(--primary-main)"/></a> </li>
               </ul>
            
               <Select/>
            </div>

         </section>
      </div>
   )
}

export default Footer