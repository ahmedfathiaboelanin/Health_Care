/* eslint-disable react/prop-types */
/* eslint-disable no-unused-vars */
import { Link } from "react-router-dom";
import "./DocCard.css"
import docImg from "../../../assets/AvatarMaker.png";
import { FaStar } from "react-icons/fa";
import { MdWork } from "react-icons/md";
function DocCard({name,spec,exp,rate,price,path}) {
  return (
    <div className="col-md-4 col-lg-3 col-sm-7 col-12 doc-card">
      <div className="card-top">
        <img src={docImg} alt="doctor image" />
        <div className="top-text">
          <p className="doc-name p-0 m-0">{name}</p>
          <p className="doc-spec p-0 m-0">{spec}</p>
        </div>
      </div>
      <hr className="my-2" />
      <div className="card-bottom">
        <div className="rate d-flex align-items-center justify-content-center   gap-1">
          <FaStar className="doc-icon text-warning" /> {rate}
        </div>
        <div className="exp d-flex align-items-center  justify-content-center gap-1">
          <MdWork className="doc-icon text-secondary" /> {exp} Years
        </div>
        <Link to={path} className="price">
          {price} $
        </Link>
      </div>
    </div>
  );
}

export default DocCard;
