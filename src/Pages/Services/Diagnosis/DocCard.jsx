/* eslint-disable react/prop-types */
/* eslint-disable no-unused-vars */
import { Link } from "react-router-dom";
import styles from "./DocCard.module.css"
import docImg from "../../../assets/AvatarMaker.png";
import { FaStar } from "react-icons/fa";
import { MdWork } from "react-icons/md";
function DocCard({name,spec,exp,rate,price,path}) {
  return (
    <div className={`${styles.docCard} col-md-4 col-lg-3 col-sm-7 col-12`}>
      <div className={styles.cardTop}>
        <img src={docImg} alt="doctor image" />
        <div className={styles.topText}>
          <p className={`${styles.docName} p-0 m-0`}>{name}</p>
          <p className={`${styles.docSpec} p-0 m-0`}>{spec}</p>
        </div>
      </div>
      <hr className="my-2" />
      <div className={styles.cardBottom}>
        <div className={`${styles.rate} d-flex align-items-center justify-content-center  gap-1`}>
          <FaStar className={`${styles.docIcon} text-warning`} /> {rate}
        </div>
        <div className={`${styles.exp} d-flex align-items-center  justify-content-center gap-1`}>
          <MdWork className={`${styles.docIcon} text-secondary`} /> {exp} Years
        </div>
        <Link to={path} className={styles.price}>
          {price} $
        </Link>
      </div>
    </div>
  );
}

export default DocCard;
