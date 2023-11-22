import React, { useState } from 'react';
import styles from "./Select.module.css"
import { IoMdGlobe } from 'react-icons/io';

const Select = () => {
   let options = ["English - En", "العربية - Ar"]
   
   let [isOpen,setIsOpen] = useState(false)
   let [selected,setSelected] = useState(options[0])
   
   return (
      <div className={styles.dropdown} onClick={() => setIsOpen(!isOpen)}>
         <div className={styles.textField}>
            <IoMdGlobe/>
            <input type="text" readOnly value={selected} />
            <span className={`${isOpen?styles.up:""}`}></span>
         </div>

         <div className={`${styles.options} ${isOpen? "": styles.hide}`}>
            {
               options.map( (el , idx) => {
                  return (<div key={idx} onClick={() => setSelected(el)}>
                     <IoMdGlobe/> <span> {el} </span>
                  </div>)
               })
            }            
         </div>
      </div>
   );
};

export default Select;