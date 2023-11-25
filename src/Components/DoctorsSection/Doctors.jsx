import {useState} from 'react';
// import DoctorCard from '../../Pages/Services/Diagnosis/DocCard';

import styles from "./Doctors.module.css"
import DoctorCard from '../DoctorCard/DoctorCard';

const Doctors = () => {
   
   let [lang,setLang] = useState('En')
   let [activeButton,setActiveButton] = useState(0)
   
   function clickHandler (btnId) {
      setActiveButton(btnId)
   }
   
   // aside
   // h2
   let h2Header = {
      En:"book an appointment with your doctor",
      Ar:"احجز موعد مع طبيبك"
   }

   // nav
   let specialities = {
      En: [
         "all",
         "orthopedic",
         "nutrithionalist",
         "pediatric",
         "Anesthetist",
      ],
      Ar: [
         "الكل",
         "أخصائى عظام",
         "أخصائى تغذية",
         "أخصائى أطفال",
         "أخصائى تخدير"
      ]
   }

   // let doctors = {
   //    En: [
   //       {
   //          name:"",
   //          spec:"",
   //          exp:"",
   //          rate:"",
   //          price:"",
   //          path:"/"
   //       },
   //    ],
   //    Ar: [
   //       {}
   //    ]
   // }

   return (
      <div className='container'>
         <div className={`${styles.doctors} row justify-content-center`}>
            
            <div className={`${styles.circle} d-none d-md-block`}></div>

            <aside className={`col-12 col-lg-3 text-center text-md-start`}>
               <h2> {h2Header[lang]} </h2>
               <nav>
                  <ul className={`${styles.ulStyle}`}>
                     { specialities[lang].map((str,idx) => {
                        return (
                           <li key={idx}>
                              <button 
                                 className={`${idx===activeButton? styles.active:""} text-md-start`}
                                 onClick={() => clickHandler(idx)}
                              >
                                 {str} 
                              </button>
                           </li>
                        )
                     })}
                  </ul>
               </nav>
            </aside>

            <div className={`${styles.cards} col-12 col-lg-9 row row-cols-1 row-cols-md-2`}>
               {/* <div className={`${styles.card}`}> */}
               <div>
                  <DoctorCard name="lorem ipsum .." spec="lorem lorem" exp={ 4 } rate={3.5} price={350} path="/" />
               </div>
               <div>
                  <DoctorCard name="lorem ipsum .." spec="lorem lorem" exp={ 4 } rate={3.5} price={350} path="/" />
               </div>
               <div>
                  <DoctorCard name="lorem ipsum .." spec="lorem lorem" exp={ 4 } rate={3.5} price={350} path="/" />
               </div>
               <div>
                  <DoctorCard name="lorem ipsum .." spec="lorem lorem" exp={ 4 } rate={3.5} price={350} path="/" />
               </div>
               <div>
                  <DoctorCard name="lorem ipsum .." spec="lorem lorem" exp={ 4 } rate={3.5} price={350} path="/" />
               </div>
               <div>
                  <DoctorCard name="lorem ipsum .." spec="lorem lorem" exp={ 4 } rate={3.5} price={350} path="/" />
               </div>
            </div>

         </div>
      </div>
   );
};

export default Doctors;