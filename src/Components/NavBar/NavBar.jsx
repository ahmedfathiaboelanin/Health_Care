import { useState } from "react";

import { Link } from "react-router-dom";
import styles from "./NavBar.module.css"
import circleStyles from "../HeroSection/HeroSection.module.css"
import logo from "../../assets/Luxi-Logo.png"
//gear
import { FaGear } from "react-icons/fa6";
//burger
import { RxHamburgerMenu } from "react-icons/rx";


const Logo = ({size}) => {

   return (
      <div style={{width:`${size}px`}}>
         <img src={logo} alt="" style={{width:"100%"}} />
      </div>
   ) 
}

const NavBar = () => {
   let [lang,setLang] = useState("En")
   
   let [activeLink,setActiveLink] = useState(0) // first service is active by default
   
   let [isNavShown,setIsNavShown] = useState(false)
   
   let linksContent = {
      En: [
         "home",
         "contact us",
         "about us",
         "speciality",
         "doctors"
      ],
      Ar: [
         "الرئيسية",
         "تواصل معنا",
         "من نحن",
         "اختصاصنا",
         "الأطباء"
      ]
   }
   
   let linksPaths = [
      "/",
      "/",
      "/",
      "/",
      "/"
   ]

   return (
      
      <div className="container">
         <nav className={`${styles["nav-bar"]}`}>
            <div className={styles.logo}>
               <Link 
                  to="/"
                  onClick={() => setActiveLink(0)}
               >
                  <Logo size={70}/>
               </Link>
               <h2>health care</h2>
            </div>
            {/* <ul className={`${isShown?"show-nav":"hide-nav"}`}> */}
            <div className="d-flex">
               <ul className={`${styles.links} ${isNavShown?styles["show-nav"]:styles["hide-nav"]}`}>
                  {
                     linksContent[lang].map(( str, idx) => {
                        return (
                           <li key={idx}>
                              <Link
                                 className={`${activeLink === idx? styles.active:""}`}
                                 to={linksPaths[idx]}
                                 onClick={() => setActiveLink(idx)}
                              > 
                                 {str}
                              </Link>
                           </li>
                        )
                     })
                  }
               </ul>
               <ul>
                  <li>
                     <button className={styles.icon}>
                        <FaGear/>
                     </button>
                  </li>
                  <li>
                     <button 
                        className={`${styles.icon} ${styles.burger}`}
                        onClick={() => setIsNavShown(!isNavShown)}
                        >
                        <RxHamburgerMenu/>
                     </button>
                  </li>
               </ul>
            </div>
         </nav>   
      </div>
   );
};

export default NavBar;