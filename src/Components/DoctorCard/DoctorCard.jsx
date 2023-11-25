
import { Link } from "react-router-dom";
import styles from "./DoctorCard.module.css"

import docImg from "../../assets/AvatarMaker.png";
import { FaStar } from "react-icons/fa";
import { MdWork } from "react-icons/md";

function DocCard({name, imgUrl=docImg, spec, exp, rate, price, path}) {
  return (
    <div className={styles["doc-card"]}>
      <div className={styles["card-top"]}>
        <img src={imgUrl} alt="doctor image" />
        <div className={styles["top-text"]}>
          <p className={`${styles["doc-name"]} p-0 m-0`}>{name}</p>
          <p className="doc-spec p-0 m-0">{spec}</p>
        </div>
      </div>
      <hr className="my-2" />
      <div className={styles["card-bottom"]}>
        <div className="rate d-flex align-items-center justify-content-center   gap-1">
          <FaStar className="doc-icon text-warning" /> {rate}
        </div>
        <div className="exp d-flex align-items-center  justify-content-center gap-1">
          <MdWork className={`${styles["doc-icon"]} text-secondary`} /> {exp} Years
        </div>
        <Link to={path} className="price">
          {price} $
        </Link>
      </div>
    </div>
  );
}

export default DocCard;
